# load files to get mnist variables
loader;

# configure settings of neural network architecture
layer = input("How many layers?: ");
input_unit = input("How many input units?: ");
hidden_unit = input("How many hidden units?: ");
output_unit = input("How many output units?: ");
learning_rate = input("Learning Late?: ");
lambda = input("Degree of lambda?: ");

network = neural_network(layer, input_unit, hidden_unit, output_unit);

disp("created neural network.");

m = mnist.train_images_number;

disp("Now learning...");

for i = 1:m
  [alpha, result_code] = forward_propagation(network, mnist.train_images(:,i));

  Y = zeros(length(labels), 1);

  if mnist.train_labels(i) != 0
    Y(mnist.train_labels(i)) = 1;
  else
    Y(length(labels)) = 1;
  end

  Delta = back_propagation(network, alpha, Y);
  D = calculate_derivative(network, Delta, m, lambda);
  network = learning(network, D, learning_rate);
end

m = mnist.test_images_number;
correct_count = 0;
incorrect_count = 0;

disp("Now predicting...");

for i = 1:m
  [label, percentage] = predict(network, mnist.test_images(:,i), labels);

  if label == mnist.test_labels(i)
    correct_count++;
  else
    incorrect_count++;
  end
end

result = correct_count / (correct_count + incorrect_count) * 100;
disp("correct probability is: ");
disp(result);
