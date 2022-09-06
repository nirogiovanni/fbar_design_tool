function metallo= metallicEvaluator2(vp,fr,debug,material)
fname="./PH-VELOCITIES/"+material+".txt";
d= importdata(fname," ");

rap=d(:,2);
%y=d(1:11,1).*2.*1.1;
y=d(:,1);
%fitting
p=fit(rap,y,'exp2');
x=0:0.0001:0.8;
y1 = p.a.*exp(p.b.*x)+p.c.*exp(p.d.*x);
%calcolo metallo
x1=bisezione(vp,p,1000,min(x),max(x));
lambda=vp/fr;
metallo=x1*lambda/2;
%metallo=metallo-0.05*metallo;
if(debug)
   % figure
   % plot(x,y1,'LineWidth',1.5);
    grid on;
    gca.FontSize=22;
    xlabel("h/d");
    ylabel("v_{p}[m/s]");
    hold on;
    plot(x,y1,'LineWidth',1.5);
    plot(rap,y,'-o');
    xline(x1,'LineWidth',2);

end

end