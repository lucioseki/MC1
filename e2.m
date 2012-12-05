# s(t) = A0 + C1 * cos(w*t + teta)
#
# A0 = altura media do sinal em relacao as abcissas
# C1 = constante
# w = frequencia angular = (2*pi / T0) = (2*pi * f0)
# t = variavel de tempo
# teta = angulo de fase em graus (deslocamento horizontal do sinal)
#
# uso: e2(A0, C1, w, t, teta)
# exemplo: plot(e2(3, 3, 2, [0:0.1:(2*pi)], 30))
function s = e2(A0, C1, w, t, teta)
 
c = cos(w*t+(teta * (pi/180)))
 
s = A0 + C1 * c;
