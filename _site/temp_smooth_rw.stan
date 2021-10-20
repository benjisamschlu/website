data {
  int<lower=0> N; // number of lines
  int<lower=0> T_pts; // number of time points
  
  int<lower=0, upper=1> y[N]; // success/failure
  int<lower=1, upper=81> t[N]; // time point of success/failure
}

parameters {
  real alpha;
  vector[T_pts] phi;
  real<lower=0> sigma;
}

transformed parameters {
  vector[T_pts] eta;
  vector[T_pts] p_hat;


  // ones = rep_vector(1, t);
  eta = alpha + phi;
  
  for (i in 1:T_pts){
      p_hat[i] = 1/(1+exp(-eta[i]));
  }
  
}

model {
  
  // priors
  alpha ~ normal(0, 10);
  phi[1] ~ normal(0, 10);
  phi[2:T_pts] ~ normal(phi[1:(T_pts-1)], sigma);
  sigma ~ normal(0, 10);
  
  // likelihood
  for (i in 1:N) {
      y[i] ~ bernoulli_logit(eta[ t[i] ]);

  }
}

