%     temp = zeros([length*2, 1]);
%     temp(1:length) = fft(i);
%     i = real(ifft(temp));


% for row = 1:shape(1)
%     i = data(row, :);
%     i = i - mean(i);
%     i = abs(fft(i));
%     data(row, :) = i;
% end
% 
% plot_show(data, 500);