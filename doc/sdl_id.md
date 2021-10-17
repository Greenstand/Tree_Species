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
directed to the [virtual herbarium][1] for Haiti.

### Leaf arrangement on the stem

The stalks of plant’s leaves may join the stem in one of two basic
ways: they may meet separate from the stalks of other leaves, or they
may meet at the same point as one or more other other leaves. In the
former situation we say the leaves are _alternate_, in the latter that
they are _opposite_:

<img src="../img/lf_arr.png" alt="Leaf arrangement" style="width:80%;margin-left: auto; margin-right: auto; display:block;"/>



### Petiole (leaf stalk) length

### Leaf ‘compoundness’ (simple or compound)

### Leaf margin

### Leaf vein patterns


### Leaf color




[1]: https://herbarium.treetracker.org/guide/guide_ht.html
