#
# == Class: nfs::server::redhat
#
# NFS server
# TODO: add NFS v4 support
#
class nfs::server::redhat inherits nfs::client::redhat {

  service{ 'nfs':
    ensure    => running,
    enable    => true,
    hasstatus => true,
    require   => Package[ 'nfs-utils' ],
  }
  
  @concat {'/etc/exports':
    owner  => root,
    group  => root,
    mode   => '0644',
    notify => Service['nfs'],
  }

}
