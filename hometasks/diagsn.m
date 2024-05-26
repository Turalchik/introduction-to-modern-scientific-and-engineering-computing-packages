function res = diagsn(r, c),

  if (nargin == 1)
    c = r;
  endif

  row = 1;
  col = 1;
  res = zeros(r, c, "uint32");
  i = 1;

  while (i <= r * c)

    while (col > 0 && row <= r)
      res(row, col) = i;
      i += 1;
      row += 1;
      col -= 1;
    endwhile

    col += 1;

    if (row > r)
      row -= 1;
      col += 1;
    endif

    while (row > 0 && col <= c)
      res(row, col) = i;
      i += 1;
      col += 1;
      row -= 1;
    endwhile

    row += 1;

    if (col > c)
      col -= 1;
      row += 1;
    endif

  endwhile
endfunction
