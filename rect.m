function [y] = rect(f,center,width)

%returns a y rect vector with a given center and width. 
y = f;
y(abs(y) < center-width/2) = 0;
y(abs(y) > center+width/2)  = 0;
y(~(abs(y) < center-width/2) ) = 1;
y(~(abs(y) < center-width/2)) = 1;


end

