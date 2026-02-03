---
title: "GMOD RPC API/PHP"
---
# GMOD RPC API/PHP

Plans/Architecture for the PHP tools for implementing gmod-rpc

  Components](#Components)
  - [index.php](#index.php)
  - [class.myDomDocument.php](#class.myDomDocument.php)
  - [version
    directories](#version_directories)
    - [gmod-rpc/v1/rpc.php](#gmod-rpc.2Fv1.2Frpc.php)
    - [gmod-rpc/v1/sources/](#gmod-rpc.2Fv1.2Fsources.2F)
    - [gmod-rpc/v1/services/](#gmod-rpc.2Fv1.2Fservices.2F)
    - [gmod-rpc/v1/class.View.php](#gmod-rpc.2Fv1.2Fclass.View.php)

## Components

### index.php

    gmod-rpc/index.php

Use mod_rewrite so that gmod-rpc URLs all go to this script

    <IfModule mod_rewrite.c>
    RewriteEngine on
    RewriteRule ^/gmod-rpc/.*$ /gmod-rpc/index.php
    </IfModule>

index.php looks for a version directory based on the URL.

### class.myDomDocument.php

Very small class from Joe Grissom at Oklahoma for making XML. There is
probably something more sophisticated that could be used in the future,
but this works.

### version directories

put everything else in a directory based on the version, e.g. v1

#### gmod-rpc/v1/rpc.php

All this does is parse the URL to instantiate a controller object for the
desired service and a view object. The class files live in

#### gmod-rpc/v1/sources/

This will be where data source adaptors live class.SourceName.php/

#### gmod-rpc/v1/services/

This directory holds a file defining a base class

    class.Service.php

implement additional services by adding object classes that extend this
base class e.g. class.Organisms.php:

``` de1
class Organisms extends Service{
...
```

Service class names should be ucfirst.

#### gmod-rpc/v1/class.View.php

A views object to generate xml or json
