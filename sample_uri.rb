require 'rubygems'
require 'uri'

uris = %w{
  http://hostname.tld/
  file://hostname.tld/path
  s3://bucketnmae/key.tgz
  mongodb://localhost/dbname
  mongodb:dbname
  justaname
  file:justname
}

parts = %w{ scheme userinfo host port registry path opaque query fragment }
#p parts

def removenil(uri)
  uri.each do  |k,v| 
    puts "#{k}  : #{v}" 
  end
  
end
uris.each do |urlstr|
  puts ""
  puts "uri: #{urlstr}"
  z = parts.zip(URI.split(urlstr))
  uri={};
  z.each do  |kv| 
    uri[kv[0]]=kv[1] 
  end
  uri.delete_if {|key, value| value == nil }
  p uri
end
puts ""
