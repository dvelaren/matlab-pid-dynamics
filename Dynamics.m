clear all
close all
clc
%[T X Y1 Y2 Y3 Y4 Y5 Y6]=sim('PIDDynamics');
[T X Y]=sim('PIDDynamics');
xmax=1.3;
ymin=-0.3;
ymax=2.7;
titlelbl=["Proportional Influence" "Proportional and Integral Influence" "Proportional, Integral and Derivative Influence"];
legends1=["KP=1" "KI=1" "KD=1"];
legends2=["KP=1.5" "KI=1.5" "KD=1.5"];
for i = 1:3
    figure(i)
    subplot(3,1,1)
    p1=plot(T,Y(:,1),'LineWidth',2);
    hold on
    p2=plot(T,Y(:,2+8*(i-1)),'r','LineWidth',1.5);
    p3=plot(T,Y(:,6+8*(i-1)),'r--','LineWidth',1.5);
    legend([p2 p3],legends1(i),legends2(i))
    xlabel("Time[sec]")
    ylabel("Speed[rpm]")
    title("Setpoint and Measurement")
    axis([0 xmax ymin ymax])
    subplot(3,1,2)
    plot(T,Y(:,3+8*(i-1)),'r','LineWidth',1.5)
    hold on
    plot(T,Y(:,7+8*(i-1)),'r--','LineWidth',1.5)
    legend(legends1(i),legends2(i))
    xlabel("Time[sec]")
    ylabel("Speed[rpm]")
    title("Error")
    axis([0 xmax ymin ymax])
    subplot(3,1,3)
    plot(T,Y(:,4+8*(i-1)),'r','LineWidth',1.5)
    hold on
    plot(T,Y(:,8+8*(i-1)),'r--','LineWidth',1.5)
    legend(legends1(i),legends2(i))
    xlabel("Time[sec]")
    ylabel("Speed[rpm]")
    title(titlelbl(i)+" Control Action")
    axis([0 xmax ymin ymax])
end