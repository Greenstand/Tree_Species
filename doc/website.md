

s3cmd -v --no-preserve --delete-removed -c ~/.s3cfg-herbarium sync ../herbarium/ s3://herbarium.treetracker.org/

This should work:

s3cmd ws-create --ws-index=index.html --ws-error=error.html -c ~/.s3cfg-herbarium s3://herbarium.treetracker.org/

but i get (2021-11-04) a 

ERROR: Access to bucket 'herbarium.treetracker.org' was denied
ERROR: S3 error: 403 (AccessDenied): Access Denied

_however_ by placing an index.html at the root, it already works as a
website. See: https://herbarium.treetracker.org/

