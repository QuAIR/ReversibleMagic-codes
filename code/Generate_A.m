function An = Generate_A(dim, num_copy)

d = dim; % dimension
dp = 1; % used for the field Z_d for generating Heisenberg-Weyl operators
X  = GenPauli(1,0,d);
Z  = GenPauli(0,1,d);
w  = exp(2 * pi * 1i / d);

T1 = {};
% 1-copy Heisenberg-Weyl operators T
for a1 = 1:d
    for a2 = 1:d
        T1{end+1} = w^(-(a1-dp) * (a2-dp) * 2) * Z^(a1-dp) * X^(a2-dp);
    end
end

% n-copy phase-space point operators
c=1;
Tn = T1;
while c<num_copy
    Ttemp = {};
    for i=1:length(Tn)
        for j=1:d^2
            Ttemp{end+1} = Tensor(Tn{i}, T1{j});
        end
    end
    Tn = Ttemp;
c = c+1;
end

% n-copy A
An = {};
A0 = zeros(d^num_copy);
for i=1:length(Tn)
    A0 = A0 + Tn{i};
end
A0 = A0/d^num_copy;

for j=1:length(Tn)
    An{end+1} = Tn{j} * A0 * Tn{j}';
end
end