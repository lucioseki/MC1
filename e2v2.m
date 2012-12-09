#uso: e2a(t), onde t eh um vetor
#a 'onda especial' corresponde a uma serie de fourier

function s = e2a(t)
  s = sin(t) ;
endfunction

function s = e2b(t)
  s = sin(t) + (1/3) * sin(3*t);
endfunction

function s = e2c(t)
  s = sin(t) + (1/3) * sin(3*t) + (1/5) * sin(5*t);
endfunction