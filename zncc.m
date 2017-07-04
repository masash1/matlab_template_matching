function posZNCC = zncc(target, template)

% template matching using ZNCC

% convert to double
target = double(target);
template = double(template);

% get size
[rTar, cTar] = size(target);
[rTem, cTem] = size(template);

% initialize values
P = zeros(rTar - rTem + 1, cTar - cTem + 1);
posZNCC = zeros(1, 3);
maxZNCC = 0;

% prepare mean of template
meanTem = mean(mean(template));

for j = 1 : (rTar - rTem + 1)
    for i = 1 : (cTar - cTem + 1)
        
        % reference in target
        ref = target(j:(j + rTem - 1), i:(i + cTem - 1));
        
        %% ZNCC algorithm
        
        % initialize values
        ZNCC = 0; val1 = 0; val2 = 0; val3 = 0;
        
        % prepare mean of reference
        meanRef = mean(mean(ref));
        
        for y = 1:rTem
            for x = 1:cTem
                
                % parts of dot product 
                val1 = val1 + (template(y, x) - meanTem) * (ref(y, x) - meanRef);
                
                val2 = val2 + (template(y, x) - meanTem)^2;
                
                val3 = val3 + (ref(y, x) - meanRef)^2;
                
            end
        end
        
        ZNCC = val1 / (sqrt(val2) * sqrt(val3));
        
        % store minimum value & its position
        if maxZNCC < ZNCC
            maxZNCC = ZNCC;
            posZNCC = [j, i, ZNCC];
        end
        
        % option: similarity map
        P(j, i) = ZNCC;
            
    end
end

posZNCC
figure; surf(P); title('ZNCC');

end
                