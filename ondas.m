% 1. Gere um sinal digital de 1000 amostras que simule um sinal analgico, 
% consistindo de uma nica senide de frequncia 30.76 Hz, amostrada a 1 kHz 
% por 1 segundo.  Plote este sinal digital com o eixo x sendo o tempo, de 0 a 1 s.

fs = 1000; % Frequncia de amostragem em Hertz
f = 30.76; % frequncia do sinal a ser gerado em Hertz
t=0:1/fs:1; % Gerao do eixo de tempo (1 segundo)
y=sin(2*pi*f*t); % Gerao do sinal
% Mostrando o sinal gerado
figure(1), plot(t,y)
title('Sinal amostrado a 1kHz');
xlabel('tempo (s)');
ylabel('amplitude (V)');
grid

% 2. Simule a amostragem deste sinal analgico a 200 Hz, descartando 4 amostras
% a cada 5 do sinal digital que voc criou no passo 1.
% Reamostrando  o sinal a 200 Hz
tamanho=length(y);
t1=1;
t2=1;
while (t1<tamanho)
y200(t2) = y(t1);
t1 = t1+5; %pula de 5 em 5
t2 = t2+1; %contador do y200
end

% Plote este sinal reamostrado, com o eixo x rotulado como "tempo", indo de 0 a 1 s.
% Mostrando o sinal gerado
fs2=200;
t=0:1/fs2:1; % Gerao do eixo de tempo (1 segundo)
t=t(1:length(y200));
figure(2), plot(t,y200)
title('Sinal amostrado a 200Hz');
xlabel('tempo (s)');
ylabel('amplitude (V)');
grid

%1. Use o código abaixo para gerar e visualizar um sinal "analógico", 
%composto por duas senóides.

fs = 1000; % Frequência de amostragem em Hertz
f2=100.47;
f = 40.76; % frequência do sinal a ser gerado em Hertz
t=0:1/fs:1; % Geração do eixo de tempo (1 segundo)
nAmostras = length(t); %numero de amostras
y1=cos(2*pi*f*t); % Geração do sinal
y2=cos(2*pi*f2*t); % Geração do sinal
y=y1+y2;
maximo=max(abs(y));
y=y/maximo;
Vmax = max(y);
Vmin = min(y);
% Mostrando o sinal gerado
plot(t,y)
title("Sinal amostrado a 1kHz");
xlabel("tempo (s)");
ylabel("amplitude (V)");
grid
