function A_Op = PSP_Operators(d)
%d is the dimension of the Hilbert Space.
%Generate the set of phase-space point operators
dp = 1;
w  = exp(2 * pi * i / d);
tau = exp((d+1) * pi * i / d);
A0 =  zeros(d);
X=GenPauli(1,0,d);
Z=GenPauli(0,1,d); 
for a1 = 1:d  
    for a2 = 1:d
        T(:,:,a1,a2) = tau^(-(a1-dp) * (a2-dp)) * Z^(a1-dp) * X^(a2-dp);
        A0 = A0 + T(:,:,a1,a2) ;
    end   
end
A0 = A0 / d;

for a1 = 1:d
    for a2 = 1:d     
        A(:,:,a1,a2) = T(:,:,a1,a2) * A0 * T(:,:,a1,a2)';        
    end  
end
A_Op = A;

end