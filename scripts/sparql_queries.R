# ---------------------------------------------------------------
# SPARQL Queries for Dystonia RDF Dataset
# Author: Carlos Ureña Mateo
# Description: Executes 5 SPARQL queries against Blazegraph endpoint
# ---------------------------------------------------------------

library(SPARQL)

endpoint <- "http://dayhoff.inf.um.es:3050/blazegraph/namespace/dystonia/sparql"

# ---------------------------------------------------------------
# Query 1: Genes with splicing-related alterations
# ---------------------------------------------------------------
query1 <- "
PREFIX dist_r: <https://um.es/data/dystonia/>
PREFIX dist_o: <https://dystonia_ontology.um.es/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT DISTINCT ?geneLabel ?chromosome ?alteration ?syndromeLabel
WHERE {
  ?gene a dist_o:Gene ;
        rdfs:label ?geneLabel ;
        dist_o:hasAlteration ?alteration ;
        dist_o:locatedOnChromosome ?chromosome ;
        dist_o:isAssociatedWith ?syndrome .
  ?syndrome rdfs:label ?syndromeLabel .
  FILTER CONTAINS(LCASE(STR(?alteration)), \"splicing\")
}
ORDER BY ?geneLabel
"
cat("Query 1: Genes with splicing-related alterations\n")
result1 <- SPARQL(endpoint, query1)
View(result1$results)

# ---------------------------------------------------------------
# Query 2: Clinical syndromes associated with the gene ANO3
# ---------------------------------------------------------------
query2 <- "
PREFIX dist_r: <https://um.es/data/dystonia/>
PREFIX dist_o: <https://dystonia_ontology.um.es/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>

SELECT DISTINCT ?geneLabel ?chromosome ?syndromeLabel ?mondoID
WHERE {
  dist_r:ANO3 rdfs:label ?geneLabel ;
              dist_o:locatedOnChromosome ?chromosome ;
              dist_o:isAssociatedWith ?syndrome .
  ?syndrome rdfs:label ?syndromeLabel ;
            owl:sameAs ?mondoID .
}
"
cat("Query 2: Syndromes associated with ANO3\n")
result2 <- SPARQL(endpoint, query2)
View(result2$results)

# ---------------------------------------------------------------
# Query 3: Genes encoding membrane transport proteins
# ---------------------------------------------------------------
query3 <- "
PREFIX dist_r: <https://um.es/data/dystonia/>
PREFIX dist_o: <https://dystonia_ontology.um.es/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX ro: <http://purl.obolibrary.org/obo/RO_>

SELECT DISTINCT ?geneLabel ?chromosome ?alteration ?proteinLabel
WHERE {
  ?gene a dist_o:Gene ;
        rdfs:label ?geneLabel ;
        dist_o:locatedOnChromosome ?chromosome ;
        dist_o:hasAlteration ?alteration ;
        ro:0002205 ?protein .
  ?protein rdfs:label ?proteinLabel .
  FILTER CONTAINS(LCASE(STR(?proteinLabel)), \"transport\")
}
ORDER BY ?geneLabel
"
cat("Query 3: Genes encoding transport proteins\n")
result3 <- SPARQL(endpoint, query3)
View(result3$results)

# ---------------------------------------------------------------
# Query 4: Genes and their associated UniProt proteins
# ---------------------------------------------------------------
query4 <- "
PREFIX dist_o: <https://dystonia_ontology.um.es/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX ro: <http://purl.obolibrary.org/obo/RO_>

SELECT DISTINCT ?geneLabel ?uniprotID ?proteinLabel
WHERE {
  ?gene a dist_o:Gene ;
        rdfs:label ?geneLabel ;
        ro:0002205 ?uniprotID .
  ?uniprotID rdfs:label ?proteinLabel .
}
ORDER BY ?geneLabel
"
cat("Query 4: Genes and associated UniProt proteins\n")
result4 <- SPARQL(endpoint, query4)
View(result4$results)

# ---------------------------------------------------------------
# Query 5: Genes with both mutation and syndrome annotation
# ---------------------------------------------------------------
query5 <- "
PREFIX dist_o: <https://dystonia_ontology.um.es/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT DISTINCT ?geneLabel ?alteration ?syndromeLabel
WHERE {
  ?gene a dist_o:Gene ;
        rdfs:label ?geneLabel ;
        dist_o:hasAlteration ?alteration ;
        dist_o:isAssociatedWith ?syndrome .
  ?syndrome rdfs:label ?syndromeLabel .
}
ORDER BY ?geneLabel
"
cat("Query 5: Genes with mutation and syndrome annotation\n")
result5 <- SPARQL(endpoint, query5)
View(result5$results)

