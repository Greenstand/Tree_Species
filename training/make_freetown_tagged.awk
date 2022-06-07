BEGIN{

  # config:
  list="mango^MANGINDI|moringa^MORIOLEI|cashew^ANACOCCI|tombi^TAMAINDI|tamarind^TAMAINDI|teak^GMELARBO|whiteteak^GMELARBO|tectonagrandis^TECTGRAN|neem^AZADINDI|gliricidia^GLIRSEPI|gliricidiasepium^GLIRSEPI|soursop^ANNOMURI|jackfruit^ARTOHETE|camelsfoot^PILITHON|prideofbarbados^CAES0001"

  # ---------------------
  
  FS=OFS="|"
  SRCDIR="../raw/freetown/spp/"
  DESTFILE="training_freetown_tagged.psv"

  split(list, l1, "|")

  system("rm -f " DESTFILE)
  
  for (i in l1) {
    split(l1[i],l2,"^")
    while ((getline < \
            ("/home/cam/Greenstand/Tree_Species/raw/freetown/spp/" l2[1]))>0)
      print l2[2], gensub( \
    /https:\/\/treetracker-production-images.s3.eu-central-1.amazonaws.com\// \
    ,"","G",$1) >> DESTFILE
  }

}
