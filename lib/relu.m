function output = relu(Z)
  X = Z > 0;
  output = Z .* X;