function out = sad(target, template)

% template matching using SAD

% convert from uint8 to double
target = double(target);
template = double(template);

% get size
[rTar, cTar] = size(target);
[rTem, cTem] = size(template);

% normalize data
%target = target - mean(mean(target));
%template = template - mean(mean(template));

%target = (target - min(min(target))) / (max(max(target)) - min(min(target)));
%template = (template - min(min(template))) / (max(max(template)) - min(min(template)));

% initialize values
P = zeros(rTar - rTem + 1, cTar - cTem + 1);
posSAD = zeros(1, 3);
minSAD = 100000;

for j = 1 : (rTar - rTem + 1)
    for i = 1 : (cTar - cTem + 1)
        
        % reference in target
        ref = target(j:(j + rTem - 1), i:(i + cTem - 1));
        
        % SAD algorithm
        SAD = 0;
        for y = 1:rTem
            for x = 1:cTem
                SAD = SAD + abs(template(y, x) - ref(y, x));
            end
        end
        
        % diff map
        P(j, i) = SAD;
        
        % store minimum value & its position
        if minSAD > SAD
            minSAD = SAD;
            posSAD = [j, i, SAD];
        end
            
    end
end

posSAD
figure;
surf(P)

end
                