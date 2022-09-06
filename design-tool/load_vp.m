function vp = load_vp(material)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
fname="./PH-VELOCITIES/"+material+".txt";
d= importdata(fname," ");
vp=d(:,1);

end