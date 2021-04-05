
for $i in //taxon
return concat(
  data($i//gs_id),
  '|',
  data($i//sci_name),
  '|',
  data($i//family),
  '|',
  data($i//planted_in),
  '|',
  normalize-space(data($i//name)),
  '|',
  normalize-space(data($i//id_notes)),
  '|',
  data($i//exotic_in),
  '|',
  normalize-space(data($i//native_range)),
  '|',
  data($i//native_in),
  '|',
  data($i//id_diff),
  '|',
  data($i//wp),
  '|',
  normalize-space(data($i//uses))
)
