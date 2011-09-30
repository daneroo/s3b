This file `README.md` hides the original (jewler generated) README.rdoc

## Requirements
We chose to implement over the (fog)[http://fog.io/1.0.0/storage/] api to allow us to
move easiliy to other providers later.

We want a simple utility to:

*   make a mongodump of a database -> .tgz
*   push/store to amazon s3
*   fetch from amazon s3
*   restore a database from .tgz

Usage
```
# Local operations
s3b dump mongodb://localhost/<dbname>  <dump.tgz>
s3b restore <dump.tgz> mongo:<dbname>

# Simple S3 operations
s3b store <filename> s3://<bucketname>/<key>
s3b fetch s3://<bucketname>/<key> <filename>
```
    
## Simple example
Following the docs at (fog.io)[http://fog.io/1.0.0/storage/].
Look at `simple.rb`

## URI's
Look at uri.rb

## Install fog
This is to test s3 storage with fog gem

    sudo gem install fog
    
## javascript example from mongoose
```javascript
var Comments = new Schema({
    title     : String
  , body      : String
  , date      : Date
});

var BlogPost = new Schema({
    author    : ObjectId
  , title     : String
  , body      : String
  , buf       : Buffer
  , date      : Date
  , comments  : [Comments]
  , meta      : {
      votes : Number
	  , favs  : Number
	}
});

var Post = mongoose.model('BlogPost', BlogPost);
```