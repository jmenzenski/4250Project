function [y] = thresholdMatrix(x,threshold)
% This function takes a matrix and thresholds it based on the threshold
% value passed as an input. 
% The threshold is dones based on the absolute values of the matrix

x = abs(x);
s = size(x);

for i= 1:s(1)
    for j = 1:s(2)
        if(x(i,j) < threshold)
            x(i,j) = 0;
        end
    end
end

y = x;

end