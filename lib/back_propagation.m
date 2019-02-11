function Delta = back_propagation(network, alpha, Y)

  # preparation for calculation
  output_theta = network.output_theta;
  hidden_theta = network.hidden_theta;
  input_theta = network.input_theta;

  ## remove bias unit from theta
  output_theta(:,1) = [];
  hidden_theta(:,1) = [];
  input_theta(:,1) = [];

  # calculate delta
  ## output layer
  delta.output_delta = alpha.output_alpha - Y;

  ## between output layer and hidden layer
  last_hidden_layer = network.layer - 2;
  delta.hidden_delta = (output_theta' * delta.output_delta) .* alpha.hidden_alpha(:,last_hidden_layer) .* (1 - alpha.hidden_alpha(:,last_hidden_layer));

  ## hidden layer
  for i = (last_hidden_layer - 1):-1:1
    adding_delta = (hidden_theta(:,:,i)' * delta.hidden_delta(:,(last_hidden_layer) - i)) .* alpha.hidden_alpha(:, i) .* (1 - alpha.hidden_alpha(:, i));
    delta.hidden_delta = [delta.hidden_delta, adding_delta];
  end

  ## between input layer and hidden layer
  ## delta.input_delta = (input_theta' * delta.hidden_delta(:,last_hidden_layer)) .* alpha.input_alpha .* (1 - alpha.input_alpha);

  # calculate Delta
  ## initialize Delta to zero
  Delta.output_delta = zeros(network.output_unit, network.hidden_unit);
  Delta.hidden_delta = zeros(network.hidden_unit, network.hidden_unit, network.layer - 3);
  Delta.input_delta = zeros(network.hidden_unit, network.input_unit);

  ## between output layer and hidden layer
  Delta.output_delta += delta.output_delta * alpha.hidden_alpha(:,last_hidden_layer)';
 
  ## hidden layer
  adding_delta = [];
  for i = 1:(last_hidden_layer-1)
    adding_delta = Delta.hidden_delta(:,:,i) + delta.hidden_delta(:,last_hidden_layer-i) * alpha.hidden_alpha(:,i)';
    Delta.hidden_delta(:,:,i) = adding_delta;
  end

  ## input layer
  Delta.input_delta += delta.hidden_delta(last_hidden_layer) * alpha.input_alpha';
  
