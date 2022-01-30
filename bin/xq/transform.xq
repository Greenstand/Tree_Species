(: xqilla -i tree_species.xml bin/xq/transform.xq | sed -e 's/<morph>/<morph><![CDATA[/g' -e 's|</morph>|]]></morph>|g' -e 's|&lt;|<|g' -e 's|&gt;|>|g' | tidy -xml -i -q :)

<morphotypes>
  {
    for $t in //taxon
    return
    <mtype>
    { attribute id {$t/@id} }
    <det><taxon>
      { attribute id { lower-case(replace($t/sci_name, "[. ()]", "")) } }
      <name> { data($t/sci_name) } </name>
      {
        if (exists($t/family))
          then ( $t/family) 
        else ()
      }
      {
        if (exists($t/inat_taxon))
          then ( $t/inat_taxon) 
        else ()
      }
      {
        if (exists($t/eol_taxon))
          then ( $t/eol_taxon) 
        else ()
      }
      {
        if (exists($t/name))
          then ( <vern> { data($t/name) } </vern> )
          else ()
      }
      {
        if (exists($t/native_range))
          then ( <range> { data($t/native_range) } </range> )
          else ()
      }
      {
        if (exists($t/native_in))
          then (
            for $x in $t/native_in
            return
            <native_in> { attribute ref { data($x/@ref) } } </native_in> )
          else ()
      }
      {
        if (exists($t/exotic_in))
          then (
            for $x in $t/exotic_in
            return
            <exotic_in> { attribute ref { data($x/@ref) } } </exotic_in> )
          else ()
      }
      {
        if (exists($t/wdz))
          then ( $t/wdz) 
        else ()
      }
      {
        if (exists($t/uses))
          then ( $t/uses )
        else ()
      }
      {
        if (exists($t/links))
          then ( $t/links )
        else ()
      }
    </taxon>
    </det>
    {
      if (exists($t/id_notes))
        then ( <morph> { data($t/id_notes) } </morph> )
      else ()
    }
    {
      if (exists($t/cf))
        then (
          for $x in $t/cf
          return $x )
        else ()
    }
    {
      if (exists($t/note))
        then (
          for $x in $t/note
          return $x )
        else ()
    }
    {
      if (exists($t/apname))
        then (
          for $x in $t/apname
          return $x )
        else ()
    }
    {
      if (exists($t/planted_in))
        then (
          for $x in $t/planted_in
          return $x )
        else ()
    }
    {
      if (exists($t/first_locn))
        then ( <first_locn> { attribute ref { data($t/first_locn/@ref) } } </first_locn> )
      else ()
    }
    </mtype>
  }
  <taxa>
  </taxa>
  <countries>
  {
    for $x in //country
    return $x
  }
  </countries>
  <docs>
  {
    for $x in //doc
    return $x
  }
  </docs>
</morphotypes>