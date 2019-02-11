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

[alpha, result_code] = forward_propagation(network, mnist.train_images(:,1));
disp("processed forward propagation");

Delta = back_propagation(network, alpha, mnist.train_labels(1));
disp("processed back propagation");

D = calculate_derivative(network, Delta, 1, lambda);
disp("calculated derivative");

# options = optimset("GradObj", "on", "MaxIter", 100);
# [opt_theta, function_val, exit_flag] = fminunc(@cost_function, initial_theta, options);

learning(network, D, learning_rate);


