disp("start");
fin = fopen("image/MNIST_DATA/t10k-images-idx3-ubyte", "r", "b");
data = fread(fin, 1, "int32");
disp(data);
fclose(fin);
