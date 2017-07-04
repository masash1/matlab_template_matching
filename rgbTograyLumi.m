function out = rgbTograyLumi(image)

% formula for the lightness method
% 0.21xR + 0.72xG + 0.07xB

% get row & col of input image
[row, col, cha] = size(image);

% initialize output gray image
out = zeros(row, col);

for j = 1:row
    for i = 1:col
        R = image(j, i, 1);
        G = image(j, i, 2);
        B = image(j, i, 3);
        out(j, i) = 0.21*R + 0.72*G + 0.07*B;
    end
end

end