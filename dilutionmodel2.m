clc
clear all
close all

opengl hardware
set(0,'DefaultLineLineSmoothing','on');
set(0,'DefaultPatchLineSmoothing','on');
opengl('OpenGLLineSmoothingBug',1);


data=importdata('D:\Cong\KTH\PhD2\Classification\Journals\PaperI\Figures.xlsx');
data = data.data;
data = data.Blad2_4;

OT = data(1:9,[6 3]);
IT1 = data(1:9, [6 4]);
IT2 = data(1:9, [6 5]);

Q=0.4:0.1:4;
C=40./Q;
L=10*ones(length(Q),1);

ACH=20:10:120;
xtick=ACH*(6.3*6.4*3.0)/3600;
xticklabel = [20 40 60 100]*(6.3*6.4*3.0)/3600;

% plot properties 
linewidth = 2.5;
fontsize = 16;
markersize = 120;
% -------------
% Figure properties 
xwidth = 42;    % cm - width of A4 paper
ywidth = 14;     % cm -
NUM = 3;        % number of subplots
% -------------


figure(1)
hFig = figure(1);
set(gcf,'PaperPositionMode','auto','Units','centimeters');
set(hFig,'Position',[4 4 xwidth ywidth]);    % [left bottom width height]


gap_left = 0.05; gap_between = 0.09; gap_bottom = 0.15;
width = 0.25; height = 0.75;
space = gap_between + width; % make sure space <= (100%-2*gap0) / 7 = ;


    
for i=1:NUM
    
    axs = subplot(1,3,i,'Position',[gap_left+(i-1)*space, gap_bottom, width, height]);
    hold on
    
    set(gca,'YScale','log','XScale','log')
    set(gca,'XMinorTick','on','YMinorTick','on');
    set(gca,'LineWidth',linewidth/2,'FontSize',fontsize);
    

    xlabel('ACH','FontSize',fontsize-1,'FontWeight','bold','Color','k');
    ylabel('CFU / m^3','FontSize',fontsize-1,'FontWeight','bold','Color','k');
    box on

    h0 = plot(Q,C,'k:','LineWidth',linewidth);
    hold on
    plot(Q,L,'k--')
    
    if i==1
        scatter(OT(1:3,1),OT(1:3,2), markersize,'b','filled','s'); %,'LineWidth',6);
        line(OT(1:3,1),OT(1:3,2),'LineStyle','--','LineWidth',linewidth-1,'Color','b');
        
        scatter(OT(4:6,1),OT(4:6,2), markersize,'r','filled','^');
        line(OT(4:6,1),OT(4:6,2),'LineStyle','--','LineWidth',linewidth-1,'Color','r');
        
        scatter(OT(7:9,1),OT(7:9,2), markersize,'g','filled','d'); %,'LineWidth',12)
        line(OT(7:9,1),OT(7:9,2),'LineStyle','--','LineWidth',linewidth-1,'Color','g');

        set(gca,'YLim',[0.01 100]);
        text(0.3,1.1,'Operating Table','FontSize',fontsize,'FontWeight','bold','Color','k','Units','normalized');
    end
    
    if i==2
        h1 = scatter(IT1(1:3,1),IT1(1:3,2), markersize,'b','filled','s');
        line(IT1(1:3,1),IT1(1:3,2),'LineStyle','--','LineWidth',linewidth-1,'Color','b');
        
        h2 = scatter(IT1(4:6,1),IT1(4:6,2), markersize,'r','filled','^');
        line(IT1(4:6,1),IT1(4:6,2),'LineStyle','--','LineWidth',linewidth-1,'Color','r');
        
        h3 = scatter(IT1(7:9,1),IT1(7:9,2), markersize,'g','filled','d'); 
        line(IT1(7:9,1),IT1(7:9,2),'LineStyle','--','LineWidth',linewidth-1,'Color','g');

        set(gca,'YLim',[0.01 100]);
        text(0.27,1.1,'Instrument Table 1','FontSize',fontsize,'FontWeight','bold','Color','k','Units','normalized');
        
        %[leg,objects] = legend([h3 h2 h1 h0],' LAF',' TAF',' Mixing',' Analytical');
        
    end
    
    if i==3
        h1=scatter(IT2(1:3,1),IT2(1:3,2), markersize,'b','filled','s');
        line(IT2(1:3,1),IT2(1:3,2),'LineStyle','--','LineWidth',linewidth-1,'Color','b');
        
        h2=scatter(IT2(4:6,1),IT2(4:6,2), markersize,'r','filled','^');
        line(IT2(4:6,1),IT2(4:6,2),'LineStyle','--','LineWidth',linewidth-1,'Color','r');
        
        h3=scatter(IT2(7:9,1),IT2(7:9,2), markersize,'g','filled','d');
        line(IT2(7:9,1),IT2(7:9,2),'LineStyle','--','LineWidth',linewidth-1,'Color','g');

        set(gca,'YLim',[0.01 100]);
        text(0.27,1.1,'Instrument Table 2','FontSize',fontsize,'FontWeight','bold','Color','k','Units','normalized');
        
        [leg,objects] = legend([h3 h2 h1 h0],' LAF',' TAF',' Mixing',' Analytical');
        
    end
    
%   axis([0.8 4 0.01 100]);
    axs.XRuler.MinorTick = xtick; %0.4:0.1:4;
    set(gca,'XLim',[xtick(1) xtick(end)],'XTick', xticklabel);
    set(gca, 'XTickLabel', {'20','40','60','100'});
%   set(gca,'YLim',[0 80]);
%   xticks([1 2 3 4]) % Matlab 17.2 or later
%   legend(axs(2),[h3 h2 h1 h0],'LAF','TAF','Mixing','Analytical');   
    
end

leg.Location='best';
for i=5:7
    objects(i).Children.MarkerSize = 9;
    objects(i).Children.XData = 0.167;
end
objects(8).LineWidth = 1.5;
objects(8).XData(2) = 0.32;
 

% print('XXXXX','-dmeta')
% print(gcf,'foo.png','-dpng','-r300');         % 300 dpi
    

figure(2)
hold on
% plot(OT(1:3,1),OT(1:3,2),'sb--','LineWidth', 0.5,'Marker','s','MarkerSize',8,'MarkerEdgeColor','b','MarkerFaceColor','b');

scatter(OT(1:3,1),OT(1:3,2), markersize,'b','filled','s'); %,'LineWidth',6);      
% line(OT(1:3,1),OT(1:3,2),'LineStyle','--','LineWidth',linewidth-1,'Color','b');
scatter(OT(4:6,1),OT(4:6,2), markersize,'r','filled','^');
scatter(OT(7:9,1),OT(7:9,2), markersize,'g','filled','d'); %,'LineWidth',12)
plot(Q,C,'k--','LineWidth',linewidth-1)
legend('Mixing','TAF','LAF','Analytical','Location','northoutside','Orientation','horizontal');
legend('boxoff');

% [~,objects] = legend('Mixing','TAF','LAF','Analytical');
% objects(2).LineStyle = '-';


  
