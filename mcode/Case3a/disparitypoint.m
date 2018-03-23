%
imgl=imread('DATA/tabuleiro_left/bmp/tabuleiro_left0.bmp');
imgr=imread('DATA/tabuleiro_right/bmp/tabuleiro_right0.bmp');

data=load('DATA/data.dat');

% Dados da camera
alpha=data.alpha;

% Dados da geometria
S0=data.S0;
S1=data.S1;
S2=data.S2;
NtoC=data.NtoC;

% Dados do arquivo
Hp=size(imgl,1)
Wp=size(imgl,2)

% Dados do matching
figure(1)
imshow(imgl)
[a1,b1]=ginput(2);
x1p=a1-Wp/2;
y1p=Hp/2-b1;

figure(2)
imshow(imgr)
[a2,b2]=ginput(2);
x2p=a2-Wp/2;
y2p=Hp/2-b2;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h0p=cot(alpha/2)*(Wp/2);

P1n=[x2p';y2p';h0p*ones(1,length(y2p))];
P1c=NtoC*P1n;
x2pc=P1c(1,:);
y2pc=P1c(2,:);
z2pc=P1c(3,:);

mu=h0p./z2pc;
x2p=mu.*x2pc;
y2p=mu.*y2pc;

x2p=x2p';
y2p=y2p';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

d=(cot(alpha/2)/2)*(Wp*S0./(x1p-x2p)) - (S1*x2p)./(x1p-x2p)

X1=2*tan(alpha/2)*d.*x1p/Wp
X2=2*tan(alpha/2)*(d-S1).*x2p/Wp
Y1=2*tan(alpha/2)*d.*y1p/Wp
Y2=2*tan(alpha/2)*(d-S1).*y2p/Wp


