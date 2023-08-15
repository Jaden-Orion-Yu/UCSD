function my_plot(x, y, label_x, label_y, title_string)
% MY_PLOT: produces customized plot based on inputs
% Call format: my_plot(x, y, label_x, label_y, title_string)

figure;
plot(x, y,'-rd', 'LineWidth', 2, 'MarkerFaceColor', 'r', 'MarkerSize', 5);
xlabel(label_x);
ylabel(label_y);
title(title_string);
set(gca, 'FontSize', 16);

end % function my_plot