function [j, D] = cost_function(network, X, Y)

  # forward propagation to get output alpha
  alpha = forward_propagation(network, X);

  # number of  training data
  m = length(Y);

  j = -1 / m * ((Y' * log(alpha.output_alpha)) + (1 - Y)' * log(1 - alpha.output_alpha));

  # Delta = back_propagation(network, alpha, Y);

  # D = calculate_derivative(network, Delta, m, 0);
  # D = [D.input_d(:); D.hidden_d(:); D.output_d(:)]; 
