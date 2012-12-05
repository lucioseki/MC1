# s(t) = A * cos(w*t)
#
# T0 = frequencia fundamental
# f0 = frequencia fundamental
#
# A = altura do cosseno  
# w = frequencia angular = (2*pi / T0) = (2*pi * f0)
# t = variavel tempo
#
# uso: e1(A, w, t)
# exemplo: plot(e1(1, 2, [0:0.1:(2*pi)]))

function s = e1(A, w, t)
  c = cos(w*t);
  s = A * c;
endfunction
