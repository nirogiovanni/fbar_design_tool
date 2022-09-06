function resonatorsFamily= design_resonator(h_piezo,metal,fr)
constraint.metal=100e-9;
constraint.h_piezo=1e-6;
h_piezo=str2double(h_piezo);
fr=str2double(fr);
vp=load_vp(metal);
if(isnan(h_piezo))
vp_=min(vp):1e2:max(vp);
resonator.h_piezo=0;
resonator.h_metal=0;
resonator.metal=metal;
resonatorsFamily=repmat(resonator,1,size(vp,2));
for i = 1 : size(vp_,2)
    resonatorsFamily(i).h_piezo=vp_(i)/(2*fr);
    resonatorsFamily(i).h_metal=metallicEvaluator2(vp_(i),fr,false,metal);
    resonatorsFamily(i).metal=metal;
end
else
    resonator.h_piezo=h_piezo;
    resonator.h_metal=metallicEvaluator2(h_piezo*2*fr,fr,false,metal);
    resonator.metal=metal;
    resonatorsFamily(1)=resonator;

end

