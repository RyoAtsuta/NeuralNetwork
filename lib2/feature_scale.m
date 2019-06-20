function X = feature_scale(X)
  max_value = max(max(X));
  min_value = min(min(X));
  mean_value = mean(mean(X));

  X = (X - mean_value) / (max_value - min_value);
