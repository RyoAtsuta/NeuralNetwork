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

for i = 1:m
  [alpha, result_code] = forward_propagation(network, mnist.train_images(:,i));
  Delta = back_propagation(network, alpha, mnist.train_labels(i));
  D = calculate_derivative(network, Delta, m, lambda);
  network = learning(network, D, learning_rate);
end
