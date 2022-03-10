clear all
clc

% Model SIR
% Pendefinisian variable
a = 0.05;
b = 0.0000000005;
u = 0.0000001;
o = 0.0000001;

%Initial value
s(1) = 308745538/4;
i(1) = 0;

for t = 1:50*12
    ds = o - a*s(t) - b*s(t)*i(t) - u*s(t);
    di = a*s(t) + b*s(t)*i(t);
    s(t+1) = s(t) + ds/12;
    i(t+1) = i(t) + di/12;
    if s(t+1) < 0
        s(t+1) = 0;
    end
end

t = 1;
while i(t)<0.3*s(1)
    t = t+1;
end
t/12

q = 1;
while i(q)<0.4274*s(1)
    q = q+1;
end
q/12

r = 1;
while i(r)<s(1) && r<=600
    r = r+1;
end
r/12

t = 1:50*12+1;
plot(t/12,s,'LineWidth',2)
hold on
plot(t/12,i,'LineWidth',2)
title('The Growth of Gasoline Car and Electric Vehicle')
xlabel('t (years)')
ylabel('Total')
legend('Gasoline Car','Electric Vehicle')
grid on
