require 'rubygems'

$:.unshift(File.dirname(__FILE__))
require 's3b/uri'

module S3b
  VERSION = "0.2.1"
  class Runner
    def initialize(args) 
      @args = args
      check_args
      execute
    end

    def execute
      @args.each do |arg|
        puts "Argument passed: #{arg}"
      end
    end

    private
    def check_args
      $stderr.puts "Must have atleast one argument" unless @args[0]
    end
  end
end

