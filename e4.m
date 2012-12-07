clear
%carrega audio
[samples, channels] =wavread('yamaha.wav');

%transformada de fourrier para o audio original
audio_fft = fft(samples);

%modulo da transformada
modulo_audio_fft = abs(audio_fft);

%Plot 
figure(1) 
subplot(2, 2, 1);
plot(samples), title('Audio Original');

subplot(2, 2, 2);
plot(audio_fft), title('FFT do Audio');

subplot(2, 2, 3);
plot(modulo_audio_fft), title('Modulo da Transformada');

subplot(2, 2, 4);
plot(real(fftshift(audio_fft))), title('Parte real do fftshft da transformada de fourrier');

%------------------------------------------------------------------------------------------------------------------%
%Região de baixa frequencia localizada nas bordas do grafico (antes da fftshift).

%Porque o segundo plot e espelhado?
%Todo sinal amostrado possui replicação de sinal [teoria]. Por isso que muitas vezes acontece o aliasing.

%COMPLEMENTAR:
%Posteriormente, construa sinais de áudio mais simples, com poucas frequências, assim como foi feito nos primeiros exercícios e identifique essas frequências no domínio de Fourier.
