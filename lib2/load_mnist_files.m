function mnist = load_mnist_files()

  # open files
  mnist_dir_path = "image/MNIST_DATA";
  train_images_fin = fopen([mnist_dir_path, "/train-images-idx3-ubyte"], "r", "b");
  train_labels_fin = fopen([mnist_dir_path, "/train-labels-idx1-ubyte"], "r", "b");
  test_images_fin = fopen([mnist_dir_path, "/t10k-images-idx3-ubyte"], "r", "b");
  test_labels_fin = fopen([mnist_dir_path, "/t10k-labels-idx1-ubyte"], "r", "b");

  # read train image file
  train_images_ignore_data = fread(train_images_fin, 1, "int32");
  mnist.train_images_number = fread(train_images_fin, 1, "int32");
  mnist.train_images_row = fread(train_images_fin, 1, "int32");
  mnist.train_images_col = fread(train_images_fin, 1, "int32");
  mnist.train_images = fread(train_images_fin, [mnist.train_images_row * mnist.train_images_col mnist.train_images_number], "uint8");

  # read train label file
  train_labels_ignore_data = fread(train_labels_fin, 1, "int32");
  mnist.train_labels_number = fread(train_labels_fin, 1, "int32");
  mnist.train_labels_row = mnist.train_labels_number;
  mnist.train_labels_col = 1;
  mnist.train_labels = fread(train_labels_fin, mnist.train_labels_number, "uint8");

  # read test image file
  test_images_ignore_data = fread(test_images_fin, 1, "int32");
  mnist.test_images_number = fread(test_images_fin, 1, "int32");
  mnist.test_images_row = fread(test_images_fin, 1, "int32");
  mnist.test_images_col = fread(test_images_fin, 1, "int32");
  mnist.test_images = fread(test_images_fin, [mnist.test_images_row * mnist.test_images_col mnist.test_images_number], "uint8");

  # read test label file
  test_labels_ignore_data = fread(test_labels_fin, 1, "int32");
  mnist.test_labels_number = fread(test_labels_fin, 1, "int32");
  mnist.test_labels_row = mnist.test_labels_number;
  mnist.test_labels_col = 1;
  mnist.test_labels = fread(test_labels_fin, mnist.test_labels_number, "uint8");

  # close files
  fclose(train_images_fin);
  fclose(train_labels_fin);
  fclose(test_images_fin);
  fclose(test_labels_fin);

