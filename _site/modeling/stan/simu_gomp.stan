functions {
  // Inverse survival function
  real inv_survival(real u, real a, real b) {
    return (1/b) * log(1 - ((b/a)*log(1 - u))) ;
  }
}

data {
  int<lower=1> N;
  real a;
  real<lower=0> b;
}

generated quantities {
  real<lower=0> t[N];
  
  for (n in 1:N) {
    real u = uniform_rng(0, 1);
    t[n] = inv_survival(u, a, b);
  }
}

