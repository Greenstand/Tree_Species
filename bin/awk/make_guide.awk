BEGIN{

  guides = "ht|sl|tz"
  countries = "Haiti|Sierra Leone|Tanzania"
  split(guides,guide,"|")
  split(countries, country,"|")
  
  # Get data from XML file
  cmd = "xqilla -i ../tree_species.xml xq/guide.xq"
  FS="|"
  while ((cmd | getline) > 0) {
    name[$1] = $2
    fam[$1] = $3
    planted_in[$1] = $4
    common[$1] = $5
    idnotes[$1] = $6
    exotic[$1] = $7
    range[$1] = $8
    native[$1] = $9
    iddiff[$1] = $10
    wp[$1] = $11
    uses[$1] = $12
  }
  close(cmd)
  
  # Get photos
  cmd = "find ../herbarium/taxa/ -type f -name '*.[jJpP][pPnN][gG]' | sort "\
    "| sed 's|../herbarium/taxa/||g'"
  FS="/"
  while ((cmd | getline) > 0) {
    code[$2] = $1
    if (!hasphotos[$1])
      firstphoto[$1] = $2
    hasphotos[$1] = 1
    if ($2 == "_lf.jpg")
      haslfphoto[$1] = 1
    if ($2 == "_sdl.jpg")
      hassdlphoto[$1] = 1
  }
  close(cmd)
  
  # Get tag
  "git tag" | getline TAG

  # 1. make the index file
  OUT = "../herbarium/guide/index.html"
  print header("Greenstand tree species") > OUT
  print "<h1>Greenstand tree species</h1>" >> OUT
  print "<ul>" >> OUT
  PROCINFO["sorted_in"] = "@val_str_asc"
  for (i in guide)
    print "<li>Guide for <a href=\"guide_" guide[i] ".html\">" country[i] \
      "</a></li>" >> OUT
  print "</ul>" >> OUT
  print footer() >> OUT
  
  # 2. make the guides for each country
  for (i in guide) {
    print "Making guide for " country[i] > "/dev/stderr"
    OUT = "../herbarium/guide/guide_" guide[i] ".html"
    print header("Restoration tree species for " country[i]) > OUT
    print "<h1>Restoration tree species for " country[i] "</h1>" >> OUT
    print "<p>(<a href=\"index.html\">Other counties</a>. Raw data: <a href=\"https://github.com/Greenstand/Tree_Species/blob/master/tree_species.xml\">Github</a>. Seedling ID <a href=\"sdl_id.html\">HOWTO</a>. Glossaries of botanical terms: <a href=\"https://en.wikipedia.org/wiki/Glossary_of_botanical_terms\">Wikipedia</a>, <a href=\"http://www.calflora.net/botanicalnames/botanicalterms.html\">Calflora</a>, <a href=\"https://conservationresearchinstitute.org/forms/CRI-FLORA-Glossary.pdf\">Chicago flora</a>, <a href=\"https://archive.org/details/plantform00adri\">Bell</a>.)</p>" >> OUT
    print "<table>" >> OUT
    PROCINFO["sorted_in"] = "@val_str_asc"
    n=0
    for (j in name)
      if ((hasphotos[j]) && (planted_in[j] ~ guide[i])) {
        f = (fam[j]) ? ("<br/>(" fam[j] ")") : ""
        x = (exotic[j] ~ guide[i]) ? ("<br/>Not native to " country[i] ) : ""
        xn = (native[j] ~ guide[i]) ? ("<br/><b>Native</b> to " country[i] ) : ""
        r = (range[j]) ? ("<br/>Native range: " range[j] ) : ""
        idn = (idnotes[j]) ? ("<br/><br/><i>ID notes</i>: " idnotes[j] ) : ""
        # idd = (iddiff[j]) ? ("<br/><i>ID difficulty</i>: " iddiff[j] ) : ""
        pic1 = (hassdlphoto[j]) ? "_sdl.jpg" : firstphoto[j]
        pic2 = (haslfphoto[j]) ? \
          "<img src=\"../taxa/" j "/_lf.jpg\" width=\"180\" alt=\"seedling\"/>" : "&#160;"

        print "<tr><td>" ++n "</td>"                                    \
          "<td><b>" name[j] "</b><br/>" common[j] x xn idn              \
          "</td><td><a href=\"" j ".html\">" j "</a></td>"              \
          "<td><img src=\"../taxa/" j "/" pic1 "\" height=\"180\" alt=\"seedling\"/></td>" \
          "<td>" pic2 "</td>"                                           \
          "</tr>" >> OUT
      }
    print "</table>" >> OUT
    print "<p>Version: " TAG "</p>" >> OUT
    print footer() >> OUT
  }

  # 3. make the guides for each taxon
  for (i in hasphotos) {
    print "Making guide for taxon " i > "/dev/stderr"
    OUT = "../herbarium/guide/" i ".html"
    print header("Greenstand taxon " i) > OUT
    print "<h1>" name[i] " (code: " i ")</h1>" >> OUT
    print "<h2>" common[i] "</h2>" >> OUT
    print "<ul>" >> OUT
    if (fam[i])
      print "<li><i>Family</i>: " fam[i] "</li>" >> OUT
    if (range[i])
      print "<li><i>Native range</i>: " range[i] "</li>" >> OUT
    if (wp[i])
      print "<li><i>Wikipedia</i>: <a href=\"" wp[i] "\">LINK</a></li>" >> OUT
    if (uses[i])
      print "<li><i>Uses</i>: " uses[i] "</li>" >> OUT
    if (idnotes[i])
      print "<li><i>ID notes</i>: " idnotes[i] "</li>" >> OUT
    if (iddiff[i])
      print "<li><i>ID difficulty</i>: <b>" iddiff[i] "</b></li>" >> OUT
    print "</ul>" >> OUT
    print "<table>" >> OUT
    n = 0
    for (j in code) 
      if ((code[j] == i) && (j !~ /^_/)) {
        print "<tr><td><img src=\"../taxa/" i "/" j                 \
          "\" height=\"800\" alt=\"seedling\"/></td></tr>" >> OUT
        n++
      }
    if (n > 20)
      print "  (NOTE: taxon " i " has " n " photos!)" > "/dev/stderr"
    print "</table>" >> OUT
    print footer() >> OUT
  }

}

