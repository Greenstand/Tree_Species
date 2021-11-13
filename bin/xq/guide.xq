
for $i in //taxon
return concat(
  data($i/@id),
  '|',
  data($i/sci_name),
  '|',
  data($i/family),
  '|',
  string-join( data($i/planted_in/@ref), ' '),
  '|',
  normalize-space(data($i/name)),
  '|',
  normalize-space(data($i/id_notes)),
  '|',
  string-join( data($i/exotic_in/@ref), ' '),
  '|',
  normalize-space(data($i/native_range)),
  '|',
  string-join( data($i/native_in/@ref), ' '),
  '|',
  data($i/id_diff),
  '|',
  data($i//wp),
  '|',
  normalize-space(data($i/uses)),
  '|',
  string-join( data($i/cf/@ref), ' ')
)
