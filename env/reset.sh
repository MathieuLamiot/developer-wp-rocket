#!/bin/bash

# Delete (force) all posts created by PHPdoc parse.
wp post delete --force $(wp post list --post_type='blocks-handbook' --format=ids)
wp post delete --force $(wp post list --post_type='wpcs-handbook' --format=ids)
wp post delete --force $(wp post list --post_type='rest-api-handbook' --format=ids)
wp post delete --force $(wp post list --post_type='adv-admin-handbook' --format=ids)
wp post delete --force $(wp post list --post_type='wp-parser-function' --format=ids)
wp post delete --force $(wp post list --post_type='wp-parser-class' --format=ids)
wp post delete --force $(wp post list --post_type='wp-parser-hook' --format=ids)
wp post delete --force $(wp post list --post_type='wp-parser-method' --format=ids)
wp post delete --force $(wp post list --post_type='command' --format=ids)

# Delete all terms created by PHPdoc parse.
wp term list 'wp-parser-package' --field=term_id | xargs wp term delete 'wp-parser-package'
wp term list 'wp-parser-since' --field=term_id | xargs wp term delete 'wp-parser-since'
wp term list 'wp-parser-namespace' --field=term_id | xargs wp term delete 'wp-parser-namespace'
wp term list 'wp-parser-source-file' --field=term_id | xargs wp term delete 'wp-parser-source-file'