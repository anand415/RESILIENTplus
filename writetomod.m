function writetomod(ss,ind_obs,fileID)

SSct=ss(1:405);
SSct(74:74+strlength(num2str(length(ind_obs))))=strcat(num2str(length(ind_obs))," ");
SSct=strcat(SSct,'\n');
% pref1='     &  ';
pref2="     &  ";

sttr=pref2;
for ii=1:length(ind_obs)-1
%     if ~ismember(ii,insrtindx)
    sttr=strcat(sttr,string(ind_obs(ii)),',');
end
sttr=strcat(sttr,string(ind_obs(ii+1)));
% 
% for ii=1:length(sttrc)
%     strn=sttr;
% insrtsr=strcat('\n',pref);
%    ss(insrtindx(ii:ii+strlength(insrtsr)-1))=insrtsr;
    
% end
sttrc=char(sttr);
insrtindx=find(mod([1:length(sttrc)],58)==0);

    ind1=find(sttrc==',');

for ii=1:length(insrtindx)
    ind2=find((insrtindx(ii)-ind1)>=0,1,'last'); 
%     ind3=find((insrtindx(ii)-ind1)>=0);

% [vv,vl]=min(ind1(ind2));
insertF(ii)=ind1(ind2);
end
insertF=[0,insertF];Fstr1='';
for ii=1:length(insertF)-2
str1=sttrc(insertF(ii)+1:insertF(ii+1));
    Fstr1=strcat(Fstr1,str1,'\n',pref2);
    
end
if length(sttrc)==insrtindx(end)
str1=sttrc(insertF(end-1)+1:insertF(end));

Ftsr=strcat(Fstr1,str1,'/','\n');
% Fstr1c=char(Fstr1);

else
    str1=sttrc(insertF(end-1)+1:insertF(end));

Fstr1=strcat(Fstr1,str1,'\n',pref2);
Fstr1=strcat(Fstr1,sttrc(insertF(end)+1:end),'/','\n');
end




% fprintf(fileID,string(Fstr1));
% Fstr1=strcat(Fstr1,'                DATA evd/\n');
% 
% 
% 
% insertF=[];
% 
% insrtindx=find(mod([1:length(ind_obs)],60)==0);
% sttr=pref2;
% for ii=1:length(ind_obs)-1
% %     if ~ismember(ii,insrtindx)
%     sttr=strcat(sttr,num2str(ind_obs(ii,2),'%5.2f'),',');
% end
% sttr=strcat(sttr,num2str(ind_obs(ii+1,4),'%5.2f'));
% % 
% % for ii=1:length(sttrc)
% %     strn=sttr;
% % insrtsr=strcat('\n',pref);
% %    ss(insrtindx(ii:ii+strlength(insrtsr)-1))=insrtsr;
%     
% % end
% sttrc=char(sttr);
% insrtindx=find(mod([1:length(sttrc)],55)==0);
% 
%     ind1=find(sttrc==',');
% 
% for ii=1:length(insrtindx)
%     ind2=find((insrtindx(ii)-ind1)>=0,1,'last'); 
% %     ind3=find((insrtindx(ii)-ind1)>=0);
% 
% % [vv,vl]=min(ind1(ind2));
% insertF(ii)=ind1(ind2);
% end
% insertF=[0,insertF];Fstr2='';
% for ii=1:length(insertF)-2
% str1=sttrc(insertF(ii)+1:insertF(ii+1));
%     Fstr2=strcat(Fstr2,str1,'\n',pref2);
%     
% end

Fstr2='            END MODULE MAIN2';

% Fstr2=strcat(Fstr2,'            END MODULE MAIN2');
Fstr=strcat(SSct,Fstr1,Fstr2);

fprintf(fileID,string(Fstr));
end