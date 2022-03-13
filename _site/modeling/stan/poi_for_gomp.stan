data {
  int<lower=0> A; // nber of intervals 
  vector<lower=0>[A] age; // age-85
  int<lower=0> n[A]; // exposure
  int d[A]; // deaths
}
parameters {
  real a;
  real<lower=0> b;
}
transformed parameters {
  vector[A] eta;
  vector[A] log_lambda;
  
  for (i in 1:A){
    eta[i] = a + b * age[i];
    log_lambda[i] = eta[i] + log(n[i]);
  }
  
}
model {
  // Likelihood
  d ~ poisson_log(log_lambda);

  // Priors
  a ~ normal(0, 10);
  b ~ normal(0, 10);
}
generated quantities {
    int pred_d[A];
    vector[A] pred_h;
    for (i in 1:A){
      pred_d[i] = poisson_log_rng(log_lambda[i]);
      pred_h[i] = pred_d[i] / n[i] ;
    }
    
}
