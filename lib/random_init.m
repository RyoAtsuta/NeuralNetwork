function result = random_init(row, col)
  epsilon = 10**(-3);
  result = (rand(row, col) + 2 * epsilon) - epsilon;
