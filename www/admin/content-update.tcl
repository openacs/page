# packages/page/www/admin/content-update.tcl

ad_page_contract {

  @author rhs@mit.edu
  @creation-date 2000-09-29
  @cvs-id $Id$
} {
  content:allhtml
}

set package_id [ad_conn package_id]

if {![empty_string_p $content]} {
  db_transaction {
    db_dml content_update {
      update pages
      set content = :content
      where package_id = :package_id
    }

    if {![db_resultrows]} {
      db_dml content_insert {
	insert into pages
	(package_id, content)
	values
	(:package_id, :content)
      }
    }
  }
}

ad_returnredirect ".."
