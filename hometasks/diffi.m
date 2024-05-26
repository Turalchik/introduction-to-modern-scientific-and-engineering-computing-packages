function res = diffi(fd, ts, h = 1e-8)
  fd
  % Функция для приближенного вычисления значения производной векторной функции
  for k = 1:length(ts)
    res(k) = (fd(ts(k) + h) - fd(ts(k))) / h;
  endfor
endfunction
