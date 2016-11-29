function res = average_filter(data, window)
    
    shape = size(data);
    for i = 1:shape(1)
        res = zeros(shape);
        if i >= ceil(window/2) && i <= shape(1)-floor(window/2)
            value = mean(data(i-floor(window/2):i+floor(window/2)));
            res(i) = value;
        elseif i < ceil(window/2)
            value = mean(data(1:i+floor(window/2)));
            res(i) = value;
        elseif i > shape(1)-floor(window/2)
            value = mean(data(i-floor(window/2):end));
            res(i) = value;
        end 
    end
end