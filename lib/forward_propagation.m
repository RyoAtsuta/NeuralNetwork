function [alpha, result_code] = forward_propagation(network, X)

  # check neural network
  if !(isfield(network, "input_theta") &&  isfield(network, "hidden_theta") && isfield(network, "output_theta")
    && isfield(network, "input_unit") && isfield(network, "hidden_unit") && isfield(network, "output_unit")
    && isfield(network, "layer"))
    alpha = [];
    result_code = -1;
    disp("Invalid Neural Network. Please call neural_network function to get neural_network.");
    return;
  end

  # input layer
  adding_alpha = X;
  alpha.input_alpha = adding_alpha;

  # hidden layer
  adding_alpha = sigmoid(network.input_theta * [1; adding_alpha]);
  alpha.hidden_alpha = adding_alpha;

  for i = 1:(network.layer - 3)
    adding_alpha = sigmoid(network.hidden_theta(:,:,i) * [1; adding_alpha]);
    alpha.hidden_alpha = [alpha.hidden_alpha, adding_alpha];
  end

  # output layer
  adding_alpha = sigmoid(network.output_theta * [1; adding_alpha]);
  alpha.output_alpha = adding_alpha;
  result_code = 0;
