function posNCC = ncc(target, template)

% template matching using NCC

% convert to double
target = double(target);
template = double(template);

% get size
[rTar, cTar] = size(target);
[rTem, cTem] = size(template);

% initialize values
P = zeros(rTar - rTem + 1, cTar - cTem + 1);
posNCC = zeros(1, 3);
maxNCC = 0;

for j = 1 : (rTar - rTem + 1)
    for i = 1 : (cTar - cTem + 1)
        
        % reference in target
        ref = target(j:(j + rTem - 1), i:(i + cTem - 1));
        
        %% NCC algorithm
        
        % initialize values
        NCC = 0; val1 = 0; val2 = 0; val3 = 0;
        
        for y = 1:rTem
            for x = 1:cTem
                
                % parts of dot product 
                val1 = val1 + template(y, x) * ref(y, x);
                
                val2 = val2 + (template(y, x))^2;
                
                val3 = val3 + (ref(y, x)^2);
                
            end
        end
        
        NCC = val1 / (sqrt(val2) * sqrt(val3));
        
        % store minimum value & its position
        if maxNCC < NCC
            maxNCC = NCC;
            posNCC = [j, i, NCC];
        end
        
        % option: similarity map
        P(j, i) = NCC;
            
    end
end

posNCC
figure; surf(P); title('NCC');

end
                