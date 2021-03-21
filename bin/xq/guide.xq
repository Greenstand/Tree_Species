
for $i in //taxon
return concat(
  data($i//gs_id),
  '|',
  data($i//sci_name),
  '|',
  data($i//family)
)
