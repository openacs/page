# packages/page/www/index.tcl

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

set controls [list]

if {[db_0or1row content {
  select content
  from pages
  where package_id = :package_id
}]} {
  if {[ad_permission_p $package_id write]} {
    lappend controls "<a href=admin/>edit</a>"
  }
} else {
  if {[ad_permission_p $package_id create]} {
    lappend controls "<a href=admin/>create</a>"
  }
  set content "(no content)"
}

if {[llength $controls] > 0} {
  set control_html "\[ [join $controls " | "] \]"
} else {
  set control_html "&nbsp;"
}

set body "[ad_header $instance_name]

<h2>$instance_name</h2>

<table width=100%><tr><td>[ad_context_bar]</td><td align=right>$control_html</td></table>
<hr>

$content

[ad_footer]
"

doc_return 200 text/html $body
