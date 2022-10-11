# Introduction-to-Bibliometrics-and-Social-Network-Analysis
Introduction to the analysis of co-autorship networks in R.


Relational data from bibliometric sources: co-authorship

In bibliometrics and information science, co-authorship in papers are widely considered a suitable proxy for measuring scientific collaboration (Barnett et al., 1988; Melin and Persson, 1996). By this account, scientific collaboration between scientists takes place when two or more researchers have co-authored a research document (usually a scientific paper published in a recognised journal). This will allow analysing research collaborations as a co-authorship network where nodes represent the authors and the edges co-authorships in one or more papers.
 
When examinig scientific publications there are a handful of elements we can take to build a case-by-affiliation matrix from which we can extract a case-by-case matrix or, in this case, a co-authorship matrix (depict the case-by-affiliation matrix). Depending which ones we chose, the analyses we’ll refer to different levels:
- Individual or author level: authors listed in the publications.
- Meso or institutional level: the institutional affiliations listed in the publications
- Macro or country level: the country affiliations listed in the publications

The level of aggregation will of course vary depending on the unit of analysis we decide to take. 
This also has implications on our capacity to collect attribute data on the nodes that form our network from the bibliometric source itself. As we move from the macro to the micro, this capacity, is to some large extend, limited. For instance: if we decide to use institutions as our unit of analysis (because we are interested in analysing pattern of collaboration between scientific institutions), we can collect information about the country or geographical region of each institution. This information rarely varies across time.However, if we decide to use authors as out unit of analysis, the task becomes somehow more complicated: In a great number of cases: authors have more than one affiliation listed in a single publication  multiple affiliations. Which one should we choose? Authors’ affiliation are not a static attribute: researchers have career paths in which the change institutions and even countries. Basic network analysis requires node attributes to be static. 

Type of data
Co-authorship takes place when at least two researchers co-author a paper. When we fill our o-authorship matrix, we take into account the number of papers these two researchers have co-authored in total. Because of these co-authorship data is weighted (example of edgelist with a weigh value).  this also gave us the strength of the collaboration tie. Besides being weighted data, co-authorship data is undirected because co-authorship is a co-occurrence phenomenon. It happens at the same time for all authors sharing that publication. 

Counting methods:
However, we can decide what approach we’ll use to construct such network. This is determined by the counting method, which distinguishes between two options:
- Full or whole count: it assigns the same weight to all the authors listed in the publication.
- Fractional count: the basic idea is that a co-authored publication is assigned fractionally to each of the co- authors, with the overall weight of the publication being equal to one. Hence, in the case of fractional counting, each publication has the same overall weight. 
- First author count: but different norms of author other across disciplines

There is a large debate about which method should be applied. Traditionally the full method is preferred due to the difficulties of arguing to which extent one can argue that each author listed in that publication contributed in equal condition. However, when using this method and analysing method we need to acknowledge its “multiplication” effect. 

Research on collaboration networks in science:
In 1958, Smith was the first to propose this proxy measure by establishing scientific literature as the vehicle of collaboration between researchers.  this forms the bibliometric nature of collaboration studies. Using co-authorship to measure research collaboration has been a subject of significant interest since the 1960s (Beaver, 2001; de Solla Price and Beaver, 1966; Glänzel and Schubert, 2005; Melin and Persson, 1996).  Since the work of de Solla Price (1966) which provided empirical evidence on the increase of multi-authorship in science, much of the research on co-authorship has focused on studying the benefits of scientific collaboration: its relation to productivity and impact for instance. 
However, understanding research collaborations from the lens of social networks is a fairly young research area. Co-authorship studies garnered renewed interest after Newman (2001a, b, c) used SNA methods to investigate the macro and micro characteristics of large co-authorship networks. For Newman, a co-authorship network is as much a network depicting academic society as it is a network depicting the structure of our knowledge. And, for this reason, Newman considered these networks have received far less attention than have citation networks. 

Newman was interested in examining the social structures of scientific collaboration by means of co-authorship networks. By analysing patterns of collaborative relations, he wanted to reveal the mechanisms that shape the scientific community; in particular: how fragmented or cohesive the knowledge community is or who are the best connected authors in that network (power dynamics) (Newman, 2004a) Whereas macro level properties look at the overall network, micro level properties reveal the popular gatekeepers or prestigious authors in the network. Newman’s studies (2001, 2004a, 2004b) opened the floodgates for other studies in co-authorship networks and provided a template of key measures to identify patterns of collaboration, centrality and cluster formation (White, 2011). Whereas, co-authorship networks attempt to investigate the collaborative patterns of researchers, citation, co-citation, bibliographic coupling and co-word networks are commonly used to identify research fronts (Boyack and Klavans, 2010; Zitt and Bassecoulard, 1994)

Giant component: 
A fair amount of studies, including Newman’s seminal studies (2001, 2004a, 2004b), reported the size of the giant component (for large networks) (Otte and Rousseau, 2002; Börner et al., 2005; Fatt et al., 2010). The size of this component matters, as it could reveal how cohesive or fragmented a network. Most scientific networks exhibit this giant component which is defined as “a large group of individuals who are all connected to one another by paths of intermediate acquaintances” (Newman, 2001: 407)  “Small world” characteristics. In several fields these components comprise roughly 80 to 90 percent of scientists under study.

