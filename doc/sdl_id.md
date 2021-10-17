# Learning seedling identification

One of the most important elements in a Greenstand seedling photo is
the _species of plant_.  Different species have different
characteristics and are of different values for restoration
programs. Labelling an image with its plant species adds information
to the capture and builds training sets of images for machine
learning. Eventually it is our hope that automated image analysis will
be able to tag a photo with its species, but there is a lot of work to be done before then.

However recognizing species in photos is not easy, and requires
learning. Like during learning a language, you will be aware of very
little at first that might help you separate entities: you’ll see
green, leaves and stems. But over time you will learn to recognize
increasingly subtle differences, and will come to recognize species
you have seen before. This document is intented to guide you
efficiently through the learning process.

## Characters

A photo is a 2-dimensional representation of an organism in the
field. That organism has _characters_ that differ from organisms of
other species. In general, more closely related species have more
similar sets of characters.  Characters can be used to create
identifucation _keys_: e.g., “Question 1: if hairs on leaf underside
present, got to Question 2, if not, go to Question 3”, until a unique
combination of characters indicates that the organism is the
corresponding species. Many of the characters necessary for
discriminating species will not be visible in photographs, but we can
still search for some obvious characters in the image and that will
limit the set of species that it could be.  The short descriptions in
the ‘[virtual herbarium][1]’ may often explicitly mention some
characters or combinations of characters.

Learning a core set of six characters will help you a lot:

 * Leaf arrangement on the stem
 * Petiole (leaf stalk) length
 * Leaf ‘compoundness’ (simple or compound)
 * Leaf margin
 * Leaf vein patterns
 * Leaf color

Please read through the details of these characters, referring when
directed to the [virtual herbarium][1] for Haiti.  Note also that
there are lots of specialized terms for plant characters. You will
need to learn a few, but in this document and in the virtual herbarium
we will try to keep specialized vocabulary to a minimum.

### Leaf arrangement on the stem

The stalks of plant’s leaves may join the stem in one of two basic
ways: they may meet separate from the stalks of other leaves, or they
may meet at the same point as one or more other other leaves. In the
former situation we say the leaves are “_alternate_”, in the latter that
they are “_opposite_”:

<img src="../img/lf_arr.jpg" alt="Leaf arrangement" style="width:50%;"/>

(Images taken with gratitude from from the [online][2] “Illustrated
Glossary of Botanical Terms in the Flora of the Chicago Region” by
Wilhelm & Rericha, 2017)

Often seeing the leaf arrangement is hard in an image crouded with
leaves, but usually there is at least a single instance where it can
be assessed.  Some examples in Haiti are:

 * Alternate
     * _Anacardium occidentale_
     * _Mangifera indica_
 * Opposite
     * _Catalpa longissima_
     * _Psidium guajava_

### Petiole (leaf stalk) length

At the base of the leaf is the leaf stalk that connects the leaf to
the stem. This stalk (“_petiole_”) can be long, relative to the length
of the leaf, or very short (termed “sessile”).  Check these plants out:

 * Petiole long
     * _Catalpa longissima_
     * _Theobroma cacao_
 * Petiole short (but not sessile)     
     * Indet. 2 (“Indet” means we do not know the species name yet)
     * _Terminalia catappa_ 

### Leaf ‘compoundness’ (simple or compound)

A leaf is a single structural unit, which will fall off when dead as
one. This unit is sometimes a compound structure with its own stalk
(“rachis”) and muliple leaf units called “_leaflets_”.  It can be tricky
to determine if what looks like a leaf is indeed a leaf, or just a
leaflet, but the regular structure of a “_compound_” leaf becomes
increasingly obvious as you get your eye in. The term “_simple_” is used
for a ‘classic’ single leaf.

There are several types of compund leaf, with the main division being
between “_pinnate_” leaves and “_palmate_” leaves. In the former,
there is a single extended stalk with leaflets coming off of it at
different points, while in the latter all the leaflets meet at a
single point.  A pinnate leaf may have a terminal leaflet
(odd-pinnate, or “_imparipinnate_”), or be without a terminal leaflet
(even-pinnate, or “_paripinnate_”).  One further complexity: if there
are two levels of division in a pinnate leaf, the leaf is “bipinnate”.

<img src="../img/comp.jpg" alt="Leaf arrangement" style="width:80%;"/>

Some examples in Haiti:

 * Simple
    * _Anacardium occidentale_
    * _Mangifera indica_
 * Pinnate compund
    * _Cedrela odorata_
    * _Simarouba glauca_
 * Palmate compound
    * Indet. 3
 * Bipinnate
    * _Moringa oleifera_

### Leaf margin

### Leaf vein patterns


### Leaf color




[1]: https://herbarium.treetracker.org/guide/guide_ht.html
[2]: https://conservationresearchinstitute.org/forms/CRI-FLORA-Glossary.pdf

