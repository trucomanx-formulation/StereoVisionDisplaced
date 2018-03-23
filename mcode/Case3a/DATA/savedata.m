%

% Dados da camera
alpha=75*pi/180;

% Dados da geometria
S0=0.20;
S1=0.20;
S2=0.20;

theta=20;	%angulo olhando haci abaixo
NtoC=[	1 0 				0;
		0 cos(theta*pi/180) -sin(theta*pi/180);
		0 sin(theta*pi/180) cos(theta*pi/180)	];

save('data.dat','alpha','S0','S1','S2','NtoC');

