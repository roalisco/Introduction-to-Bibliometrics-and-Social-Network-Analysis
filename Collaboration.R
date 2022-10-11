########################################################################
# WORKSHOP: INTRODUCTION TO BIBLIOMETRICS & SNA
# A) ANALYSING SCIENTIFIC COLLABORATION NETWORKS
########################################################################

# Make sure to...
  # Ctrl+Return to run current line/selection in RStudio
  ## Save the current document (R script) under a new name for editing it: File > Edit > Save as
  ## Regularly save your document: Ctrl+S

#################################
# 1. Getting started
#################################
  
# 1.1 Initial checks
  #Check that your working directory is on your home drive (where the R folder was created when R was downloaded)
  getwd() # Check what directory you're in / it usually is "C:R" 

  # if this is not the case:
  setwd("C:/Users/s1529697/Documents/R") #set your working directory (on your home drive) 
                # Note how the bars are / and not \
  # Alternatively: Session > Set Working Directory > To Source File Location
  
  list.files() # Check what's in the working directory
  ls() # same
  # Make sure that the files we've sent via email are in your working directory (they are also available in the dropbox folder)
  # LIST FILES HERE

# 1.2 Install packages:
  install.packages("statnet") # statnet is a suite of packages for network analysis, including network, ergm and sna.
  install.packages("igraph")  # igraph is another major package for network analysis. We'll rely on these 2 packages to run most of the analyses.
  install.packages("intergraph") # package very useful to  transform network data objects between statnet and igraph
  install.packages("RColorBrewer") # useful package for setting up colour palettes
  install.packages("gridExtra") #  useful package to quickly format table output
  
  # package documentation
  help(package='statnet')
  help(package='igraph')
  help(package='intergraph')

# 1.3 Load libraries:
  library("igraph") # let's start with igraph first
  # library(statnet)
  # library(intergraph)
  
#################################
# 2. READ THE DATA IN
#################################
# 2.1 Read Network/Pajek file into data structure
  institution.net <- read.graph("institution_net.net", format="pajek") # format for reading .net extensions
  
  institution.net<- read.graph("C:/Users/s1529697/Documents/R/institution_net.net", format="pajek")
  
  
  
# 2.2 Extract Vertices from graph
  V(institution.net)
  
# 2.3 Extract Edges from graph
  E(institution.net)
  
###################################
# 3. Calculate Network Descriptives
###################################
  
  # Some functions have the same names in statnet and igraph, so we detach igraph to use statnet functions
  detach(package:igraph)
  library(statnet)
  
# 3.1 Describing the network data:
  is.directed(institution.net)  # False
  is.weighted(institution.net)  # True
  # institution_net is an undirected but weighted network
  
# 3.2 Exploring network cohesion
  # basic exploration of networks
  network.dyadcount(institution.net) # How many dyads? (n*n-1)
  network.edgecount(institution.net) # How many edges?
  network.size(institution.net) # How large is the network?
  
  # The statnet package can handle network data in many forms: network objects, adjacency matrix, lists of matrices, etc.
  
# 3.3 Density, reciprocity & transitiviy
  gden(institution.net) # Density
  grecip(institution.net) # Dyadic reciprocity / Relevant for directed networks, e.g.: co-citations (not this case, but useful to know)
  grecip(institution.net, measure="edgewise") # Edgewise reciprocity / Idem: directed networks
  gtrans(institution.net) # Transitivity / More interesting...(?)
  
#######################################
# 4. Node Centrality and Centralization
#######################################
# 4.1 Degree centrality
  # Centrality functions produce a vector of node centrality scores
  degree <- degree(institution.net) # Default: total degree
  degree_norm <- degree(institution.net, rescale = TRUE) # normalised centrality scores between 0 and 1
  summary(degree(institution.net))
  indeg <- degree(institution.net, cmode="indegree") # Indegree
  outdeg <- degree(institution.net, cmode="outdegree") # Outdegree
                                                    # Not relevant for undirected networks but, again, useful to know.
  
  # Once the scores are calculated, we can use standard R commands to visualise the results:
  # E.g.: Histograms of the degree distribution
  par(mar = c(1,0,1,0), mfrow=c(2,1)) # Set up a 2x1 display
  hist(degree, xlab="degree", main="Degree Centrality Scores Distribution", prob=TRUE)
  par(mfrow=c(1,1)) # Restore display
  
  
