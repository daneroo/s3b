This file `README.md` hides the original (jewler generated) README.rdoc

## Duplication alert!

Just found this: (https://github.com/meskyanichi/backup.git)[https://github.com/meskyanichi/backup.git]

How about just do the url stuff, and handoff the produced config to backup!

## Gemcutter and Jeweler
Useful tasks, see (Jeweler docs)[https://github.com/technicalpickles/jeweler]
    rake -T

    rake release      # push and tag on github, push to rubygems.org
    
    sudo rake install # install locally, may need to sudo

## Requirements
We chose to implement over the (fog)[http://fog.io/1.0.0/storage/] api to allow us to
move easiliy to other providers later.

We want a simple utility to:

*   make a mongodump of a database -> .tgz
*   push/store to amazon s3
*   fetch from amazon s3
*   restore a database from .tgz

Usage

    # Local operations
    s3b dump mongodb://localhost/<dbname>  <dump.tgz>
    s3b restore <dump.tgz> mongo:<dbname>

    # Simple S3 operations
    s3b store <filename> s3://<bucketname>/<key>
    s3b fetch s3://<bucketname>/<key> <filename>
    
## Simple example
Following the docs at (fog.io)[http://fog.io/1.0.0/storage/].
Look at `simple.rb`

## URI's
Look at uri.rb

## Install fog
This is to test s3 storage with fog gem

    sudo gem install fog
    