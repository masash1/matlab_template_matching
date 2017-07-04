function resultBox(target, template, pos)

% plot position of result window

% get size of images (gray-scale)
[r1, c1] = size(target);
[r2, c2] = size(template);

% start point
y = pos(1);
x = pos(2);

% initialize result
%result = zeros(r1, c1);

% set box
% y-axis
for j = y
    for i = x : x + c2 - 1
        target(j, i) = 255;
    end
end

for j = y + r2 - 1
    for i = x : x + c2 - 1
        target(j, i) = 255;
    end
end

% x-axis
for i = x
    for j = y + 1 : y + r2 - 2
        target(j, i) = 255;
    end
end

for i = x + c2 - 1
    for j = y + 1 : y + r2 - 2
        target(j, i) = 255;
    end
end

figure; imshow(target)

end


