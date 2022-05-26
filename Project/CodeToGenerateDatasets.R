# set the path of the directory where you want to save these files: 
setwd("~/Documents/R/Project")


# Generate transciptomic data for untreated cells (T0):
Cntrl <- matrix(rnorm(1000*4, mean = 560, sd = 135), 1000, 4)

colnames(Cntrl) <- paste0("Ctrl_", letters[1:4])
Genes <- paste0("GENE",1:1000)

Cntrl <- as.data.frame(cbind(Genes, Cntrl))



# Generate transciptomic data for compound C1 (TC1):
c1 <- matrix(rnorm(1000*4, mean = 700, sd = 162), 1000, 4)

colnames(c1) <- paste0("C1_", letters[1:4])

c1 <- as.data.frame(cbind(Genes, c1))



# Generate transciptomic data for compound C2 (TC2):
c2 <- matrix(rnorm(1000*4, mean = 720, sd = 153), 1000, 4)

colnames(c2) <- paste0("C2_", letters[1:4])

c2 <- as.data.frame(cbind(Genes, c2))



# Generate transciptomic data for compound C3 (TC3):
c3 <- matrix(rnorm(1000*4, mean = 898, sd = 116), 1000, 4)

colnames(c3) <- paste0("C3_", letters[1:4])

c3 <- as.data.frame(cbind(Genes, c3))



# Generate transciptomic data for compound C4 (TC4):
c4 <- matrix(rnorm(1000*4, mean = 560, sd = 284), 1000, 4)

colnames(c4) <- paste0("C4_", letters[1:4])

c4 <- as.data.frame(cbind(Genes, c4))



# Generate transciptomic data for compound C5 (TC5):
c5 <- matrix(rnorm(1000*4, mean = 910, sd = 105), 1000, 4)

colnames(c5) <- paste0("C5_", letters[1:4])

c5 <- as.data.frame(cbind(Genes, c5))


# save the data tables in CSV format:
write.table(Cntrl, file = "T0_data.csv", sep = ",", row.names = FALSE, quote = FALSE)
write.table(c1, file = "TC1_data.csv", sep = ",", row.names = FALSE, quote = FALSE)
write.table(c2, file = "TC2_data.csv", sep = ",", row.names = FALSE, quote = FALSE)
write.table(c3, file = "TC3_data.csv", sep = ",", row.names = FALSE, quote = FALSE)
write.table(c4, file = "TC4_data.csv", sep = ",", row.names = FALSE, quote = FALSE)
write.table(c5, file = "TC5_data.csv", sep = ",", row.names = FALSE, quote = FALSE)
