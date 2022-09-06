function [yl,yu]= monteCarloSimulation(res,plot_true,var_piezo,var_metal)
th_piezo= res.h_piezo;
th_metal=res.h_metal;

numIt2=50000;
numIt1=1;
prec=1;
%%Fitting Calibration Curve
d= importdata("./PH-VELOCITIES/"+res.metal+".txt"," ");
rap=d(:,2);
y=d(:,1);
p=fit(rap,y,'exp2');

x_min=(th_metal-var_metal*th_metal)/(th_piezo+var_piezo*th_piezo);
x_max=(th_metal+var_metal*th_metal)/(th_piezo-var_piezo*th_piezo);
x=x_min:(x_max-x_min)/1000:x_max;

a=p.a;
b=p.b;
c=p.c;
d=p.d;
vp_min=(a*exp(b*x_max)+c*exp(d*x_max));
vp_max=(a*exp(b*x_min)+c*exp(d*x_min));
th_max=(2*(th_piezo+var_piezo*th_piezo));
th_min=(2*(th_piezo-var_piezo*th_piezo));
%plot(x,(a*exp(b*x)+c*exp(d*x)));
freq_min=vp_min/th_max/10^6;
freq_max=vp_max/th_min/10^6;

x_label=freq_min:10^-(prec):freq_max;
fig=waitbar(0,"Montecarlo Simulation");
%%
freq=zeros(numIt1,numIt2);
for j=1: numIt2
for i = 1 : numIt1
    th_p=(th_piezo+th_piezo*var_piezo*(rand(1,1)-rand(1,1)));
    th_m=(th_metal+th_metal*var_metal*(rand(1,1)-rand(1,1)));
x=th_m/th_p;
freq(i,j)=((a*exp(b*x)+c*exp(d*x))/(2*th_p))/1e6;
end
waitbar(j/numIt2,fig);
end
waitbar(1,fig,"Plotting results");
for j=1: numIt2
M(j)=round(mean(freq(:,j)),prec);
end

x_label=unique(round(x_label,prec));
for i =1: size(x_label,2)
p_(i)=sum(M(:)==(x_label(i)));
p=p_./numIt2;
f(i)=sum(M(:)<=x_label(i))/numIt2;

end
%[yl,yu]=FindConfidenceInterval(0.95,p,x_label)
N=size(M,2);

coef=fitdist(M','Normal');
y=normpdf(x_label,coef.mu,coef.sigma);

yl=coef.mu-2*sqrt(coef.sigma);
yu=coef.mu+2*sqrt(coef.sigma);

if(plot_true)
    pause(1.5);
    close(fig);
figure
plot(x_label,y./sum(y));
hold on;

plot(x_label,p,'o');
xline(yl);
xline(yu);
xline(coef.mu,'r','LineWidth',2.5)

legend("Gaussian \mu= "+coef.mu+", \sigma= "+coef.sigma,'simulated data');

xlabel("Frequency [MHz]");

ax=gca;
ax.FontSize=25;
grid on;
figure,
xlabel("Frequency [MHz]");
ax=gca;
ax.FontSize=25;
grid on;
plot(x_label.*10^6,f);

((yu-yl)/(mean(M)))*100
end
%plot(x_label, p,'o');

