# Semantic Analysis of Genes Associated with Muscular Dystonia

## Project Overview

This bioinformatics project demonstrates the application of **Semantic Web technologies** (RDF, OWL, SPARQL) to model, integrate, and query structured knowledge about **genes implicated in muscular dystonia**. The project focuses on the construction of a **FAIR-compliant knowledge graph** (Findable, Accessible, Interoperable, Reusable) that links genomic entities (genes, mutations, proteins) with clinical phenotypes (dystonia syndromes). This approach enables complex biomedical queries and supports integrative data analysis across heterogeneous biological resources.

**Key skills showcased**:  
Biomedical data integration · Ontology design (OWL) · RDF data modeling · SPARQL querying · Interoperability with public biomedical databases · Reproducible research.

---

## Biological Context

Dystonia comprises a heterogeneous group of **movement disorders characterized by involuntary and sustained muscle contractions**, often resulting in abnormal postures or repetitive movements.

This project focuses on **eight genes with well-established pathogenic roles in dystonia-related syndromes**, including:

- **TOR1A** → DYT1 early-onset generalized dystonia  
- **ANO3** → Craniocervical dystonia 
- **ATP1A3** → Rapid-onset dystonia-parkinsonism  
- **SGCE** → Myoclonus-dystonia  
- **GCH1** → Dopa-responsive dystonia  
- **PANK2** → Pantothenate kinase–associated neurodegeneration  
- **PRRT2** → Paroxysmal kinesigenic dyskinesia  
- **THAP1** → Early-onset dystonia type 6 

These genes and their associated syndromes are modeled as interconnected semantic entities within the knowledge graph.

---

## Methodology & Technologies

### 1. Data Curation and Integration

- **Literature mining** to identify dystonia-associated genes and pathogenic variants.
- **Annotation enrichment** using authoritative biomedical databases:
  - NCBI
  - UniProt  
  - OMIM  
  - MONDO Disease Ontology
- **Phenotype standardization** through MONDO identifiers to ensure interoperability.

---

### 2. Ontology Development

- Design of a **custom OWL ontology** defining core classes (e.g. `Gene`, `Syndrome`) and object properties.
- Semantic alignment with established biomedical ontologies:
  - Sequence Ontology (SO)
  - Disease Ontology (DO)
  - Semanticscience Integrated Ontology (SIO)
  - Relations Ontology (RO)
- Adoption of **Linked Data principles**, including dereferenceable URIs.

---

### 3. Knowledge Graph Construction

- RDF data modeling and serialization in **Turtle (.ttl)** format.
- Instantiation of entities representing:
  - Genes
  - Dystonia syndromes
  - Cross-references to external databases
- Explicit linkage between genetic and clinical entities.

---

### 4. Validation and Querying

- RDF syntax validation using the **W3C RDF Validator**.
- Conversion to **RDF/XML** to ensure compatibility with triple stores.
- Deployment of a **SPARQL endpoint using Blazegraph**.
- Programmatic querying and data access via **R (SPARQL package)**.

---

## Repository Structure

