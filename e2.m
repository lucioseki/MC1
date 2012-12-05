# s(t) = A0 + C1 * cos(w*t + teta)
# T0 = frequencia fundamental
# f0 = frequencia fundamental
# A = altura do cosseno  
# A0 = altura media do sinal em relacao as abcissas
# teta = angulo de fase (deslocamento horizontal do sinal)
# w = frequencia angular
# w = (2*pi / T0) = (2*pi * f0)
# t = variavel tempo
# exemplo: plot(e2(3, 3, 2, [0:1:(2*pi)], 30))
function s = e2(A0, C1, w, t, teta)
 
c = cos(w*t+teta);
 
# para exibir valores
# disp(c);
 
s = A0 + C1 * c;
# em 1s tenho a frequencia de amostragem
# t = 10s
