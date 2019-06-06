function alpha = sigmoid(Z)
  alpha = 1 ./ (1 + exp(-Z));
end