Centrality and power 
An important feature of co-author network analysis is to identify key authors in the network who are well positioned, popular and best connected (Fatt et al., 2010; Racherla and Hu, 2010; Ye et al., 2013; Liu et al., 2005). Otte and Rousseau (2002) pointed out, for instance, that SNA is not a formal theory in sociology but a “strategy” for investigating social structures. Using centrality measures, which included degree, closeness and betweenness, the authors located the most central researchers in the field of SNA. Wagner et al (2005) have also found that co-authorship patterns are shaped by issues related to visibility, reputation, complementary and/or access to resources rather than factors referring to historical/colonial ties or core-periphery attachment. 

Detection of scholarly communities: 

Another area of research on co-authorship network is the detection of scholarly communities. These communities are form around similar research interests and play an important role of knowledge creation (Lambiotte and Panzarasa, 2009). Research communities are detected through cluster analysis which make use of sophisticated algorithms that create network partitions which allow analysing the cognitive and social structures of scientific networks (Newman, 2004a; Perianes-Rodriguez et al., 2010; Gonzalez-Alcaide et al., 2012; Chinchilla-Rodriguez et al., 2012a; Kromer et al., 2012; Rodriguez and Pepe, 2008)
	
Internationalisation 

Research have also looked at the international composition of co-authorship networks (Chinchilla-Rodríguez et al., 2012b, 2010; Olmeda-Gomez et al., 2008); Aleixandre-Benavent et al., 2012). Wagner and Leydesdorff (2005) showed that the number of publications involving authors from more than one country has been increasingly exponentially over the years and they argued this growth could be ascribed to a self-organizing phenomenon based on preferential attachment within network of co-authors. 

Network dynamics

Studies in co-authorship networks have been mostly on “static” data. There is a need to analyse dynamic data across a time-series in order to get a “longitudinal” perspective. Whereas Newman (2001a, b, c) carried out analyses of static networks, Barabási et al. (2002) conducted the analyses on evolving networks in mathematics and neuroscience journals from 1991 to 1998. The networks were found to be scale-free  and governed by preferential attachment . While the average degree increased in time, the node separation decreased . They also found that the relative size of the “giant component” increases over time. 

Pros and cons of co-authorship studies
Co-authorships are largely considered the best proxy to measure collaboration in science (Barnett et al., 1988; Melin and Persson, 1996). The main question that arises is to what extent collaboration is fully reflected by corresponding co-authorship. Some scholars (Laudel 2002; Sonnenwald, 2007) have noted that: 1) not all authorships are the result of collaborative actions, and 2) co-authorship is not the only form of collaboration in research. In this case, interviews, observations or standard surveys are thought to be more appropriate for capturing the diversity of collaboration. 

Advocates of bibliometric, however, often state that in contrast to these traditional methods, bibliometric methods provide an efficient, convenient and non-reactive tool for studying collaboration (Subramanyam, 1983; Newman, 2004b). In addition, and with regards to data access, co-authorship networks are the largest publically available form of social networks (Kumar, 2015). Because at the end of the day co-authorships are nothing more than a proxy to study collaboration, perhaps it is important to acknowledge the conceptual distinction between collaboration and co-authorship (Katz and Martin, 1997).

Techniques
Network centrality measures:
From a SNA perspective, power is relational. This means viewing power as resulting not necessarily from the individual attributes or resources held by an actor, but from his or her interactions between actors. Power is then the result of favoured positions in the patterns of ties. Attributes, in fact, are not ignored but they are considered in the context of relationships. 

Measures of centrality are used to capture power and the distribution of power across actors.
- Degree centrality (Freeman degree): 
Actors are central if they have many direct ties (many neighbours). This could be interpreted as:
  Direct access to more resources.
	Lower dependency on single actors / alternative ways to satisfy their needs.
	Direct influence on many other actors
	Act as third-parties to control resources between (groups of) actors. 
  In, directed networks, we distinguish between in and out-degree. 

- Weighted degree centrality (Bonacich)
In contrast to Freeman’s traditional degree centrality, Bonacich wanted to establish a distinction between what it means to be central and what it means to be  powerful in a network. To do so, introduced a conceptual distinction: the more connections the actors in your neighbourhood have, the more central you are. The fewer the connections the actors in your neighbourhood, the more powerful you are. 
As a result of the formula and the attenuation factor given (beta), the output scores can be both positive and negative. Interpretively, the Bonacich power measure corresponds to the notion that the power of a vertex is recursively defined by the sum of the power of its alters. The nature of the recursion involved is then controlled by the power exponent: positive values imply that vertices become more powerful as their alters become more powerful (as occurs in cooperative relations), while negative values imply that vertices become more powerful only as their alters become weaker (as occurs in competitive or antagonistic relations). 
Attenuation factor (or beta factor): between ‐1 and 1.
β > 0: being connected to neighbours with more connections makes one powerful (extension of the degree centrality idea).
β < 0: being connected to neighbours with few connections makes one powerful (Bonacich idea).

Closeness centrality
An actor is central if she is very close to all the other network nodes. This measure assumes that the influence on an actor is higher, the shorter the distance to her is. The distance between two nodes is commonly measured by the geodesic distance, which is the number of relations in the shortest possible path from one actor to another. This measure is only possible for connected networks (only one component).

Betweenness centrality (Freeman)
An actor is central if they play the role of broker (compulsory intermediary or bridge) between otherwise separated network members. To calculate this, it takes into account the number of geodesic paths between nodes.
Let two nodes j and k of a network. The capacity of a third node i to be an intermediary between j and k can be defined by the probability g_jik/g_jk  with
gjk = number of geodesic paths (shortest paths) connecting j with k
gjik = number of ge
