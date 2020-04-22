warning("off", "all");

# load files to get mnist variables
#------ loaded mnist variable ------
#
#  ##### train image #####
#  -  train_images
#  -  train_images_number
#  -  train_images_row
#  -  train_images_col
#
#  ##### train label #####
#  -  train_labels
#  -  train_labels_number
#  -  train_labels_row
#  -  train_labels_col
#
#  ##### test image ######
#  -  test_images
#  -  test_images_number
#  -  test_images_row
#  -  test_images_col
#
#  ##### test label ######
#  -  test_labels
#  -  test_labels_number
#  -  test_labels_row
#  -  test_labels_col
#
# labels = 
#       1   2   3   4   5   6   7   8   9   0

loader;

input_unit = 784;
hidden_unit = input("Hidden Unit: ");
output_unit = 10;
epoch = input("Epoch: ");

# Create Neural Network
network = neural_network(input_unit, hidden_unit, output_unit);
disp("Created Neural Network");

# Feature Scaling
mnist.train_images = feature_scale(mnist.train_images);
mnist.test_images = feature_scale(mnist.test_images);

# Learning
disp("Now Learning...");
for i = 1:epoch
  network = learn(network, mnist.train_images, mnist.train_labels, labels);
end

# Test
disp("Now Testing...");
result = test_prediction(network, mnist.test_images, mnist.test_labels, labels);

disp("Correct probability is: ");
disp(result);
