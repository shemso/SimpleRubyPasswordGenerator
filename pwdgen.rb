#!/usr/bin/env ruby
require './lib/passwordgenerator.rb'
require 'optparse'
Pwd = PasswordGenerator.new
options = {:size=>12,:type=>"base64"}
OptionParser.new do |opts|
  opts.banner = "Usage: pwdgen.rb [options]"

  opts.on("-s SIZE", "--[no-]size", "Password size") do |s|
    options[:size] = s
  end
  opts.on("-t TYPE", "--[no-]type", "Password type [hex|base64|random_bytes]") do |t|
  	if Pwd.allowed_types.include?(t)
    	options[:type] = t
    else 
    	puts "Password type  [hex|base64|random_bytes]\n"
    	exit
    end
  end
end.parse!

Pwd.echo_password(options[:size],options[:type])
