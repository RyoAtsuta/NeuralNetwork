disp("now loading...");
addpath("lib2");
disp("imported load_mnist_files()");
disp("imported random_init(row, col)");
disp("imported neural_network(layer, input_unit, hidden_unit, output_unit)");

mnist = load_mnist_files();

labels = [1,2,3,4,5,6,7,8,9,0];

disp("------ loaded mnist variable ------");
disp("");
disp("  ##### train image #####");
disp("  -  train_images");
disp("  -  train_images_number");
disp("  -  train_images_row");
disp("  -  train_images_col");
disp("");

disp("  ##### train label #####");
disp("  -  train_labels");
disp("  -  train_labels_number");
disp("  -  train_labels_row");
disp("  -  train_labels_col");
disp("");

disp("  ##### test image ######");
disp("  -  test_images");
disp("  -  test_images_number");
disp("  -  test_images_row");
disp("  -  test_images_col");
disp("");

disp("  ##### test label ######");
disp("  -  test_labels");
disp("  -  test_labels_number");
disp("  -  test_labels_row");
disp("  -  test_labels_col");
disp("");

disp("labels = ");
disp(labels);
