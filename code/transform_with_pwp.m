function cost = transform_with_pwp(input_state, output_state, psp_op_channel, epsilon)

d = numel(input_state(1, :));

cvx_begin sdp quiet
variable JN1(d^2, d^2) complex semidefinite
variable JN2(d^2, d^2) complex semidefinite
variable c1 nonnegative
variable c2 nonnegative

HPTP_JN = JN1 - JN2;
WF_HPTP = WF_channel_cvx(psp_op_channel, HPTP_JN, d);
WF_1 = WF_channel_cvx(psp_op_channel, JN1, d);
WF_2 = WF_channel_cvx(psp_op_channel, JN2, d);

cost = c1 + c2;

minimize cost
subject to

    Fidelity(ApplyMap(input_state, HPTP_JN), output_state) >= 1 - epsilon;
    
    % PWP
    for i = 1:length(WF_1)
        for j = 1:length(WF_1)
            WF_1(i,j) >= 0;
            WF_2(i,j) >= 0;
            WF_HPTP(i, j) >= 0;
        end
    end

    % TP
    PartialTrace(JN1, 2, [3 3]) == c1 * eye(d);
    PartialTrace(JN2, 2, [3 3]) == c2 * eye(d);
    c1 - c2 == 1;

cvx_end

cost = full(cost);

end