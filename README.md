raspbian_ua_netinst
===================

https://github.com/hifi/raspbian-ua-netinst is a minimal Raspbian unattended netinstaller for Raspberry Pi Model B.

This module allows you to finish the installation with Puppet.

Usage
-----

```puppet
include ::raspbian_ua_netinst
```

Reference
---------

Classes:

* [raspbian_ua_netinst](#class-raspbian_ua_netinst)

###Class: raspbian_ua_netinst

####`swapfile`
The name of the swapfile to create. Set it to `false` to disable. Defaults to `/swap`
