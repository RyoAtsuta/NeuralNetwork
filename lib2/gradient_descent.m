function output = gradient_descent(network, error_object)
  
  output = network;
  learning_speed = 0.1;

  # update theta1
  output.theta1 = network.theta1 - network.learning_speed * error_object.delta1;

  # update theta2
  output.theta2 = network.theta2 - network.learning_speed * error_object.delta2;

  # update theta3
  output.theta3 = network.theta3 - network.learning_speed * error_object.delta3;

  # update theta4
  output.theta4 = network.theta4 - network.learning_speed * error_object.delta4;

  # for debug
  % output.theta4
