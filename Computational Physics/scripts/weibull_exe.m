data = 'Wind data_1.xlsx';
year = xlsread(data,'A:A');

p1 = find(year == 1969);
p2 = find(year == 1973);
ps = p1(1);
pe = p2(end);

year = year(ps:pe);

wind_dir = xlsread(data,'E:E');
wind_dir = wind_dir(ps:pe);

wind_vel = xlsread(data,'F:F');
wind_vel = wind_vel(ps:pe);

[figure_handle,count,speeds,directions,Table] = WindRose(wind_dir,wind_vel,'anglenorth',0,'angleeast',90,'labels',{'N (0)','S (180)','E (90)','W (270)'},'freqlabelangle',45);
title('Wind Rose');

l=1;
for j = 1:(max(size(wind_vel))/6)
    d_w(j) = mean(wind_vel(l:l+5));
    l = l + 6;
end
v = tabulate(d_w);
V0 = v(2:end-1,1);

%least squares method
lnv0 = log(V0);  
lnv02 = power(lnv0,2); %ln(V0)^2

for i = 1:max(size(V0))
    mat = find(d_w <= V0(i));
    F(i) = max(size(mat))/max(size(d_w));
    clearvars mat
end
Y = log(-log(1-F));
ylnv0 = Y'.*lnv0;

D = max(size(V0))*sum(lnv02) - power(sum(lnv0),2);
A = (sum(lnv02)*sum(Y) - sum(lnv0)*sum(ylnv0))/D;
k = (max(size(V0))*sum(ylnv0) - sum(lnv0)*sum(Y))/D;
C = exp(-A/k);

disp('parameter k = ');
disp( k);
disp('parameter C = ');
disp( C);

f = wblpdf([1:max(d_w)],C,k);

figure(2);
h = histogram(d_w,'Normalization','pdf');
h.BinWidth = 0.7;
h.FaceColor = 'b';
h.EdgeColor = 'w';
%axis([0 30 0 0.3]);
title('Histogram');
xlabel('wind velocity');
ylabel('propability');
hold on;
plot(f,'k','LineWidth',1.5);
legend('Measured data','fitted Weibull distribution');
grid
box