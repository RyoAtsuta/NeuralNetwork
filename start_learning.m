warning("off", "all");

# load files to get mnist variables
loader;

# configure settings of neural network architecture
layer = 6; # input("How many layers?: ");
input_unit = 784; # input("How many input units?: ");
hidden_unit = 10; # input("How many hidden units?: ");
output_unit = 10; # input("How many output units?: ");
learning_rate = input("Learning Late?: ");
lambda = 0.0025; # input("Degree of lambda?: ");

network = neural_network(layer, input_unit, hidden_unit, output_unit);

disp("created neural network.");

j_list = [];
e_list = [];

m = mnist.train_images_number;

epoch = 20;
e = 1;

disp("Now learning...");

i = 1;
while e <= epoch
  X = mnist.train_images(:,i);
  X = feature_scale(X);
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

  if mod(i, m) == 0
    j = cost_function(network, X, Y);
    j_list = [j_list, j];
    e_list = [e_list, e];
    plot(e_list, j_list);
    e++;
    if e <= epoch
      # learning_rate = input("Learning Late?: ");
      i = 0;
    end
  end

  # network.output_theta ####### This is for debuging to monitor theta
  # alpha.output_alpha   ####### This is for debuging to monitor alpha
  i++;
end

m = mnist.test_images_number;
correct_count = 0;
incorrect_count = 0;

plot(e_list, j_list);

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
