# s(t) = A * cos(w*t)
# T0 = frequencia fundamental
# f0 = frequencia fundamental
# A = altura do cosseno  
# w = frequencia angular
# w = 2*pi / T0 = 2*pi * f0
# t = variavel tempo
# exemplo: plot(e1(3, 2, [0:1:(2*pi)]))
function s = e1(A, w, t)
 
# cos e sin só aceita valores como entrada em radianos
# por exemplo 180  graus = pi, 90 graus = pi/2
# rad = degree * (pi/180)
c = cos(w*t);
 
# para exibir valores
# disp(c);
 
s = A * c;

# em 1s tenho a frequencia de amostragem
# t = 10s
