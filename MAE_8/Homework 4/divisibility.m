function div = divisibility(a)
%DIVISIBILITY 
%   Divisibility takes input 'a' and checks if it is divisible by the
%   numbers in vector 'div = [3, 5, 7, 11, 13]'. example: divisible(14) =
%   [0,0,1,0,0]

div = [3,5,7,11,13];

% for i = 1:length(div)
%     if rem(div(i), a) > 0
%         div(i) = 0;
%     else
%         div(i) = 1;
%     end
% end

% div(rem(div,a) > 0) = 0;
% div(rem(div,a) == 0) = 1;

div = mod(a,div);
div(div > 0)=10000000000;
div(div == 0) = 1;
div(div > 1) = 0;


end

