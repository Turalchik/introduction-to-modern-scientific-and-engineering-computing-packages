function MA = mirrorm(A, l)
  upper = horzcat(my_flip(A(1:l, 1:l)), flipud(A(1:l, :)), transpose(A(1:l, (columns(A) - l + 1):columns(A))));
  middle = horzcat(fliplr(A(:, 1:l)), A, fliplr(A(:, (columns(A) - l + 1):columns(A))));
  down = horzcat(transpose(A((rows(A) - l + 1):rows(A), 1:l)), flipud(A((rows(A) - l + 1):rows(A), :)), my_flip(A((rows(A) - l + 1):rows(A), (columns(A) - l + 1):columns(A))));
  MA = vertcat(upper, middle, down);
end

function out = my_flip(B)
    out = transpose(flipud(fliplr(B)));
endfunction
