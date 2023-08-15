function myplot(x,y,label_x,label_y,title_string)
%MYPLOT: produces customized plot based on inputs
%   call format: myplot(x,y,label_x,label_y,title_string)
figure;
plot(x,y,'-rd','LineWidth' , 2, 'MarkerFaceColor','r', 'MarkerSize', 5);
xlabel(label_x)
ylabel(label_y)
tile(title_string);
set(gca, 'Fontsize',16);


end %function myplot

