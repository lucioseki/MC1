# s(t) = sin(t) + (1/3) * sin(3*t)
#
# uso: e2b(t)
# exemplo: plot(e2b([0:0.1:(2*pi)]))

function s = e2b(t)
  s = sin(deg2rad(t) + (1/3) * sin(deg2rad(3*t)));
endfunction
