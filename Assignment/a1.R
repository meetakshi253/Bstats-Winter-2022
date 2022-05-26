library(ggplot2)
Generate_Patients <- function(p, s)
{
  #generate 100 random bernoulli trials with the given probability(efficacy) and seed
  #0-patient i has not recovered, 1-patient has recovered
  
  #set.seed(s)
  smp <- rbinom(600, 1, p)
  sample <- data.frame(smp);
  return (sample)
}

Simulation_Study <- function(n, p)
{
  #return a data frame with the results of 100 (rows) simulated patients as a set of binary values
  #generated with probability p (efficacy), repeated n (columns) times
  
  records = data.frame()
  for (i in 1:n)
  {
    seedval = i+as.integer(p) 
    samples <- Generate_Patients(p, seedval)
    nm <- paste(c("sample", i), collapse = "")
    if(i==1)
      records <- rbind(records, samples)
    else
      records <- cbind(records, samples) 
    colnames(records)[i] <- nm
  }
  return (records)
}

Statistical_Power <- function(efficacy, n_repeat)
{
  records <- Simulation_Study(n_repeat, efficacy)
  nm <- colnames(records)
  passed_samples = 0
  for (i in 1:n_repeat)
  {
    s <- sum(records[i])
    if(s>=528)
    {
      passed_samples <- passed_samples+1
    }
  }
  print(passed_samples)
  
  percentage = (passed_samples/n_repeat)*100
  return (percentage)
}

Statistical_Power(0.90, 20)
print(p2)

Question_1 <- function()
{
  p = Statistical_Power(0.85, 20)
  print(sprintf("True efficacy of the antibiotic: %f", 0.85))
  print(sprintf("Statistical Power (in percent): %f", p))
}

Question_2 <- function()
{
  p1 = Statistical_Power(0.80, 20)
  p2 = Statistical_Power(0.90, 20)
  p3 = Statistical_Power(0.95, 20)
  print(sprintf("True efficacy of the antibiotic: %f", 0.80))
  print(sprintf("Statistical Power (in percent): %f", p1))
  print(sprintf("True efficacy of the antibiotic: %f", 0.90))
  print(sprintf("Statistical Power (in percent): %f", p2))
  print(sprintf("True efficacy of the antibiotic: %f", 0.95))
  print(sprintf("Statistical Power (in percent): %f", p3))
}

Question_3 <- function()
{
  p1 = Statistical_Power(0.80, 20)
  p2 = Statistical_Power(0.85, 20)
  p3 = Statistical_Power(0.90, 20)
  p4 = Statistical_Power(0.95, 20)
  ind <- c(0.80, 0.85, 0.90, 0.95)
  dep <- c(p1, p2, p3, p4)
  plot(x=ind, y=dep, xlab="Efficacy", ylab="Statistical Power", pch=16)
  abline(lm(ind~dep), col="red")
}

Question_1()
Question_2()
Question_3()

