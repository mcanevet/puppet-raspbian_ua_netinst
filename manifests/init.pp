class raspbian_ua_netinst(
  $swapfile = '/swap',
) {
  include ::locales
  include ::timezone

  package { [ 'linux-image-rpi-rpfv', 'raspberrypi-bootloader-nokernel', ]:
    ensure => installed,
  }
  ->
  file { '/boot/kernel.img':
    source => '/vmlinuz',
    links  => follow,
  }
  
  if $swapfile {
    exec { "/bin/dd if=/dev/zero of=${swapfile} bs=1M count=512":
      creates => $swapfile,
    }
    ->
    exec { "/sbin/mkswap ${swapfile}":
      unless => '/sbin/blkid -t TYPE="swap" ${swapfile}',
    }
    ->
    exec { "/sbin/swapon ${swapfile}":
      unless  => "/sbin/swapon -s | grep ${swapfile}",
    }
  }
}
