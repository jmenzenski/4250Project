function [weight_vector] = basis_decomposition(vector,basis_set)
%assume each column in the basis_set is a basis vector. The vector is the
%one that needs to be decomposed into the basis set. 


%The returned vector is the least mean square approximation of the basis
%decompostion of the given vector. 


A = [];
B = [];
[max_j max_i] = size(basis_set);
temp_val = [];

for i = 1:max_i
    temp_row = [];
    for j = 1:max_i
        temp_val = (basis_set(:,i)')*(basis_set(:,j));
        temp_row = [temp_row temp_val];
    end
    A = [A; temp_row];
    temp_val = (vector')*(basis_set(:,i));
    B = [B ; temp_val];
end
weight_vector = A\B;
end