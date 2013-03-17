bee6d ipv6 hack
=====

####Prepare

    opkg install ipv6calc ip rdisc6

/etc/config/network

    config interface 'vpn'
            ...
            option ipv6 '1'
            option send_rs '0'

/etc/sysctl.conf

    net.ipv6.conf.all.forwarding = 1

####Install

Copy files directly or make package:

    cd attitude_adjustment
    cd packages
    git clone git://github.com/sigwall/bee6d.git
    cd ..
    make package/bee6d/compile
    make package/bee6d/install

####Configure

/etc/config/bee6d

    config interface "vpn"
       option "laniface" "lan"

####Run

/etc/ppp/ip-up.d/bee6d.sh script installed automatically.

Manual run: `bee6d -i l2tp-vpn` or `bee6d -p vpn`

Enjoy.
