# s(t) = A0 + A1 * cos(w*t) + A2 * sin(w*t)
#
# A0 = altura media do sinal em relacao as abcissas
# A1 = C1 * cos(teta)
# A2 = C1 * sin(teta)
# C1 = constante
# w = frequencia angular = (2*pi / T0) = (2*pi * f0)
# t = variavel de tempo
# teta = angulo de fase em graus (deslocamento horizontal do sinal)
#
# uso: e3(A0, C1, w, t, teta)
# exemplo: plot(e3(1, 1, 2, [0:0.1:(2*pi)], 30))
function s = e2(A0, C1, w, t, teta)
 
A1 = C1 * cos(teta * (pi/180))
A2 = C1 * sin(teta * (pi/180))
 
s = A0 + A1 * cos(w*t) + A2 * sin(w*t)
