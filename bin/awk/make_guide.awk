BEGIN{

  guides = "ht|tz"
  countries = "Haiti|Tanzania"
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
  }
  
  # Get photos
  cmd = "find ../herbarium/taxa/ -type f -name '*.[jJpP][pPnN][gG]' | sort | sed "\
    "'s|../herbarium/taxa/||g'"
  FS="/"
  while ((cmd | getline) > 0) {
    code[$2] = $1
    if (!hasphotos[$1])
      firstphoto[$1] = $2
    hasphotos[$1] = 1
  }

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
    print header("Greenstand tree species") > OUT
    print "<h1>Greenstand tree species for " country[i] "</h1>" >> OUT
    print "<table>" >> OUT
    PROCINFO["sorted_in"] = "@val_str_asc"
    for (j in name) 
      if ((hasphotos[j]) && (planted_in[j] ~ guide[i])) {
        f = (fam[j]) ? ("<br/>(" fam[j] ")") : ""
        print "<tr><td>" name[j] f "</td><td><a href=\"" j ".html\">" j \
          "</a></td><td><img src=\"../taxa/" j "/" firstphoto[j]        \
          "\" height=\"150\"></td></tr>" >> OUT
      }
    print "</table>" >> OUT
    print footer() >> OUT
  }

  # 3. make the guides for each taxon
  for (i in hasphotos) {
    print "Making guide for taxon " i > "/dev/stderr"
    OUT = "../herbarium/guide/" i ".html"
    print header("Greenstand taxon " i) > OUT
    print "<h1>Greenstand taxon: " i "</h1>" >> OUT
    print "<h2>" name[i] " / " common[i] "</h2>" >> OUT
    if (idnotes[i])
      print "<p><b>ID notes:</b> " idnotes[i] "</p>" >> OUT
    print "<table>" >> OUT
    for (j in code) 
      if (code[j] == i) {
        print "<tr><td><img src=\"../taxa/" i "/" j \
          "\" height=\"800\"></td></tr>" >> OUT
      }
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
    "<link href=\"https://treetracker.org/favicon.ico\" "               \
    "rel=\"shortcut icon\" type=\"image/x-icon\"/>"                     \
    "<style>"                                                           \
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

