function result = test_prediction(network, test_images, test_labels, labels)

  correct_count = 0;
  incorrect_count = 0;

  for i = 1:length(test_images)
    [label, percentage] = predict(network, test_images(:,i), labels);

    if label == test_labels(i)
      correct_count++;
    else
      incorrect_count++;
    end
  end

  result = correct_count / (correct_count + incorrect_count) * 100;
