function train_label = one_hot_encoding(train_labels, index, labels)

  train_label = zeros(length(labels), 1);

  if train_labels(index) != 0
    train_label(train_labels(index)) = 1;
  else
    train_label(length(labels)) = 1;
  end
