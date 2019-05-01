clc;
clear;
close all;
%%
filename = 'MD5-bin.txt';
epsilon = 0.3;
n = 3;
r = 2;
[ph_bitmap, select_mask] = gen_bitmap(filename, n, epsilon, r);


m = int8(n*log2(exp(1))*log2(1/epsilon));
k = int8(m*log(2/n));
l = int8(log2(double(m)));

%% write file
% select
ACTION = [0,0,0];
MEMBANK = [1, 1];
POINTER = de2bi(r,8,'left-msb');
LENGTH = de2bi(m,8,'left-msb');
% query
SEL = [1, 1];
SESSION = [0, 0];
Q = [0, 0, 0, 0];
%
SETTING = [];
for i = 0:1:m-1
    select.ACTION = ACTION;
    select.MEMBANK = MEMBANK;
    select.POINTER = POINTER;
    select.LENGTH = LENGTH;
    select.MASK = de2bi(i,8,'left-msb');
    query.SEL = SEL;
    query.SESSION =SESSION;
    query.Q = Q;
    current_SETTING.Select = select;
    current_SETTING.Query = query;
    SETTING = [SETTING, current_SETTING];
end
output.RFIDSETTING = SETTING;
setting_file =  fopen('rfid-setting.json','w');
json = jsonencode(output);
fprintf(setting_file, '%s', json);

