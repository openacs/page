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

set body "[ad_header $instance_name]

<h3>$instance_name</h3>

[ad_context_bar]
<hr>

<form method=post action=\"content-update\">

<table align=center>

<tr><td>
<textarea name=content rows=30 cols=60 wrap=soft>[ns_quotehtml $content]</textarea>
</td></tr>

<tr><td align=center>
<input type=submit value=Save>
</td></tr>

</table>

</form>

[ad_footer]
"

doc_return 200 text/html $body
