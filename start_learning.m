warning("off", "all");

# load files to get mnist variables
loader;

# configure settings of neural network architecture
layer = 5; # input("How many layers?: ");
input_unit = 784; # input("How many input units?: ");
hidden_unit = 100; # input("How many hidden units?: ");
output_unit = 10; # input("How many output units?: ");
learning_rate = input("Learning Late?: ");
lambda = 0; # 0.0025; # input("Degree of lambda?: ");

network = neural_network(layer, input_unit, hidden_unit, output_unit);

disp("created neural network.");

j_list = [];
i_list = [];

m = mnist.train_images_number;

disp("Now learning...");

for i = 1:m
  X = mnist.train_images(:,i);
  [alpha, result_code] = forward_propagation(network, X);

  Y = zeros(length(labels), 1);

  if mnist.train_labels(i) != 0
    Y(mnist.train_labels(i)) = 1;
  else
    Y(length(labels)) = 1;
  end

  Delta = back_propagation(network, alpha, Y);
  D = calculate_derivative(network, Delta, m, lambda);
  network = learning(network, D, learning_rate);

  if mod(i, 500) == 0
    j = cost_function(network, X, Y);
    j_list = [j_list, j];
    i_list = [i_list, i];
    # plot(i_list, j_list);
  end
  
  # network.output_theta ####### Monitor this theta
  # alpha.output_alpha   ####### Monitor this alpha
end

m = mnist.test_images_number;
correct_count = 0;
incorrect_count = 0;

plot(i_list, j_list);

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
