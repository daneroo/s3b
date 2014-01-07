require 'rubygems'
require 'fog'

# create a connection
connection = Fog::Storage.new({
  :provider                 => 'AWS',
  :aws_secret_access_key    => 'YOUR_SECRET_ACCESS_KEY',
  :aws_access_key_id        => 'YOUR_ACCESS_KEY_ID'
})

# First, a place to contain the glorious details
directory = connection.directories.create(
  #:key    => "fog-demo-#{Time.now.to_i}", # globally unique name
  :key    => "fog-demo-simple", # globally unique name
  :public => true
)

# list directories
#p connection.directories
connection.directories.each do |dir|
  puts "directory (bucket): #{dir.key} location:#{dir.creation_date}"
end
puts ""

# upload that resume
file = directory.files.create(
  :key    => 'README.md',
  :body   => File.open("./README.md"),
  :public => true
)
puts "uploaded #{file.key}: etag(md5):#{file.etag}"
puts ""

directory.files.each do |file|
  puts "listing #{file.key}: etag(md5):#{file.etag}"
end


puts ""
puts 'axial-mongo listing'
axmongo=connection.directories.get('axial-mongo')
axmongo.files.each do |file|
  puts "ax-mg #{file.key}: etag(md5):#{file.etag}"
end
puts ""
