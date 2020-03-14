clear variables
close all
clc
set(0,'defaultAxesFontSize',20)
fp = fopen('handwashing.txt');
data = textscan(fp,'%s %f %f %f %s %f\n');

countries=data{1};
wash = data{2};
population=data{3};
cases=data{4};

figure('Position',[0 0 1500 1500],'Units','Points');
%plot(50,50,'.')
cases2 = 1000000*(cases+1)./(population);
%cases2 = cases2/max(cases2)*100;
scatter(wash,cases2,0,'k','.');
hold on
for i=1:numel(countries)
    text(wash(i),cases2(i),countries{i},'FontSize',15,...
        'FontName','CopperPlate','Color',[123 123 123]/255);
    hold on
end
text(50,5*0.01,'Source 1: https://www.statista.com/chart/4111/do-europeans-wash-their-hands-after-using-the-toilet',...
    'FontSize',12,...
        'FontName','CopperPlate','Color',[229 131 60]/255);
text(50,3*0.01,'Source 2: https://hgis.uw.edu/virus',...
    'FontSize',12,...
        'FontName','CopperPlate','Color',[229 131 60]/255);
xlabel('% Who Automatically Wash Their Hands With Soap & Water After Going Toilet','FontName','CopperPlate','Color','w');
%set(gca,'XTick',[],'YTick',[]);
xlim([49 100])
%ylim([0 102])
ylabel('Confirmed Cases per Million (Log Scaled)','FontName','CopperPlate','Color','w');
set(gcf,'color',[38 35 44]/255);
set(gca,'Color',[38 35 44]/255,'XColor','w','YColor','w')
set(gca,'YSCale','log')
set(gca,'fontname','CopperPlate') 
box on
grid on
title('Are hand washing habits and coronavirus cases correlated?',...
    'Color',[229 131 60]/255);
