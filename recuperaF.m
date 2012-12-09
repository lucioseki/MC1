#Calcula a transformada de fourier do sinal e o recupera atraves da transformada inversa

clear all, close all

sn = wavread('/usr/share/sounds/speech-dispatcher/dummy-message.wav',[300 700]);
figure(1), plot(sn) , title('Original');

f=fft(sn); #transformada de fourier
figure(2), plot(abs(f)), title('Fourier'); #nao era melhor usar real?

fi=real(ifft(f));  #transformada inversa
figure(3), plot(fi), title('Fourier Inversa');

