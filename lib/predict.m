function [label, percentage] = predict(network, X, labels)
  [alpha, result_code] = forward_propagation(network, X);

  [percentage, index] = max(alpha.output_alpha);
  label = labels(index);
