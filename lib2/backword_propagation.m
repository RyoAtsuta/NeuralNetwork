function error_object = backword_propagation(network, alpha_object, train_label)

  error_object = [];

  result1 = [];
  result2 = [];

  # Calculate 1
  ## layer 5
  result1.delta5 = alpha_object.alpha5 - train_label;

  ## layer 5 -> 4
  result1.delta4 = ((network.theta4)' * result1.delta5) .* alpha_object.alpha4 .* (1 - alpha_object.alpha4);

  ## layer 4 -> 3
  result1.delta3 = ((network.theta3)' * result1.delta4) .* alpha_object.alpha3 .* (1 - alpha_object.alpha3);
  
  ## layer 3 -> 2
  result1.delta2 = ((network.theta2)' * result1.delta3) .* alpha_object.alpha2 .* (1 - alpha_object.alpha2);

  # Calculate 2
  ## layer 5 -> 4
  result2.delta4 = result1.delta5 * (alpha_object.alpha4)';

  ## layer 4 -> 3
  result2.delta3 = result1.delta4 * (alpha_object.alpha3)';

  ## layer 3 -> 2
  result2.delta2 = result1.delta3 * (alpha_object.alpha2)';

  ## layer 2 -> 1
  result2.delta1 = result1.delta2 * (alpha_object.alpha1)';

  error_object = result2;