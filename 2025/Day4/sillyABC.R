
obs <- rnorm(20, 0, 0.1)

# what is the estimate of the mean if I know that it comes from a Normal distribution?

# simulation-based approach

means <- seq(-2,2,0.1)

th <- 0.1
mean_post <-c()

for (i in 1:1e5) {
	# prior sampling
	mean_i <- sample(means,1)
	# generate simulated data
	sim <- rnorm(1, mean_i, 0.1)
	# rejection
	diffs <- mean(abs(sim-obs))
	if (diffs<th) mean_post <- c(mean_post, mean_i)
}

mean(mean_post)

hist(mean_post)

# -----------------------------------




# analytical solution

mean(obs)




