% ������ˮƽ
alpha = 0.05;

% ͳ�ƹ�Ч
power = 0.8;

% ЧӦ��С����Ҫ����ʵ������ṩ��
effect_size = 0.5; % ��������Ҫ����ʵ�����ݻ������еĹ����ṩ

% ����������
sample_size = sampsizepwr('t2', [], effect_size, [], 'Alpha', alpha, 'Power', power);

% ������
disp(['��Ҫ����������ÿ�飩��', num2str(round(sample_size))]);

