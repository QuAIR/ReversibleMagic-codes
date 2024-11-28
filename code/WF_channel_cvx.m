function Wigner_F = WF_channel_cvx(psp_op, E, d)
for a1 = 1:length(E)
    for a2 = 1:length(E)
        t = tensor(psp_op{a1}.' , psp_op{a2});
        Wigner_F(a1, a2) = real(trace(t * E))/d;
    end
end

end
