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

Core files:

 * `tree_species.yaml`: base document
 * `tree_species.json`: _derived_ file (do not edit directly) from
   which web pages, etc. can be generated
 * `tree_species_schema.json`: JSON schema file. See this file for 
   descriptions of the data fields.

Before committing any changes, a new JSON file should be generated and
validated:

```
$ yaml2json < tree_species.yaml > tree_species.json
$ ajv -s tree_species_schema.json -d tree_species.json
```

The `validate_ts` shell script can be used for this.

## Resources

 * YAML: <https://yaml.org/>, <https://www.json2yaml.com/>
 * JSON Schema: <http://json-schema.org>, <https://ajv.js.org/>

