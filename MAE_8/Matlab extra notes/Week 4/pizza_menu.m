function pizza_menu % no input or output necessary because it requires interaction
%PIZZA_MENU Summary of this function goes here
%   Detailed explanation goes here
pizza_type = menu('What type of pizza do you want?', 'meat', 'veggie');

switch pizza_type
    case 1 % meat
        meat_type = menu('What type of meat do you want?', 'meatball', 'pepperoni', 'sausage');
        switch meat_type
            case 1
                disp('You ordered a meatball pizza');
            case 2
                disp('You ordered a pepperoni pizza');
            case 3
                disp('You ordered a sausage pizza');
            otherwise
                disp('invalid order!');
        end % switch on line 9
    case 2 % veggie
        % veggie_type = menu('What type of veggie do you want?', 'onion', 'pepper', 'tomato');
        switch menu('What type of veggie do you want?', 'onion', 'pepper', 'tomato') % veggie_type     ---> %%% you do not need an intermediate variable %%%
            case 1 
                disp('You ordered an onion pizza');
            case 2 
                disp('You ordered a pepper pizza');
            case 3
                disp('You ordered a tomato pizza');
            otherwise
                disp('invalid order!!');
        end % switch on line 21
    otherwise
        disp('invalid order');
end % switch on line 6

end % function