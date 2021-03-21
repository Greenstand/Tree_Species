BEGIN{

  # Get data from XML file
  cmd = "xqilla -i ../tree_species.xml xq/guide.xq"
  FS="|"
  while ((cmd | getline) > 0) {
    name[$1] = $2
    fam[$1] = $3
  }
  
  # Get photos
  cmd = "find ../herbarium/taxa/ -type f | sort | sed "\
    "'s|../herbarium/taxa/||g'"
  FS="/"
  while ((cmd | getline) > 0) {
    code[$2] = $1
    if (!hasphotos[$1])
      firstphoto[$1] = $2
    hasphotos[$1] = 1
  }

  # make the index file
  OUT = "../herbarium/guide/index.html"
  print header("Greenstand tree species") > OUT
  print "<h1>Greenstand tree species</h1>" >> OUT
  print "<table>" >> OUT
  PROCINFO["sorted_in"] = "@val_str_asc"
  for (i in name) 
    if (hasphotos[i]) {
      f = (fam[i]) ? (" (" fam[i] ")") : ""
      print "<tr><td>" name[i] f "</td><td>" i "</td><td>"   \
        "<img src=\"../taxa/" i "/" firstphoto[i]                       \
        "\" height=\"80\"></td></tr>" >> OUT
    }
  print "</table>" >> OUT
  print footer() >> OUT
  
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
    ".main {width: 1000px; padding-top: 30px; margin-left: auto;"       \
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

