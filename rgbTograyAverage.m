function out = rgbTograyAverage(image)

% formula for the lightness method
% (R + G + B) / 2

% get row & col of input image
[row, col, cha] = size(image);

% initialize output gray image
out = zeros(row, col);

for j = 1:row
    for i = 1:col
        R = image(j, i, 1);
        G = image(j, i, 2);
        B = image(j, i, 3);
        out(j, i) = (R + G + B) / 3;
    end
end

end