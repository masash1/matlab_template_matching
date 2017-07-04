function out = rgbTograyMat(image)

% formula for the lightness method
% 0.2989xR + 0.5870xG + 0.1140xB

% get row & col of input image
[row, col, cha] = size(image);

% initialize output gray image
out = zeros(row, col);

for j = 1:row
    for i = 1:col
        R = image(j, i, 1);
        G = image(j, i, 2);
        B = image(j, i, 3);
        out(j, i) = 0.2989*R + 0.587*G + 0.114*B;
    end
end

end