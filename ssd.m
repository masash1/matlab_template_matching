function posSSD = ssd(target, template)

% template matching using SSD

% convert to double
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
posSSD = zeros(1, 3);
minSSD = 100000;

for j = 1 : (rTar - rTem + 1)
    for i = 1 : (cTar - cTem + 1)
        
        % reference in target
        ref = target(j:(j + rTem - 1), i:(i + cTem - 1));
        
        %% SSD algorithm
        
        SSD = 0;
        for y = 1:rTem
            for x = 1:cTem
                SSD = SSD + (template(y, x) - ref(y, x)).^2;
            end
        end
        
        % store minimum value & its position
        if minSSD > SSD
            minSSD = SSD;
            posSSD = [j, i, SSD];
        end
        
        % option: diff map
        P(j, i) = SSD;
            
    end
end

posSSD
figure; surf(P); title('SSD');

end
                