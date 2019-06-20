function network = neural_network(input_unit, hidden_unit, output_unit)

  layer = 5;

  # initialize theta
  ## initialize theta in input layer
  theta1 = random_init(hidden_unit, input_unit); # 5 x 784

  ## initialize theta in hidden layer
  theta2 = random_init(hidden_unit, hidden_unit); # 5 x 5
  theta3 = random_init(hidden_unit, hidden_unit); # 5 x 5

  ## initialize theta in output layer
  theta4 = random_init(output_unit, hidden_unit); # 10 x 5

  # returns
  ## layer
  network.layer = layer;

  ## theta
  network.theta1 = theta1;
  network.theta2 = theta2;
  network.theta3 = theta3;
  network.theta4 = theta4;

  ## unit
  network.input_unit = input_unit;
  network.hidden_unit = hidden_unit;
  network.output_unit = output_unit;
