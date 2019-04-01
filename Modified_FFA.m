clc;close all;clear all;
%% Modify
particles=50   ;                        %Numbers of agent
mult=9  ;                               %Dimition of function;
x=[]  ;                                 %[Particle,Dimention]
B0=0.1;
omg=0.000001;
a=0.1;

times=1;

%%¡@Assign initial agent
for i =(1:particles)
    for j =(1:mult)
        z(j)=(rand()*10);
    end

    x(i,:)=(z);
    y(i)=fitness(x,i);
 end
%% Iteration
while times<30
    for i =(1:particles)
        for j =(1:particles)
            if(y(j)<y(i))
                r=0;
                for k=(1:mult)
                    r=r+(x(i,k)-x(j,k))^2;
                end
                r=r^(1/2);
                for k =(1:mult)
                    x(i,k)=x(i,k)+B0*(1/(omg+r))*(x(j,k)-x(i,k))+a*(rand()-0.5);
                    y(i)=fitness(x,i);
                end
            end
        end
    end
    prebest(times)=(min(y));
    avg_value(times)=(sum(y)/particles);
    IterationTimes(times)=(times);
    times=times+1;
end
best=min(y);
gbest=x(y==best,:);

%% Ploting
figure(1) 
plot(IterationTimes,prebest,IterationTimes,avg_value,'Linewidth',1.5)
ylabel('Function Value','Fontsize',10,'FontName','Times New Roman')
xlabel('Iterations','Fontsize',10,'FontName','Times New Roman')
legend('Best Particle','Average of Particles')


fprintf("fitness=%f\n",best);
fprintf("x1=%f\n",gbest(1))
fprintf("x2=%f\n",gbest(2))
fprintf("x3=%f\n",gbest(3))
fprintf("x4=%f\n",gbest(4))
fprintf("x5=%f\n",gbest(5))
fprintf("x6=%f\n",gbest(6))
fprintf("x7=%f\n",gbest(7))
fprintf("x8=%f\n",gbest(8))
fprintf("x9=%f\n",gbest(9))