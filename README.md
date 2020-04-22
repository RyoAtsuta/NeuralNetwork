# Neural Network
## Description
This octave program is developed by motivation of showing how Neural Network works and how to develop.
I wrote this program as simple way as possible, so you can check it and understand how to develop Neural Network.

## Octave Version
- octave (5.1.0)

## Setup (For only Mac)
### Install Octave
```
brew install octave
```

 (I didn't check enough if this installation works, so if you can't install octave I'm sooooo sorry :D)

### Place MNIST images
- Since Neural Network have to learn how to classify the images, you have to store the images to proper directory in this program.
- Access to [THE MNIST DATABASE of handwritten digits](http://yann.lecun.com/exdb/mnist/) and download below:
```
train-images-idx3-ubyte.gz:  training set images (9912422 bytes)
train-labels-idx1-ubyte.gz:  training set labels (28881 bytes)
t10k-images-idx3-ubyte.gz:   test set images (1648877 bytes)
t10k-labels-idx1-ubyte.gz:   test set labels (4542 bytes)
```

- Place them to:

```
image/MNIST_DATA/
```

## How to run
In the project root, run the command below:
```
octave start_learning.m
```

Then it will show
```
now loading...
imported load_mnist_files()
imported random_init(row, col)
imported neural_network(layer, input_unit, hidden_unit, output_unit)
------ loaded mnist variable ------

  ##### train image #####
  -  train_images
  -  train_images_number
  -  train_images_row
  -  train_images_col

  ##### train label #####
  -  train_labels
  -  train_labels_number
  -  train_labels_row
  -  train_labels_col

  ##### test image ######
  -  test_images
  -  test_images_number
  -  test_images_row
  -  test_images_col

  ##### test label ######
  -  test_labels
  -  test_labels_number
  -  test_labels_row
  -  test_labels_col

labels = 
   1   2   3   4   5   6   7   8   9   0
```

Type the number of hidden unit and epoch you want to add and then run it (My recommendation is 10 units and 1 epoch)
If you increases the value of Hidden Unit, it will basically increases accuracy (Learning process become much slower, though)
If you Increases the value of Epoch, it will repeat learning process as the same times as you chose the number (e.g. 60000 images * 3 epochs)

```
Hidden Unit: 10
Epoch: 1
```

```
ans =

  -0.3087658   0.6515076  -0.8228098   0.1207865   0.6496248
  -0.6570777   0.3050530  -0.0080399  -0.0026317   0.3123448
   0.6995058  -0.2232402  -0.0998856  -0.5946876  -0.5743629
  -0.5261551   0.8726956  -0.6602643  -0.0261171   0.1068555
   0.0508772  -0.1939557  -0.9055499   0.1324322   0.3861068
   0.5195082  -0.1001977  -0.0465949  -1.0240467  -0.2522382
  -0.5854354   0.9535603  -0.4563710   0.5261279  -0.3086606
  -0.6980696  -0.3104442   0.1117218   0.0449199   0.4214025
  -0.7855043   0.2409326  -0.1139514  -0.1678585   0.5813130
  -0.0428865  -0.5978218  -0.9586157   0.2844366   1.0679188

ans =

  -0.30939405   0.65109268  -0.82350187   0.12034704   0.64911155
  -0.65219392   0.30827861  -0.00266014   0.00078445   0.31633488
   0.69896535  -0.22359717  -0.10048098  -0.59506564  -0.57480448
  -0.52664874   0.87236958  -0.66080814  -0.02646238   0.10645216
   0.05039915  -0.19427139  -0.90607647   0.13209787   0.38571624
   0.51899012  -0.10053982  -0.04716553  -1.02440902  -0.25266145
  -0.58600665   0.95318296  -0.45700031   0.52572828  -0.30912728
  -0.69862181  -0.31080886   0.11111358   0.04453369   0.42095134
  -0.78605953   0.24056586  -0.11456300  -0.16824685   0.58085938
  -0.04343330  -0.59818291  -0.95921794   0.28405420   1.06747213


...

Now Testing...
Correct probability is: 
 79.160
```

These parameters are the weights of Neural Network which tries to learn MNIST hand-written number images.
You can check how they change while running.

After it learns, You can see the test score to check the accuracy of your model.