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
# uso: e1c(A0, C1, w, t, teta)
# exemplo: plot(e1c(1, 1, 2, [0:0.1:(2*pi)], 30))

function s = e1c(A0, C1, w, t, teta)
  A1 = C1 * cos(deg2rad(teta));
  A2 = C1 * sin(deg2rad(teta));
  s = A0 + A1 * cos(w*t) + A2 * sin(w*t);
endfunction