# 4.2 Betweenness centrality
  bet <- betweenness(institution.net) #  betweenness centrality
  bet
  summary(bet)
  
# 4.3 Closeness centrality
  clo <- closeness(institution.net) # closeness centrality
  
# 4.4 Calculating network centralization from node centrality
  # From centrality to centralization
  centralization(institution.net, degree)
  centralization(institution.net, closeness, cmode = "suminvdir")
  centralization(institution.net, betweenness)
  
# 4.5 Presenting centrality and centraliization scores in a table
  Institution_centrality.df <- data.frame(
    degree = degree(institution.net),
    closeness = closeness(institution.net, cmode = "suminvdir"),
    betweenness = betweenness(institution.net)
  )
  row.names(Institution_centrality.df) <- institution.net %v% "vertex.names" # FIJARSE ACA QUE SEAN LOS NODE IDS
  Institution_centrality.df.sorted <- Institution_centrality.df[order(-Institution_centrality.df$degree),] # sorted by highest degree scores
  cd <- centralization(institution.net, degree)
  cc <- centralization(institution.net, closeness, cmode = "suminvdir")
  cb <- centralization(institution.net, betweenness)
  institution_centrality.df.sorted <- rbind(institution_centrality.df.sorted, c(cd,cc,cb))
  row.names(institution_centrality.df.sorted)[network.size(institution.net)+1] <- "Centralization"
  institution_centrality.df.sorted <- round(institution_centrality.df.sorted, digits = 2)
  institution_centrality.df.sorted
  
  library(gridExtra)
  grid.table(institution_centrality.df.sorted) # a bit nicer
  
  png(filename = "institution_centrality_table.png") # save the table as an image
  grid.table(institution_centrality.df.sorted)
  dev.off()
  
# 4.6 Adding centrality scores as node attributes
  institution.net %v% "degree" <- degree$XXXX # shorthand, same outcome
  institution.net %v% "betweenness" <- bet$XXXX
  institution.net %v% "closeness" <- clo$XXXX
 
  
#############################################
# 5. Community (cohesive subgroups) detection
#############################################
  
#5.1 Exploring the data
  is.connected(institution.net) # Is the network strongly connected?
  is.connected(institution.net, connected="weak") # How about weakly connected?
  geodist(institution.net) # Get information on geodesics
  reachability(institution.net) # Return the reachability matrix
  
# 5.2 Several ways to detect relatively cohesive groups
  clique.census(institution.net) # Maximal clique census
  clique.census(institution.net, tabulate.by.vertex=FALSE, enumerate=FALSE) # Find maximal cliques
  kcores(institution.net) # k-cores (by degree)
  
  
# 5.3 Show the nesting of cores
  kc<-kcores(institution.net, cmode="indegree") # CHANGE
  gplot(institution.net, displaylabels = TRUE, vertex.col=rainbow(max(kc)+1)[kc+1])
  
  #Showing members of the 2-core only
  gplot(institution.net[kc>1,kc>1], displaylabels = TRUE, vertex.col=rainbow(max(kc)+1)[kc[kc>1]+1])
  
  # Component information can be obtained in various ways
  components(institution.net) # Strong component count
  components(institution.net, connected="weak") # Weak component count
  cd <- component.dist(institution.net, connected="weak") # Get weak components
  cd
  
  #Component sizes
  plot(1:length(cd$cdist),cd$cdist,xlab="Size",ylab="Frequency")
  
  #Who's in the largest component?
  cl <- component.largest(institution.net, connected="weak")
  cl
  
  # Plot the largest weak component
  gplot(institution.net[cl,cl], boxed.lab=FALSE, label=network.vertex.names(institution.net)[cl])
  
  # Cutpoints = nodes that, if dropped, would increase the number of components
  cutpoints(institution.net) # find cutpoints
  
  # Showing cohesion information can aid visualization. Here, show critical positions
  institution_cp <- cutpoints(institution.net, mode="graph", return.indicator=TRUE)
  gplot(institution.net, displaylabels = TRUE, gmode="graph", vertex.col=institution_cp+2)
  
###########################
# 6. Network Visualization
###########################
  
###########################
# 7. Export
###########################
  
  
# EXPORT NET AND ATTRIBUTES INCLUDING CENTRALITY MEASURES
  
# Extract main component
  giant.component.extract(x, directed = TRUE, bipartite.proj = FALSE,
                          num.proj = 1)
  
