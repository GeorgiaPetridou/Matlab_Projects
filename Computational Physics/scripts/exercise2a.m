start = tic;
N = 1000;
t =  0:100000 ;

%Na_theo is the theoretical Na
Na_theo = N*(1+exp(-2*t/N))/2 ;
%Na_exp is the experiment Na
Na_exp = N - t(1:N/2);
k = zeros(1,100000-N/2+1)+ N/2;
Na_exp = [Na_exp , k];
 
%comparison plot
plot (t,Na_theo,'b',t,Na_exp,'r');
xlabel('time (sec)');
ylabel('particles left in the first room');
title('Rate of change of the existed particles over time');
legend('theoretical','experiment');
grid;
box;
%we can zoom in the plot using the command
%axis ([0 t_max N/2 N ]);
%reducing the t_max depending on which second we want to be able to %see
time = toc(start);
