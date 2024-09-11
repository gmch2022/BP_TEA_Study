% 创建 ValueClass 对象
valueObj = ValueClass(10);

% 调用成员函数修改属性
valueObj = valueObj.SetValue(20);

% 显示修改后的属性值
disp(valueObj.Value); % 应该显示 20


value = valueObj.SetValue2(55);
disp(value)
disp(valueObj.Value2);