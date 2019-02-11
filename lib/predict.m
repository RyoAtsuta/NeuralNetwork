function percentage = predict(network, X)
  [percentage, result_code] = forward_propagation(network, X);
  
