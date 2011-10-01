require 'uri'

module S3b
  class Uri
    PARTS = %w{ scheme userinfo host port registry path opaque query fragment }

    def initialize(urlstr) 
      @uri = URI.parse(urlstr)
      @parts={}
      @urlstr = urlstr
      get_parts
    end
    attr_reader :uri,:parts 
    
    
    private
    def get_parts
      z = PARTS.zip(URI.split(@urlstr))
      z.each do  |kv| 
        @parts[kv[0]]=kv[1] 
      end
      @parts.delete_if {|key, value| value == nil }
    end
  end
end
