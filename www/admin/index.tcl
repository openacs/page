# packages/page/www/admin/index.tcl

ad_page_contract {

  @author rhs@mit.edu
  @creation-date 2000-09-29
  @cvs-id $Id$
}

set package_id [ad_conn package_id]

db_1row instance_name {
  select instance_name
  from apm_packages
  where package_id = :package_id
}

if {![db_0or1row content {
  select content
  from pages
  where package_id = :package_id
}]} {
  set content ""
}

