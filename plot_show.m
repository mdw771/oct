function plot_show(data, col, crange)

    shape = size(data);
    figure('Position', [100, 100, 1200, 500]);
    g = subplot(1, 2, 1);
    get(g, 'position')
    if exist('crange', 'var')
        imagesc(data, crange);
    else
        image(data, 'CDataMapping', 'scaled');
    end
    axis equal
    axis([0, shape(2), 0, shape(1)])
    hold on 
    line([col, col], [0, shape(1)], 'Color', 'white', 'LineWidth', 1)
    
    g = subplot(1, 2, 2);
    set(g, 'position', [0.5703, 0.3100, 0.3347, 0.415]);
    y = data(:, col);
    plot(y);
    xlabel('Pixel index')
    ylabel('Amplitude')

end

