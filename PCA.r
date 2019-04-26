install.packages("factoextra")
if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/factoextra")
library(factoextra)

setwd("C:/Users/nameofthedatafolder") #set the path where the data are

ES <- read.csv("SoilComp_PCA.csv", header=TRUE) #read the file

#In the following 5 lines, data are isolated depending on location
ESM <- ES[1:170, c(2,5:7,9,12,15:18)]
PAZ <- ES[2:33, c(2,5:7,9,12,17:18)]
SGR <- ES[35:75, c(2,5:7,9,12,17:18)]
LCA <- ES[77:121, c(2,5:7,9,12,13,15:18)]
NAU <- ES[123:170, c(2,5:7,9,12,13,15:17)]

#In the following 5 lines, the PCA is carried out for the 5 new variables, omitting the lines where there are no data available
pca.ESM <- prcomp(na.omit(ESM), scale = TRUE)
pca.PAZ <- prcomp(na.omit(PAZ), scale = TRUE)
pca.SGR <- prcomp(na.omit(SGR), scale = TRUE)
pca.LCA <- prcomp(na.omit(LCA), scale = TRUE)
pca.NAU <- prcomp(na.omit(NAU), scale = TRUE)

#The results of the PCA analysis are saved into tiff files
tiff("PCA_ES.tif", width = 1000, height = 1000, units = "px", res = 300)
fviz_eig(pca.ESM)
dev.off()
tiff("PCA_AZ.tif", width = 1000, height = 1000, units = "px", res = 300)
fviz_eig(pca.PAZ)
dev.off()
tiff("PCA_SG.tif", width = 1000, height = 1000, units = "px", res = 300)
fviz_eig(pca.SGR)
dev.off()
tiff("PCA_LC.tif", width = 1000, height = 1000, units = "px", res = 300)
fviz_eig(pca.LCA)
dev.off()
tiff("PCA_NA.tif", width = 1000, height = 1000, units = "px", res = 300)
fviz_eig(pca.NAU)
dev.off()

#Calculate the PCA loadings of each variables and then computes the contribution of each variable on the PCAs, within each subdataset
var_coord_func <- function(loadings, comp.sdev){
  loadings*comp.sdev
}

# Compute Coordinates ES
#::::::::::::::::::::::::::::::::::::::::
loadingsESM <- pca.ESM$rotation
sdevESM <- pca.ESM$sdev
var.coordESM <- t(apply(loadingsESM, 1, var_coord_func, sdevESM)) 
head(var.coordESM[, 1:4])

# Compute Cos2 ES
#::::::::::::::::::::::::::::::::::::::::
var.cos2ESM <- var.coordESM^2
head(var.cos2ESM[, 1:4])

# Compute contributions ES
#::::::::::::::::::::::::::::::::::::::::
comp.cos2ESM <- apply(var.cos2ESM, 2, sum)
contribESM <- function(var.cos2ESM, comp.cos2ESM){var.cos2ESM*100/comp.cos2ESM}
var.contribESM <- t(apply(var.cos2ESM,1, contribESM, comp.cos2ESM))
head(var.contribESM[, 1:4])

# Compute Coordinates PAZ
#::::::::::::::::::::::::::::::::::::::::
loadingsPAZ <- pca.PAZ$rotation
sdevPAZ <- pca.PAZ$sdev
var.coordPAZ <- t(apply(loadingsPAZ, 1, var_coord_func, sdevPAZ)) 
head(var.coordPAZ[, 1:4])

# Compute Cos2 PAZ
#::::::::::::::::::::::::::::::::::::::::
var.cos2PAZ <- var.coordPAZ^2
head(var.cos2PAZ[, 1:4])

# Compute contributions PAZ
#::::::::::::::::::::::::::::::::::::::::
comp.cos2PAZ <- apply(var.cos2PAZ, 2, sum)
contribPAZ <- function(var.cos2PAZ, comp.cos2PAZ){var.cos2PAZ*100/comp.cos2PAZ}
var.contribPAZ <- t(apply(var.cos2PAZ,1, contribPAZ, comp.cos2PAZ))
head(var.contribPAZ[, 1:4])

