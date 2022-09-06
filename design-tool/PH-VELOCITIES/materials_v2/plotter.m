clear all;
%close all;
d=importdata("titanium_v2.txt"," ",5);
f=d.data(:,1);
ratio=0.05:(0.3-0.05)/29:0.3;
y=zeros(1,size(ratio,2));
for i = 2: size(ratio,2)+1
    y(i-1)=f(d.data(:,i)==max(d.data(:,i)));
end
y=y.*2e3;
plot(ratio,y,'-o','LineWidth',1.2);
hold on;
ax=gca;
ax.FontSize=22;
xlabel("h/d");
ylabel("Phase Velocity [m/s]");
grid on;
legend;