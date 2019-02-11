function result_code = learning(network, D, learning_rate)

  size(network.input_theta)
  size(D.input_d)
  size(network.hidden_theta)
  size(D.hidden_d)
  size(network.output_theta)
  size(D.output_d)


  D.input_d = [zeros(network.layer, 1), D.input_d];
  D.hidden_d = [zeros(network.layer, 1, network.layer - 3), D.hidden_d];
  D.output_d = [zeros(network.layer, 1), D.output_d];

  # input layer
  network.input_theta += learning_rate * D.input_d;

  # hidden layer
  network.hidden_theta += learning_rate * D.hidden_d;

  # output layer
  network.output_theta += learning_rate * D.output_d;
