clc;
clear;
close all;

fi_1 = fopen('temp','rb');
x_inter_1 = fread(fi_1, 'float32');

% if data is complex
x_1 = x_inter_1(1:2:end) + 1i*x_inter_1(2:2:end);
figure;
plot(abs(x_1));
grid on;