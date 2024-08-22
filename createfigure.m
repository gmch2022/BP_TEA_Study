function createfigure(X1, Y1)
% % This fuction is used to draw the figure of singal situmlition 
% % and the last pattern has been saved : ��ӭ
%CREATEFIGURE(X1, Y1)
%  X1:  x ���ݵ�����
%  Y1:  y ���ݵ�����

%  �� MATLAB �� 09-May-2023 04:27:59 �Զ�����

% ���� figure
figure1 = figure('InvertHardcopy','off','Color',[1 1 1]);

% ���� axes
axes1 = axes('Parent',figure1,'Position',[0.13 0.11 0.775 0.815]);
hold(axes1,'on');

% ���� plot
plot(X1,Y1,'DisplayName','MAP','Marker','o',...
    'Color',[0.490196078431373 0.180392156862745 0.56078431372549]);

% ȡ�������е�ע���Ա����������� X ��Χ
% xlim(axes1,[0.871414421844271 3.12469602860953]);
% ȡ�������е�ע���Ա����������� Y ��Χ
% ylim(axes1,[92.7621269920202 109.66173904276]);
% ȡ�������е�ע���Ա����������� Z ��Χ
% zlim(axes1,[-1 1]);
box(axes1,'on');
grid(axes1,'on');
% ������������������
set(axes1,'FontName','arial','FontWeight','bold','XTick',[1 2 3],...
    'XTickLabel',{'','',''});
% ���� legend
legend1 = legend(axes1,'show');
set(legend1,'FontSize',10);

