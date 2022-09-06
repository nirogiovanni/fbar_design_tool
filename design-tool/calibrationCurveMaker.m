function [x,y]= calibrationCurveMaker(path,name,h_metal_min,h_metal_max,num,h_piezo)
d=importdata(path," ",6);
data=d.data;
freq=data(:,1);
y=data(:,2:end);
save_path="./PH-VELOCITIES/"+name+".txt";

r=zeros(1,size(y,2));
%h_d=11:(61-11)/5:61;
%h_d=h_d./(1.12);
h_d=h_metal_min: (h_metal_max-h_metal_min)/(num-1): h_metal_max;
h_d=h_d./h_piezo;
for i = 1: size(y,2)
    r(i)=findResonance(freq,y(:,i)).*10^9;
    r(i)=r(i)*2*h_piezo;
    
end
x=h_d;
y=r;
end

