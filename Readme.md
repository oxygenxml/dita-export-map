Export DITA Map Plugin
=======================

Plugin which ZIPs the entire contents of the DITA project starting from the published DITA Map. 
It's transtype is called `exportmap`. The plugin works with both DITA-OT 1.8 and 2.x.

This plugin depends on the DITA OT plugin "org.dita-community.common.xslt" created by Eliot Kimber being installed, as it uses an utility method from it to unescape file paths.

**Note:** Resources not referenced directly or indirectly in the DITA Map will not get included.

Copyright and License
---------------------
Copyright 2018 Syncro Soft SRL.

This project is licensed under [Apache License 2.0](https://github.com/oxygenxml/dita-export-map/blob/master/LICENSE)
