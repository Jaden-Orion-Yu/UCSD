load('lab8_part2_control.mat')

H_offset = mean(Hchb) - mean(Hamb);
T_offset = mean(Tchb) - mean(Tamb);