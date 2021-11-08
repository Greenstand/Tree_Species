# Working with the species in Treetracker images

## Building the virtual herbarium

**Get an image set**:

 * Decide the country and area to be studied. Find the longitude and
   latitude box for the area (e.g., Google Maps: right click)
 * Query the database for all the trees in that area. E.g.,
   [`query_db_by_yx`](../bin/query_db_by_yx)` 43.008 -14.191 35.964
   1.365 > tree_list`
 * Download a subsample of the images. 
   E.g., `cd raw/` then [`get_images`](../bin/get_images)
   ` tree_list 0 50 200 sl_`
   
**View and collate the images**:

 * Using a good image viewer and file manipulator (e.g., `ACDSee` or
   `gthumb`), create subdirectories to collect the morphotypes, and
   shuffle the images into those new directories. You can create
   quick, dummy directory names for taxa in your reference set.
 * If you are sure of the identity of the images in a temporary taxon
   directory, and taxon directories already exist in
   `herbarium/taxa/`, move the images from your temporay directory
   into the main virtual herbarium directory.  
 * If there already more than 20 images in that directory, put the
   newly identified images in the training set `taxa/` directories,
   perhaps substituting any poorer images in virtual herbarium for
   any particularly good images in your new set.  
 * Add a `<planted_in>` country name in the main XML file if you are
   working on a new country.
   
**Create new taxa**:

Morphotypes that are new to the virtual herbarium will need to be
added.

 * Create a new section in the XML file, alphabetically by
   scientific name (you can copy the template from the end of the
   file.
 * Fill in the fields where possible, doing botanical sleuthing in
   libraries and on the internet.
 * Create a unique GS name for the taxon. If the the species name is
   known with a medium to high degree of confidence, then use the 4+4
   letters of genus and species.  If the taxon is a genus almost
   impossible to differentiate into species (from photos), use `0000`
   as the last 4 characters.  If the genus is known for the taxon, use
   `0001`, `0002` as the last four. If the genus is not know, use
   `INDE` (indet.) for the first four characters.
 * Create a new directory under `herbarium/taxa`.

**Validate and commit the XML**

```
bin/validate_xml
git pull
git commit -a -m "<commit message>"
git push
```

**Rebuild the online resources**:

```
bin/make_guide
bin/make_training
bin/sync_herb_up
```

## The training sets

_Numbers of images per species_. The more the better, but since these
will be hand-curated, we cannot demand too many. Let’s begin with a
target of 200 images per species. The number of images in the
herbarium should be limited to about 20 for each taxon; extras should
be placed in the training folders.

_Site sampling_. The Greenstand images are of a particular type, that
differ from most images used in machine learning of plants: they are
taken from above, of a plant 10-50 cm tall, which has no fruits or
flowers, and generally include some surrounding soil and/or
vegetation.  Our training set should include these surrounding
elements. The surrounding elements will differ with site: some dry
sites will have only soil in the images, some will have weedy
vegetation. The color of the soil will vary by site, as will the
general geometry and color of the weeds. We therefore should create a
training set with full variation in these background elements if we
are to train the machine learning algorithms to recognize a particular
species from any and every future site. Thus is is important to
subsample the various existing sites in the creation of the training
dataset.

