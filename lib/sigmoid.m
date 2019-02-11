function alpha = sigmoid(Z)
  alpha = [];
  for i = Z
    alpha = [alpha, (1 / (1 + e.**(-i)))];
  end
  alpha = alpha';