function header(title) {
  # version history: [chars app] -> [tcm app] -> here
  
  return  "<!DOCTYPE html>" \
    "<html xmlns=\"http://www.w3.org/1999/xhtml\">"                     \
    "<head><title>" title "</title>"                                    \
    "<meta http-equiv=\"Content-Type\" content=\"text/html;"            \
    "charset=utf-8\" />"                                                \
    "<link href=\"https://fonts.googleapis.com/css?family=Montserrat\" "\
    "rel=\"stylesheet\"/>"                                              \
    "<link rel=\"shortcut icon\" "                                      \
    "href=\"https://greenstand.org/fileadmin/02-graphics/04-favicons/"  \
    "favicon.ico\" type=\"image/x-icon\"/>"                             \
    "<style type=\"text/css\">"                                         \
    "body { font-size: 14px; font-family: 'Montserrat', "               \
    "Verdana, Arial, Helvetica, sans-serif; }"                          \
    ".main {width: 1000px; padding-top: 10px; margin-left: auto;"       \
    "  margin-right: auto; }"                                           \
    "h1 { padding-top:20px; }"                                          \
    "select , option { font-size: 14px }"                               \
    "table { border-collapse: collapse }"                               \
    "td, th { border: 1px solid black; padding: 5px }"                  \
    "a { color:#15358d; text-decoration:none; border-bottom-style:none }" \
    "a:visited { color:#9f1dbc }"                                       \
    "a:hover {color:#15358d; border-bottom-style:solid; "               \
    "border-bottom-width:thin }"                                        \
    ".graph { max-width: 100%; }"                                       \
    "</style>"                                                          \
    "</head>\n<body>"                                                   \
    "<div class=\"main\">"
}

function footer() {
  return "</div>\n</body>\n</html>";
}

