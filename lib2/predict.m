function [label, percentage] = predict(network, train_image, labels)
  
  alpha_object = forward_propagation(network, train_image);

  [percentage, index] = max(alpha_object.alpha5);
  label = labels(index);
