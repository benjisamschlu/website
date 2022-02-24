data {
  int<lower=0> T; // nber of time points
  int<lower=0> n[T]; // population
  int y[T]; // individual with disease
}
parameters {
  real a;
  vector[T] phi;
  real<lower=0> sigma;
}
transformed parameters {
  vector[T] eta;

  eta = a + phi;
}
model {
  // Likelihood
  y ~ binomial_logit(n, eta);
  
  // Priors
  a ~ normal(0, 10);
  phi[1] ~ normal(0, 10);
  phi[2:T] ~ normal(phi[1:(T-1)], sigma);
  sigma ~ normal(0, 10);
}
generated quantities {
    vector[T] p_hat = 1 ./ (1+exp(-eta));
}