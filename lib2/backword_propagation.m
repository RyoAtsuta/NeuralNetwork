function error_object = backword_propagation(network, alpha_object, train_label, train_images_number)

  error_object = [];

  result1 = [];
  result2 = [];
  result3 = [];

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

  # Calculate 3
  ## layer 4
  result3.delta4 = (1 / train_images_number) * (result2.delta4 + network.lambda * network.theta4);

  ## layer 3
  result3.delta3 = (1 / train_images_number) * (result2.delta3 + network.lambda * network.theta3);

  ## layer 2
  result3.delta2 = (1 / train_images_number) * (result2.delta2 + network.lambda * network.theta2);

  ## layer 1
  result3.delta1 = (1 / train_images_number) * (result2.delta1 + network.lambda * network.theta1);

  error_object = result3;