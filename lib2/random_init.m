function result = random_init(row, col)
  epsilon = 1;
  result = (rand(row, col) * 2 * epsilon) - epsilon;
