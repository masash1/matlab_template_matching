function out = rgbTograyLightness(image)

% formula for the lightness method
% (max(R, G, B) + min(R, G, B)) / 2

% get row & col of input image
[row, col, cha] = size(image);

% initialize output gray image
out = zeros(row, col);

for j = 1:row
    for i = 1:col
        maxP = max(image(j, i, :));
        minP = min(image(j, i, :));
        out(j, i) = (maxP + minP) / 2;
    end
end

end
        


