require 'helper'

class TestS3b < Test::Unit::TestCase

#  should "probably rename this file and start testing for real" do
#    flunk "hey buddy, you should probably rename this file and start testing for real"
#  end
  
  should "parse a uri" do
    ##assert_equal(8, );
    uri = S3b::Uri.new('http://host.tld/path').uri

    assert_equal('http', uri.scheme)
    assert_equal('host.tld', uri.host)
    assert_equal('/path', uri.path)
  end
  
  should "parse a full mongo uri"  do
    u =  S3b::Uri.new('mongodb://localhost/dbname')
    
    assert_equal({"path"=>"/dbname", "scheme"=>"mongodb", "host"=>"localhost"},u.parts)
  end
  should "parse a local mongo uri"  do
    u =  S3b::Uri.new('mongodb:dbname')    
    assert_equal({"opaque"=>"dbname", "scheme"=>"mongodb"},u.parts)
  end
  should "parse a full file uri"  do
    u = S3b::Uri.new('file:///directory/filename.tgz')
    assert_equal({"path"=>"/directory/filename.tgz", "scheme"=>"file"},u.parts)
  end
  should "parse an absolute file uri"  do
    u = S3b::Uri.new('file:/directory/filename.tgz')
    assert_equal({"path"=>"/directory/filename.tgz", "scheme"=>"file"},u.parts)
  end
  should "parse a relative file uri"  do
    u = S3b::Uri.new('file:directory/filename.tgz')
    assert_equal({"opaque"=>"directory/filename.tgz", "scheme"=>"file"},u.parts)
  end
  should "parse a host-is-bucket s3 uri"  do
    u = S3b::Uri.new('s3://bucket/keyfilename.tgz')
    assert_equal({"path"=>"/keyfilename.tgz", "scheme"=>"s3", "host"=>"bucket"},u.parts)
  end
  should "parse an opaque s3 uri"  do
    u = S3b::Uri.new('s3:bucket/keyfilename.tgz')
    assert_equal({"opaque"=>"bucket/keyfilename.tgz", "scheme"=>"s3"},u.parts)
  end
  should "parse a crediential s3 uri"  do
    u = S3b::Uri.new('s3://credentials@bucket/keyfilename.tgz')
    assert_equal({"userinfo"=>"credentials",
     "path"=>"/keyfilename.tgz",
     "scheme"=>"s3",
     "host"=>"bucket"},u.parts)
  end
end
