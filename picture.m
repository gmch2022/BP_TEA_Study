% ��һ������
group1 = [0.5565 
0.5518 
0.5456 
0.5305 
0.5303 
0.5294 
0.5290 
0.5292 
0.5230 
0.4245 
0.4251 
0.4182 
0.4195 
0.4200 
0.4180 
];

% �ڶ�������
group2 = [0.5531 
0.5478 
0.5454 
0.5315 
0.5285 
0.5243 
0.5312 
0.5287 
0.5268 
0.4255 
0.4241 
0.4165 
0.4223 
0.4185 
0.4195 
];

% ����������
group3 = [0.5518 
0.5456 
0.5424 
0.5303 
0.5309 
0.5273 
0.5293 
0.5230 
0.5209 
0.4251 
0.4215 
0.4187 
0.4218 
0.4180 
0.4099 
];


% ����ƽ��ֵ�ͱ�׼��
mean_group1 = mean(group1);
std_group1 = std(group1);

mean_group2 = mean(group2);
std_group2 = std(group2);

mean_group3 = mean(group3);
std_group3 = std(group3);

% % ִ�з��������ANOVA��
% p_value = anova1([group1, group2, group3], [], 'off');
% 
% % ��������ͼ
% boxplot([group1, group2, group3], 'Labels', {'��Ԥǰ', '��Ԥ�ڼ�', '��Ԥ��'});
% title('Ѫѹ���ݵ�����ͼ');

% ��������ͼ
x = 1:3; % ������
y = [mean_group1, mean_group2, mean_group3]; % ƽ��ֵ
error = [std_group1, std_group2, std_group3]; % ��׼��

errorbar(x, y, error, '-o', 'LineWidth', 1.5, 'MarkerSize', 8);

% ���ú������ǩ
xticks(x);
xticklabels({'��Ԥǰ', '��Ԥʱ', '��Ԥ��'});

% �����������ǩ
ylabel('ƽ��ֵ');

% ����ͼ����
title('��������ƽ��ֵ�ı仯');






