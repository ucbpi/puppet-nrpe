# == Class: nrpe
#
#  NRPE class that sets up NRPE service and config on our system
#
# === Parameters:
#
# [*allowed_hosts*]
#
# Array of hosts to allow to connect to NRPE.  Default is [ '127.0.0.1' ]
#
# [*xinetd*]
#
# Should we use xinetd instead of running an NRPE daemon? Default is false.
#
class nrpe (
  $allowed_hosts = [ '127.0.0.1' ],
  $xinetd = false
) {
  $xinetd_r = any2bool( $xinetd )

  $nrpe_dot_d_dir = '/etc/nrpe.d/'
  # make sure we only have commands we manage in there
  file { $nrpe_dot_d_dir:
    ensure  => directory,
    purge   => true,
    force   => true,
    recurse => true,
    owner   => 'root',
    group   => 'root',
    mode    => '0555',
  }

  if ! is_array( $allowed_hosts ) {
    $allowed_hosts_r = split($allowed_hosts, '[:,|;]')
  } else {
    $allowed_hosts_r = $allowed_hosts
  }

  include nrpe::package, nrpe::service, nrpe::config
}
