
mean = [66.222 	64.061 	64.60 

];

mean_group1 = mean(1);
mean_group2 = mean(2);
mean_group3 = mean(3);


% % ִ�з��������ANOVA��
% p_value = anova1([group1, group2, group3], [], 'off');
% 
% % ��������ͼ
% boxplot([group1, group2, group3], 'Labels', {'��Ԥǰ', '��Ԥ�ڼ�', '��Ԥ��'});
% title('Ѫѹ���ݵ�����ͼ');

% ��������ͼ
x = 1:3; % ������
y = [mean_group1, mean_group2, mean_group3]; % ƽ��ֵ

createfigure(x,y);hold on

% ����y�᷶Χ







