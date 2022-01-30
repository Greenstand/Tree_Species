(: Validate :)
(: refer to ~/public_html/xmalesia/xq/validate.xq :)

    (: both of these so far are redundant if jing is used :)
    (: find non-unique indiv ids :)

<errors>
{
for $i in distinct-values(//mtype/@id)
let $j := //taxon[@id = $i]
where count($j) > 1
return element non_uniq_mtype_count {
  attribute id {$i},
  count($j)
  }
}
{
for $i in distinct-values(//taxon/@id)
let $j := //taxon[@id = $i]
where count($j) > 1
return element non_uniq_taxon_count {
  attribute id {$i},
  count($j)
  }
}
{
(: find non-matching id refs :)
for $i in distinct-values(//mtype/cf/@ref)
let $j := //mtype[@id = $i]
where count($j) < 1
return element missing_id_for_ref {
  attribute ref {$i},
  empty
  }
}
</errors>
