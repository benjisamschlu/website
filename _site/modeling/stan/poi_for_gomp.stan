data {
  int<lower=0> A; // nber of intervals 
  vector<lower=0>[A] age; // age-55
  vector<lower=0>[A] n; // exposure
  int<lower=0> d[A]; // deaths
}
parameters {
  real a;
  real<lower=0> b;
}
transformed parameters {
  vector[A] eta = a + b*age; // linear predictor
}
model {
  vector[A] log_lambda;
  log_lambda = a + b*age + log(n);
  // Likelihood
  d ~ poisson_log(log_lambda);

  // Priors
  a ~ normal(0, 10);
  b ~ normal(0, 10);
}

