
mean = [66.222 	64.061 	64.60 

];

mean_group1 = mean(1);
mean_group2 = mean(2);
mean_group3 = mean(3);


% % 执行方差分析（ANOVA）
% p_value = anova1([group1, group2, group3], [], 'off');
% 
% % 生成箱线图
% boxplot([group1, group2, group3], 'Labels', {'干预前', '干预期间', '干预后'});
% title('血压数据的箱线图');

% 绘制折线图
x = 1:3; % 横坐标
y = [mean_group1, mean_group2, mean_group3]; % 平均值

createfigure(x,y);hold on

% 设置y轴范围







