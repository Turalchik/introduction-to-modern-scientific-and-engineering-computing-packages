function res = fence(r, c)

  if (nargin == 1)
    c = r;
  endif

  res = (zeros(r, c) + mod(1:c, 2)) == 1;
endfunction
