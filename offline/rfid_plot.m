clc;
clear;
close all;
 
fi_1 = fopen('send.bin','rb');
x_inter_1 = fread(fi_1, 'uchar');

figure;
plot(abs(x_inter_1));
grid on;