# Tree species data for Greenstand

This Greenstand subproject will: 

 1. Review incoming images to find occurrences of new taxa (“species”)
 2. Generate a ‘virtual herbarium’: collections of images of each taxon
 3. Research the taxa: native status, restoration potential, taxonomic issues
 4. Mint Greenstand eight-character identifiers for each taxon
 5. Summarize taxon data in the XML file `tree_species.xml`
 6. Work with the machine learning team to create training image sets, and 
    then review the ML-generated identifications
 7. Provide [documentation](doc/) to enable other Greenstand members
    to tag images and build training sets
    
More about the process can be read [here](doc/process.md).

## Data

Core files:

 * `tree_species.xml`: base document
 * `tree_species.rnc`: schema (use `nxml-mode` in Emacs which will
   validate `tree_species.xml` on the fly from this file)
 * `training/training.psv` : list of taxa and image names for training


