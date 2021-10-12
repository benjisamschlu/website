data {
  int<lower=0> t; // number of time points
  vector[t] y; // number of people having a given characteristic
  vector[t] n; // 
}

parameters {
  real<lower=0, upper=1> p[t];
  real alpha[1];
  real phi[t];
  real<lower=0> sigma;
}

transformed parameters {
  real eta[t];
  vector[t] ones;

  ones = rep_vector(1, t);
  
  eta = alpha + phi;
  p = exp(eta)/(ones + exp(eta));
  
}

model {
  
  // priors
  alpha ~ normal(0, 10);
  phi[1] ~ normal(0, 10);
  phi[2:t] ~ normal(phi[1:(t-1)], sigma);
  sigma ~ normal(0, 10);
  
  // likelihood
  y ~ binomial_logit_lpmf(y | n, eta);
}

