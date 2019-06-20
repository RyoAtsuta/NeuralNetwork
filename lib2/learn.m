function output = learn(network, train_images, train_labels, labels)

  # Learning by all train_images and train_labels
  for i = 1:length(train_images)
    # normalize train_image for one hot encoding
    train_label = one_hot_encoding(train_labels, i, labels);

    # Forward Propagation (Prediction)
    alpha_object = forward_propagation(network, train_images(:,i));

    # Backword Propagation (Calculate Error)
    error_object = backword_propagation(network, alpha_object, train_label);

    # Gradient Descent to update Theta (Learning)
    network = gradient_descent(network, error_object);

  end

  output = network;