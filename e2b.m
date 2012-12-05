# s(t) = sin(t) + (1/3) * sin(3*t)
#
# uso: e3a(t)
# exemplo: plot(e3a([0:0.1:(2*pi)]))

function s = e3a(t)
  s = sin(t*(pi/180)) + (1/3) * sin(3*t*(pi/180));
endfunction
