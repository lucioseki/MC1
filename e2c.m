# s(t) = sin(t) + (1/3) * sin(3*t) + (1/5) * sin(5*t)
#
# uso: e2c(t)
# exemplo: plot(e2c([0:0.1:(2*pi)]))

function s = e2c(t)
  s = sin(deg2rad(t) + (1/3) * sin(deg2rad(3*t))) + (1/5) * sin(deg2rad(5*t));
endfunction
