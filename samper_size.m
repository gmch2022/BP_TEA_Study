% 显著性水平
alpha = 0.05;

% 统计功效
power = 0.8;

% 效应大小（需要根据实际情况提供）
effect_size = 0.5; % 举例，需要根据实际数据或文献中的估计提供

% 样本量计算
sample_size = sampsizepwr('t2', [], effect_size, [], 'Alpha', alpha, 'Power', power);

% 输出结果
disp(['需要的样本量（每组）：', num2str(round(sample_size))]);

