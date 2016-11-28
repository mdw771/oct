function plot_show(data, col)

    shape = size(data);
    figure('Position', [100, 100, 1200, 500]);
    subplot(1, 2, 1);
    image(data, 'CDataMapping', 'scaled');
    axis equal
    axis([0, shape(2), 0, shape(1)])
    hold on 
    line([col, col], [0, shape(1)], 'Color', 'white', 'LineWidth', 1)
    
    subplot(1, 2, 2);
    y = data(:, col);
    plot(y);
    xlabel('Pixel index')
    ylabel('Amplitude')

end

