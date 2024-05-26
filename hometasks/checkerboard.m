function res = checkerboard(r, c)

  if (nargin == 1)
    c = r;
  endif

  square = r * c;
  if (mod(r, 2) != 0)
    res = mod(reshape(1:square, r, c), 2) == 1;
  else
    res = mod(reshape(1:square, r, c) + mod(1:c, 2), 2) == 0;
  endif

endfunction