# Compute Coordinates SGR
#::::::::::::::::::::::::::::::::::::::::
loadingsSGR <- pca.SGR$rotation
sdevSGR <- pca.SGR$sdev
var.coordSGR <- t(apply(loadingsSGR, 1, var_coord_func, sdevSGR)) 
head(var.coordSGR[, 1:4])

# Compute Cos2 SGR
#::::::::::::::::::::::::::::::::::::::::
var.cos2SGR <- var.coordSGR^2
head(var.cos2SGR[, 1:4])

# Compute contributions SGR
#::::::::::::::::::::::::::::::::::::::::
comp.cos2SGR <- apply(var.cos2SGR, 2, sum)
contribSGR <- function(var.cos2SGR, comp.cos2SGR){var.cos2SGR*100/comp.cos2SGR}
var.contribSGR <- t(apply(var.cos2SGR,1, contribSGR, comp.cos2SGR))
head(var.contribSGR[, 1:4])

# Compute Coordinates LCA
#::::::::::::::::::::::::::::::::::::::::
loadingsLCA <- pca.LCA$rotation
sdevLCA <- pca.LCA$sdev
var.coordLCA <- t(apply(loadingsLCA, 1, var_coord_func, sdevLCA)) 
head(var.coordLCA[, 1:4])

# Compute Cos2 LCA
#::::::::::::::::::::::::::::::::::::::::
var.cos2LCA <- var.coordLCA^2
head(var.cos2LCA[, 1:4])

# Compute contributions LCA
#::::::::::::::::::::::::::::::::::::::::
comp.cos2LCA <- apply(var.cos2LCA, 2, sum)
contribLCA <- function(var.cos2LCA, comp.cos2LCA){var.cos2LCA*100/comp.cos2LCA}
var.contribLCA <- t(apply(var.cos2LCA,1, contribLCA, comp.cos2LCA))
head(var.contribLCA[, 1:4])

# Compute Coordinates NAU
#::::::::::::::::::::::::::::::::::::::::
loadingsNAU <- pca.NAU$rotation
sdevNAU <- pca.NAU$sdev
var.coordNAU <- t(apply(loadingsNAU, 1, var_coord_func, sdevNAU)) 
head(var.coordNAU[, 1:4])

# Compute Cos2 NAU
#::::::::::::::::::::::::::::::::::::::::
var.cos2NAU <- var.coordNAU^2
head(var.cos2NAU[, 1:4])

# Compute contributions NAU
#::::::::::::::::::::::::::::::::::::::::
comp.cos2NAU <- apply(var.cos2NAU, 2, sum)
contribNAU <- function(var.cos2NAU, comp.cos2NAU){var.cos2NAU*100/comp.cos2NAU}
var.contribNAU <- t(apply(var.cos2NAU,1, contribNAU, comp.cos2NAU))
head(var.contribNAU[, 1:4])

#Prints the contribution results
tiff("contribES.tif", width = 1200, height = 1200, units = "px", res = 300)
fviz_pca_var(pca.ESM,
             col.var = "contrib", # Color by contributions to the PC
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
)
dev.off()
tiff("contribPA.tif", width = 1200, height = 1200, units = "px", res = 300)
fviz_pca_var(pca.PAZ,
             col.var = "contrib", # Color by contributions to the PC
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
)
dev.off()
tiff("contribSG.tif", width = 1200, height = 1200, units = "px", res = 300)
fviz_pca_var(pca.SGR,
             col.var = "contrib", # Color by contributions to the PC
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
)
dev.off()
tiff("contribLC.tif", width = 1200, height = 1200, units = "px", res = 300)
fviz_pca_var(pca.LCA,
             col.var = "contrib", # Color by contributions to the PC
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
)
dev.off()
tiff("contribNA.tif", width = 1200, height = 1200, units = "px", res = 300)
fviz_pca_var(pca.NAU,
             col.var = "contrib", # Color by contributions to the PC
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
)
dev.off()