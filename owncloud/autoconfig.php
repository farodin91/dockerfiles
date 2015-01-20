<?php
$AUTOCONFIG = array(
  "dbtype"        => "pgsql",
  "dbname"        => "{{POSTGRES_DB}}",
  "dbuser"        => "{{POSTGRES_USER}}",
  "dbpass"        => "{{POSTGRES_PW}}",
  "dbhost"        => "{{POSTGRES_HOST}}",
  "dbtableprefix" => "owncloud",
  "adminlogin"    => "{{ROOT_NAME}}",
  "adminpass"     => "{{ROOT_PW}}",
  "directory"     => "/var/www/owncloud/data",
);