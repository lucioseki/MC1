%
% [0:0.1:2000] eh um intervalo relativamente bom
%

function e2d()
  t = [0:0.1:2000];
  subplot(2, 2, 1), plot(e2a(t)), title("sin(t)");
  subplot(2, 2, 2), plot(e2b(t)), title("sin(t) + 1/3(sin(3t))");
  subplot(2, 2, 3), plot(e2c(t)), title("sin(t) + 1/3(sin(3t)) + 1/5(sin(5t))");
endfunction
