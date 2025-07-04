# [NPRG036 - Data Formats](https://jakub.klímek.com/nprg036.html)
## Homework 1 assignment
### What 
Choose a domain/topic for your homework. Create a conceptual model of that domain using UML Class Diagrams and a structured textual description (see e.g. this [data specification](https://ofn.gov.cz/%C3%BA%C5%99edn%C3%AD-desky/2021-07-20/)) of what is represented in the domain model. The consecutive homework parts will then be governed by this conceptual model. Quantitative requirements:
1. 5 to 8 classes
2. Each class 2 to 4 attributes, some with multiplicity `0..*`. Attributes inherited from a parent class in an inheritance hierarchy count as well, i.e. it is ok not to create attributes for a child class if parent class already has 2 to 4.
3. At least 4 associations. Include association end multiplicities `0..*`, `0..1`, `1..1`.
### How 
Use a tool that allows you to draw UML Class Diagrams and export them, ideally as SVG, PNG if SVG not possible. For example, [diagrams.net](https://www.diagrams.net/), [PlantUML](https://plantuml.com/) or [LucidChart](https://www.lucidchart.com/pages/). Beware that the free version of LucidChart does not support "copy as new" functionality. The homework is to be turned in via the study system by a group leader.

## Homework 2 assignment
### What 
Create data samples and queries using graph data models and query languages.
1. For representation of data in RDF, you will need to cover the conceptual model with classes and properties either from [existing vocabularies](https://lov.linkeddata.es/dataset/lov/), or by defining new ones using [RDF Schema](https://docs.google.com/presentation/d/1SwDgvaTJvUBY_5_EOG3V_ajJsIZadzFNNnJgYqa1Qcw/edit#slide=id.gba51ba2639_1_671). For the newly defined classes and properties use the `@prefix ex: <http://example.org/vocabulary/> .` prefix and attach a human readable label to each one of them. For new properties specify domain and range.
2. Represent the data in RDF using [RDF Turtle](https://www.w3.org/TR/turtle/) and validate. Each RDF resource will have a type.
3. Load the RDF data into a triplestore such as [Apache Jena Fuseki](https://jena.apache.org/documentation/fuseki2/) or [Openlink Virtuoso Open-Source](http://vos.openlinksw.com/owiki/wiki/VOS/VOSDownload) (or both). There is a [triplestore quick-start](https://docs.google.com/presentation/d/1Me_9PDk9HlSFSry2bC_XamVQpheNpJRsqI5PhhrQXhw) slide deck prepared. Openlink Virtuoso also allows you to browse the data in their Faceted search plugin.
4. Using SPARQL, develop a few meaningful executable queries on top of your data, including a comment explaining what each query does.
5. Represent the data in LPG using an executable Cypher script. The data should match the data in RDF as to quantity and meaning. It might differ in the usage of edge properties, which are not present in RDF.
6. Load the LPG data into [Neo4j](https://neo4j.com/download/).
7. Using Cypher, develop a few meaningful queries on top of your data, including a comment explaining what each query does.
### Quantitative requirements 
1. At least 3 instances of each class. In case of inheritance hierarchies, one of each children is enough.
2. Every attribute used at least once.
3. At least 3 instances of each association.
4. At least 4 non-trivial SPARQL queries.
5. At least 4 non-trivial Cypher queries.

## Homework 3 assignment
### What 
Create data schemas, data samples and queries using hierarchical data models and query languages including transformations of the hierarchical data to RDF.
1. For representation of your data in hierarchical data formats, first create one or more hierarchical diagrams corresponding to the conceptual one, showing how your data will be structured into hierarchies. Each hierarchical diagram will use directed associations, showing the nesting relation, and will have a root class with no incoming associations. It might be necessary to split the data into multiple hierarchies to avoid some redundancies and to cover every possibility your conceptual model offers.
2. For each hierarchical model create a corresponding XML Schema, enforcing proper datatypes.
3. Represent the data in XML files valid against the created XML Schemas. Utilize the `xml:lang` attribute to denote the natural language of text values.
4. Create a set of non-trivial XPath queries to query the XML data.
5. Create a non-trivial XSLT transformation producing HTML representation of a reasonable subset of your data.
6. Create XSLT transformations producing RDF Turtle representation of your data. This is called a "lifting transformation" - lifting the data to a semantically more precise representation. Validate the resulting file.
7. For each hierarchical model create a corresponding JSON Schema, enforcing proper datatypes.
8. Represent the data in JSON files valid against the created JSON Schemas.
9. Create a JSON-LD context mapping the JSON representations to RDF. This might require changing or amending the JSON representation and the JSON Schemas. Use the [JSON-LD playground](https://json-ld.org/playground/) to view the RDF N-Quads representation. Use the [Apache Jena](https://jena.apache.org/documentation/io/) `riot` command-line tool transform the result into RDF Turtle.
10. Create a set of non-trivial `jq` queries to query the JSON data.
