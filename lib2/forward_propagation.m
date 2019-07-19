function alpha_object = forward_propagation(network, train_image, activator)
  
  # Activator Choise
  # - relu
  # - sigmoid
  # - softmax

  alpha_object = [];
  alpha_object.alpha1 = train_image;

  # layer 1 -> 2
  alpha_object.alpha2 = sigmoid(network.theta1 * alpha_object.alpha1);

  # layer 2 -> 3
  alpha_object.alpha3 = sigmoid(network.theta2 * alpha_object.alpha2);

  # layer 3 -> 4
  alpha_object.alpha4 = sigmoid(network.theta3 * alpha_object.alpha3);

  # layer 4 -> 5
  alpha_object.alpha5 = softmax(network.theta4 * alpha_object.alpha4);

  # for debug
  alpha_object.alpha5