% ���� ValueClass ����
valueObj = ValueClass(10);

% ���ó�Ա�����޸�����
valueObj = valueObj.SetValue(20);

% ��ʾ�޸ĺ������ֵ
disp(valueObj.Value); % Ӧ����ʾ 20


value = valueObj.SetValue2(55);
disp(value)
disp(valueObj.Value2);