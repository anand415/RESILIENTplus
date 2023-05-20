figure(8738);
hold on
qcd_ssC=(SS_q3(end,:)-SS_q1(end,:))./((SS_q3(end,:)+SS_q1(end,:)));
qcd_ss=(SS_q3(end,:)-SS_q1(end,:))./(2+(SS_q3(end,:)+SS_q1(end,:)));
qcd_ssFF=qcd_ss;
%     h = bar(a,diag(b),'stacked');
% h=bar(qcd_ss,'FaceColor','r');

bds=find(qcd_ssFF>0.35);
% set(h(bds),'facecolor','r')
% h.CData(2,:)=[1 1 0] ;

for ii = 1:length(qcd_ssFF)
    if ~ismember(ii,bds)
    h1=bar(ii,qcd_ssFF(ii));
    set(h1,'FaceColor','b');
    set(get(get(h1,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
    else
            h2=bar(ii,qcd_ssFF(ii));
    set(h2,'FaceColor','r');
    set(get(get(h2,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
    end
end