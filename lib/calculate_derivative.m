function D = calculate_derivative(network, Delta, total, lambda)

  # preparation for calculation
  ## avoid affecting network theta
  output_theta = network.output_theta;
  hidden_theta = network.hidden_theta;
  input_theta = network.input_theta;

  ## remove bias unit from theta
  output_theta(:,1) = [];
  hidden_theta(:,1) = [];
  input_theta(:,1) = []; 

  # input layer
  D.input_d = (1 / total) * (Delta.input_delta + lambda * input_theta);

  # hidden layer
  for i = 1:(network.layer - 3)
    D.hidden_d = (1 / total) * (Delta.hidden_delta(:,:,i) + lambda * hidden_theta(:,:,i));
  end

  # output layer
  D.output_d = (1 / total) * (Delta.output_delta + lambda * output_theta);
