function output_alpha = softmax(alpha)
  total_exp = sum(exp(alpha));
  output_alpha = exp(alpha) ./ total_exp;
end
