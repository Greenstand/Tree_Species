# Tree names

## Names

Humans instinctively classify the variation they see in the natural
world and apply names to those classes (e.g., “mango”). If the mental
model of a class is the same for the speaker and the listener,
effective communication is achieved.  Cultural naming systems, or
_folk taxonomies_, are the same as scientific taxonomies in this way,
but the latter also contains a process for explicitly connecting a
name to an organism or set of organisms. For each scientific name
there is a single _type specimen_ in a museum somewhere which is the
official bearer of the name and can be reviewed by
others. Additionally, taxonomists may also publish detailed accounts
of a group of organisms that share the same name: they create an
explicit _circumscription_ or taxonomic concept.

The situation is further complicated because many folk names refer to
groups of species, not just single species (the basic unit of
biological variation). Again, “mango” is applied to a variety of
species in Asian countries where there more than one; in the Americas,
where mangoes are not native, there is generally only the species
_Mangifera indica_. Similarly, “oak” may refer to tens or of species
in some countries.

Because the creators and users of Greenstand images come from many
cultures, and are generally not experienced at looking at the
variation of plants, we need to use scientific names to communicate
about the plants. We need also to refer to the particular _species_,
because there may be great ecological variation among species in a
genus; for example not all species in _Acacia_ (a genus), are
ecologically similar to _Acacia mangium_.

## Morphotypes

The process of finding the scientific species name for a plant in a
Greenstand photo can be difficult. While some species are
_distinctive_ and _common_ and a tropical botanist may know then
instantly, some will be morphologically close to other species, and
may be uncommon. The first step in naming the species is to **search**
through the images for different species.  Since planters often only
plant a few species at a time, searching requires subsampling the full
time range and spatial range of plantings in a geographical area.

The next step is to assign **morphotype codes** (or _morphospecies_
codes) to a putative species, based on the first image or first few
images.  We are using eight character codes. These codes can be
anything and need not refer to a suspected species, though if the
species is recognized the code may be derived from the first four
letters of the genus and species.  The value if these codes is that i)
if a species name is misapplied at first, and later changed, the
reference ID code stays unchanged (this happens a lot!), and ii) if a
morphotype is not recognized, it can still have a code; see, e.g.,
[`INDE0002`][1] in
the herbarium, “Indeterminate #2”, a fairly common species in Haiti
that we still do not have a scientific name for.

After creating ‘bins’ (folders for images) with morphotype codes, we
**match** subsequent images, shuffling them into a folder based on
their appearance. As the numbers build up and we have more opportunity
to view variation among individuals, we may need to _split_ a folder
in two, or _lump_ two folders into one. We can then create a _synonym_
table, keeping one code current or active, and linking other, now
unused, codes to it. For instance if we are looking at 1,000 captures
from Haiti, we might end up with 20 folders. Generally, a few species
will account for most of the individuals, with some only having a few
images, and some only having one.  Eventually we try to match
morphotypes across countries and continents. Some restoration species
are ubiquitous around the work, some are local.

## Identification

The final step is to try to **identify** the species to scientific
name. This requires internet searches, going to (real or virtual
libraries) and communication with experts in an area. If ‘side data’
about the local name of a plant as known by the planter could be
captured, this would help a lot.  Once we can link to a scientific
name, we can access and incorporate large amounts of external
information (distribution in different countries, ecological
characteristics, risk of invasiveness, etc.) - for those with a
database background, the scientific name becomes a _key_ permitting
links to global data tables.

## Data

As this data structure develops we are capturing it in a database (in
the form of a single [XML document][2]), and making the data available
as a dynamically generated **virtual herbarium**, with country-based
sub-herbaria (e.g., for [Haiti][3]).

This herbarium is now a resource for Greenstand volunteers using CVAT,
and giving the eight character **taxon codes** to the images they
review.

[1]: https://herbarium.treetracker.org/guide/INDE0002.html
[2]: https://github.com/Greenstand/Tree_Species/blob/master/tree_species.xml
[3]: https://herbarium.treetracker.org/guide/guide_ht.html
