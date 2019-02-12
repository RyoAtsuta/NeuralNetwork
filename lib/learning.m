function network = learning(network, D, learning_rate)

  # add 0 for bias unit
  D.input_d = [zeros(network.hidden_unit, 1), D.input_d];
  D.hidden_d = [zeros(network.hidden_unit, 1, network.layer - 3), D.hidden_d];
  D.output_d = [zeros(network.output_unit, 1), D.output_d];

  # input layer
  network.input_theta -= learning_rate * D.input_d;

  # hidden layer
  network.hidden_theta -= learning_rate * D.hidden_d;

  # output layer
  network.output_theta -= learning_rate * D.output_d;
