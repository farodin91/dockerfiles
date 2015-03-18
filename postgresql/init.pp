class { 'postgresql::server': }

postgresql::server::db { 'mydatabasename':
  user     => 'mydatabaseuser',
  password => postgresql_password('mydatabaseuser', 'mypassword'),
}