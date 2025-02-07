start = tic;
N = 100000;
t =  0:100000 ;

%Ypologismos twn N1 ka N2
name= 'george';
name = double(name);
ON = sum(name);

lastname= 'vlachos';
lastname = double(lastname);
EP = sum(lastname);

%Ypologizoume to rate etsi wste na einai sigoura mikroteros ths monadas
if EP == max(ON,EP)
    rate = ON/EP;
else
    rate = EP/ON;
end

%Kai to 8etoume rate = N1/N2 ara panta N1<N2
N2 = round(N/(rate+1));
N1 = N - N2;

%Kai au8aireta 8ewroume oti ston xwro 1 briskontai arxika N1 swmatidia kai
%ston xwro 2 briskontai arxika N2 swmatidia
%Na_exp1 ta swmatidia pou menoun ston xwro 1
Na_exp1 = N1 + t(1: N/2-N1);
k1 = zeros(1,100000-(N/2 - N1)+1)+ N/2;
Na_exp1 = [Na_exp1 , k1];
%Na_exp2 ta swmatidia pou menoun ston xwro 2
Na_exp2 = N2 - t(1: N/2-N1);
k2 = zeros(1,100000-(N/2 - N1)+1)+ N/2;
Na_exp2 = [Na_exp2 , k2];

%Na_theo1 kai Na_theo2 express the theory for each space of the box
t1 = -N*log(2*N2/N -1)/2;
Na_theo1 = -N*(1+exp(-2*(t+t1)/N))/2 +N;
Na_theo2 = N*(1+exp(-2*(t+t1)/N))/2;

%sygkritikh grafikh parastash
plot (t,Na_theo1,'r',t,Na_theo2,'b',t,Na_exp1,'m',t,Na_exp2,'c');
xlabel('time (sec)');
ylabel('particles left in the two rooms');
title('Rate of change of the existed particles over time');
legend('theoretical for the 1st room','theoretical for the 2st room','experimental for the 1st room','experimental for the 2nd room');
grid;
box;
%mporoume na zoumaroume mesa sto plot xrhsimopoiwntas thn entolh
%axis ([0 t_max 0 1000 ]);
%mikrainontas to t_max dhladh mexri poia xronikh stigmh 8a deixnei
time = toc(start);