function createfigure(X1, Y1)
% % This fuction is used to draw the figure of singal situmlition 
% % and the last pattern has been saved : 人迎
%CREATEFIGURE(X1, Y1)
%  X1:  x 数据的向量
%  Y1:  y 数据的向量

%  由 MATLAB 于 09-May-2023 04:27:59 自动生成

% 创建 figure
figure1 = figure('InvertHardcopy','off','Color',[1 1 1]);

% 创建 axes
axes1 = axes('Parent',figure1,'Position',[0.13 0.11 0.775 0.815]);
hold(axes1,'on');

% 创建 plot
plot(X1,Y1,'DisplayName','MAP','Marker','o',...
    'Color',[0.490196078431373 0.180392156862745 0.56078431372549]);

% 取消以下行的注释以保留坐标区的 X 范围
% xlim(axes1,[0.871414421844271 3.12469602860953]);
% 取消以下行的注释以保留坐标区的 Y 范围
% ylim(axes1,[92.7621269920202 109.66173904276]);
% 取消以下行的注释以保留坐标区的 Z 范围
% zlim(axes1,[-1 1]);
box(axes1,'on');
grid(axes1,'on');
% 设置其余坐标区属性
set(axes1,'FontName','arial','FontWeight','bold','XTick',[1 2 3],...
    'XTickLabel',{'','',''});
% 创建 legend
legend1 = legend(axes1,'show');
set(legend1,'FontSize',10);

