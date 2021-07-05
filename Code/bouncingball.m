clear all 
close all
clc
m=0.56;% mass of the ball
h=1; % dropping height
cd=0.5;% coefficient of drag
rho=1.225;% density of air
r=0.327; % radius of ball
% t=linspace(0,.451,500); % time array
% u=0; % initial velocity
x=zeros(1,100000);
y=zeros(1,100000);
v=zeros(1,100000);
a=zeros(1,100000);
%  bounce_movie=struct('z',zeros(1,500));
ct=1;
% a=9.8;
% for i=1:500
% %     a(i)=9.8-((0.018)*(v(i)^2));
%     v(i)=u+((a)*(t(i)));
%      y(i)=h-(((u)*t(i))+((0.5)*(a)*(t(i)^2)));
% %     plot(x(i),y(i),'marker','.','markersize',50)
% %     bounce_movie(ct)=getframe(gcf);
% %     ct=ct+1;
% end
y(1)=h;
v(1)=0;
t(1)=0;
s=0;
i=1;
ymax=1;
bouncenumber=0;
loopnum=0;
while ymax>0.327
    bouncenumber=bouncenumber+1;
while y(i)>=0.001
    plot(x(i),y(i),'marker','.','markersize',50)
    axis([-1.5 1.5 -1.5 1.5])
    bounce_movie(ct)=getframe(gcf);
    ct=ct+1;
    i=i+1;
    a(i-1)=9.8-((0.018)*(v(i-1)^2));
    v(i)=v(i-1)+((a(i-1))*(0.001));
    s=s+(((v(i-1))*(0.001))+((0.5)*((0.001)^2)*(a(i-1))));
    y(i)=ymax-s;
end
a(i-1)=0;
v(i)=(0.8)*-v(i-1);
y(i)=0;
s=0;
ct=ct-1;  
 while v(i)<=-0.001
     plot(x(i-1),y(i-1),'marker','.','markersize',50)
     axis([-1.5 1.5 -1.5 1.5])
      bounce_movie(ct)=getframe(gcf);
      ct=ct+1;
     a(i-1)=9.8+((0.018)*(v(i)^2));
     v(i+1)=v(i)+((a(i-1))*(0.001));
     s=s+(((v(i))*(0.001))+((0.5)*((0.001)^2)*(a(i-1))));
      y(i)=-s;
      i=i+1; 
      loopnum=loopnum+1;
 end
 
  ymax=y(i-1);
 if ymax<=0.327
     bounce_movie((ct-loopnum-1):(ct-1))=[];
 else
 loopnum=0;
 m=ymax
 a(i-1)=0;
 v(i)=0;
 y(i)=0;
 i=i-1;
 s=0;
 ct=ct-1;
 end
end
movie(bounce_movie,1,100)
videofile=VideoWriter('bouncingball.avi','uncompressed AVI');
open(videofile)
writeVideo(videofile,bounce_movie)
close(videofile)