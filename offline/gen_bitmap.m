function [ph_bitmap, select_mask] = gen_bitmap(filename, n, epsilon, r)
%% generate  bitmap and select mask
% filename = 'MD5-bin.txt';
% epsilon = 0.2;
% n = 3;
% r = 2;

m = int8(n*log2(exp(1))*log2(1/epsilon));
k = int8(m*log(2/n));
l = int8(log2(double(m)));
k = 1;

% load file
fi = fopen(filename);

ph_bitmap = zeros(1,n);
select_mask = [];
for i = 1:1:n
    current_md5 = fgetl(fi);
    hash_value_bin = current_md5(r:r+l-1);
    hash_value = bin2dec(hash_value_bin);
    ph_bitmap(i) = hash_value;
    select_mask = [select_mask;hash_value_bin];
end

end