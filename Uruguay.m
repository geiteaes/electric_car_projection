clear all
clc

% Pengisisan variable masing2 state
AR = 1;     DU = 11;
SA = 2;     FD = 12;
PA = 3;     CA = 13;
RN = 4;     MO = 14;
SO = 5;     CL = 15;
CO = 6;     TT = 16;
FS = 7;     LA = 17;
SJ = 8;     MA = 18;
RV = 9;     RO = 19;
TA = 10;

% Data Population, Land Area, Density Population, and Bobot
data(AR,:) = [ 73378 11928 0 3 ];
data(SA,:) = [ 124878 14163 0 3 ];
data(PA,:) = [ 113124 13922 0 3 ];
data(RN,:) = [ 54765 9282 0 3 ];
data(SO,:) = [ 82595 9008 0 2 ];
data(CO,:) = [ 123203 6106 0 2 ];
data(FS,:) = [ 25050 5144 0 2 ];
data(SJ,:) = [ 108309 4992 0 2 ];
data(RV,:) = [ 103493 9370 0 3 ];
data(TA,:) = [ 90053 15438 0 3 ];
data(DU,:) = [ 57088 11643 0 3 ];
data(FD,:) = [ 67048 10417 0 2 ];
data(CA,:) = [ 520187 4536 0 1 ];
data(MO,:) = [ 1319108 530 0 1 ];
data(CL,:) = [ 84698 13648 0 2 ];
data(TT,:) = [ 48134 9676 0 3 ];
data(LA,:) = [ 58815 10016 0 2 ];
data(MA,:) = [ 164300 4793 0 1 ];
data(RO,:) = [ 68088 10551 0 3 ];

for i = 1:19
    data(i,2) = data(i,2) * 0.621371^2;
    data(i,3) = data(i,1)/data(i,2);
end

% Jarak interstate
state(AR,SA) = 205.9;
state(SA,PA) = 121.5;
state(SA,RV) = 328.4;
state(SA,TA) = 218.6;
state(PA,TA) = 234.3;
state(PA,RN) = 63.8;
state(RN,TA) = 291.8;
state(RN,DU) = 313.9;
state(RN,SO) = 313.4;
state(SO,FS) = 192.8;
state(SO,CO) = 166.6;
state(CO,SJ) = 99.5;
state(RV,CL) = 188;
state(RV,TA) = 111.7;
state(TA,CL) = 203.5;
state(TA,DU) = 204.8;
state(DU,CL) = 400;
state(DU,TT) = 243.1;
state(DU,FS) = 40.9;
state(DU,FD) = 88.6;
state(FS,FD) = 126.7;
state(FS,SJ) = 98.7;
state(SJ,MO) = 95.6;
state(SJ,CA) = 90.2;
state(FD,CA) = 95.2;
state(CA,LA) = 88;
state(CA,MA) = 107.7;
state(CA,MO) = 24.3;
state(CL,TT) = 114.1;
state(TT,LA) = 205.9;
state(TT,RO) = 176;
state(LA,RO) = 131.6;
state(LA,MA) = 74.1;
state(RO,MA) = 84.9;

for i = 1:19
    for j = 1:19
        if state(i,j) ~= 0
            state(j,i) = state(i,j);
        else
            state(i,j) = state(j,i);
        end
    end
end

count1 = 0;
for i = 1:19
    circle(i) = floor(data(i,2) / (pi*data(i,3)/4));
    count1 = count1 + circle(i);
end
circle = transpose(circle);

count2 = 0;
for i = 1:19
    for j = 1:i
        if state(i,j) ~= 0
            cstate(i,j) = round(state(i,j)/100);
            count2 = count2 + cstate(i,j);
        end
    end
end

count = count1 + count2