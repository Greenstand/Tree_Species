# Tree species data for Greenstand

This repo contains the core data file `tree_species.yaml`, the
_derived_ file `tree_species.json` (do not edit directly) from which
web pages, etc. can be derived), and the JSON schema file
`tree_species_schema.json`.

See the schema file for descriptions of the data fields.

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

