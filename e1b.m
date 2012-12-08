# s(t) = A0 + C1 * cos(w*t + teta)
#
# A0 = altura media do sinal em relacao as abcissas
# C1 = constante
# w = frequencia angular = (2*pi / T0) = (2*pi * f0)
# t = variavel de tempo
# teta = angulo de fase em graus (deslocamento horizontal do sinal)
#
# uso: e1b(A0, C1, w, t, teta)
# exemplo: plot(e1b(3, 3, 2, [0:0.1:(2*pi)], 30))

function s = e1b(A0, C1, w, t, teta)
  c = cos(w*t+(deg2rad(teta)));
  s = A0 + C1 * c;
endfunction
