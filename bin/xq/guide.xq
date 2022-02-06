
for $i in //mtype
return concat(
  data($i/@id),
  '|',
  data($i/det/taxon/name),
  '|',
  data($i/det/taxon/family),
  '|',
  string-join( data($i/planted_in/@ref), ' '),
  '|',
  normalize-space(data($i/det/taxon/vern)),
  '|',
  normalize-space(data($i/morph)),
  '|',
  string-join( data($i/det/taxon/exotic_in/@ref), ' '),
  '|',
  normalize-space(data($i/det/taxon/native_range)),
  '|',
  string-join( data($i/det/taxonnative_in/@ref), ' '),
  '||',
  data($i//wp),
  '|',
  normalize-space(data($i/uses)),
  '|',
  string-join( data($i/cf/@ref), ' '),
  '|',
  replace(
    replace(
      concat(
        normalize-space(
          string-join(
            data($i//note)
            , '. ')
        )
      ,'.')
    , '\.\.', '.')
  , '^\.$','')  ,
  replace(
    replace(
      concat(
        normalize-space(
          string-join(
            data($i//det/note)
            , '. ')
        )
      ,'.')
    , '\.\.', '.')
  , '^\.$','')  
)
