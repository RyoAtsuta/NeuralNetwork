function network = neural_network(layer, input_unit, hidden_unit, output_unit)

  # initialize theta
  ## initialize theta in input layer
  input_theta = random_init(hidden_unit, input_unit + 1);

  ## initialize theta in hidden layer
  hidden_theta_list = [];
  for i = 1:(layer-3)
    hidden_theta = random_init(hidden_unit, hidden_unit + 1);
    hidden_theta_list = [hidden_theta_list, hidden_theta];
  end

  ## initialize theta in output layer
  output_theta = random_init(output_unit, hidden_unit + 1);

  # reshape theta
  network.input_theta = input_theta;
  network.hidden_theta = reshape(hidden_theta_list, hidden_unit, hidden_unit + 1, layer - 3); 
  network.output_theta = output_theta;
  network.layer = layer;
  network.input_unit = input_unit;
  network.hidden_unit = hidden_unit;
  network.output_unit = output_unit;
