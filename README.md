# Tree species data for Greenstand

This Greenstand subproject will: 

 1. Review incoming images to find occurrences of new taxa (“species”)
 2. Generate a ‘virtual herbarium’: collections of images of each taxon
 3. Research the taxa: native status, restoration potential, taxonomic issues
 4. Mint identifiers for each taxon
 5. Summarize taxon data in a JSON file
 6. Work with the machine learning team to create training image sets, and 
    then review the ML-generated identifications
 7. Provide documentation to enable other Greenstand members to tag images
    and build training sets
    
More about the process can be read [here](doc/process.md).

## Data

**NOTE** (2021-02-22): I switched to XML as the base format, with JSON
  (and YAML) derived. Using `nxml-mode` in Emacs, XML editing
  validates on the fly (from the RNC file), which is just a whole lot
  easier.

Core files:

 * `tree_species.xml`: base document
 * `tree_species.rnc`: schema
 * `tree_species.json`: _derived_ file (do not edit directly) from
   which web pages, etc. can be generated

Before committing any changes, a new JSON file should be generated and
validated:

```
$ xml2json < tree_species.xml > tree_species.json
```

## Resources

 * `nodejs-xml2json`: <https://github.com/buglabs/node-xml2json>
 * YAML: <https://yaml.org/>, <https://www.json2yaml.com/>
 * JSON Schema: <http://json-schema.org>, <https://ajv.js.org/>
   (install with `npm install -g ajv`)

