function Wigner_F = WF(psp_op, E)
d = size(E,1);
for a1 = 1:d
    for a2 = 1:d
        Wigner_F(a1,a2) = real(trace(psp_op(:,:,a1,a2)*E))/d;
    end   
end
end