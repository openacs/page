--
-- packages/acs-page/sql/page-create.sql
--
-- @author rhs@mit.edu
-- @creation-date 2000-09-29
-- @cvs-id $Id$
--

create table pages (
    package_id		constraint pages_package_id_fk
                        references apm_packages (package_id)
                        constraint pages_package_id_pk
                        primary key,
    content		clob not null
);
