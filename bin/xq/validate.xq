(: Validate :)
(: refer to ~/public_html/xmalesia/xq/validate.xq :)

<errors>
{
(: find non-unique indiv ids :)
for $i in distinct-values(//taxon/gs_id)
let $j := //taxon[gs_id = $i]
where count($j) > 1
return element non_uniq_count {
  attribute gs_id {$i},
  count($j)
  }
}
</errors>
