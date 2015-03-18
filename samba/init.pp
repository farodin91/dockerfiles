class { 'samba': 
  workgroup     => 'TEST',
  netbios_name  => 'TEST',
  server_strina => 'Awesome Test FileServer',
}

samba::share { 'homes': 
  options => { 
    'comment'        => 'Home Directories' ,
    'browseable'     => 'no' ,
    'read only'      => 'yes',
    'create mask'    => '0700',
    'directory mask' => '0700',
    'valid users'    => '%S',
  },
}

class { 'samba::ldap':
  ldap_uri            => 'ldap://localhost',
  ldap_ssl            => 'no',
  ldap_delete_dn      => 'no',
  ldap_password_sync  => 'yes',
  ldap_admin_dna      => 'cn=admin,dc=test',
  ldap_suffix         => 'dc=test',
  ldap_user_suffix    => 'ou=people',
  ldap_group_suffix   => 'ou=groups',
  ldap_machine_suffix => 'ou=computers',
  ldap_idmap_suffix   => 'ou=idmap',
}