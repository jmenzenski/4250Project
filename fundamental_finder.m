function [y] = fundamental_finder(x,F)
% Takes in a matrix, finds the max index in each column and applies this to
% the vector F to find the corresponding max frequencies. 


s = size(x);
y = [];


for i = 1:s(2)
    temp = find(x(:,i) == max(x(:,i)));
    temp = temp(1);
    y = [y F(temp)];
end

end