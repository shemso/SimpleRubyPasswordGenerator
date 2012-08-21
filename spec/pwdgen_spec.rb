require "./lib/passwordgenerator.rb"

describe PasswordGenerator do

	it "should be long 12 charactes" do
		pwd = PasswordGenerator.new.generate()
		pwd.size.should==12
	end
	
	it "should be long 8 charactes" do
		pwd = PasswordGenerator.new.generate(8)
		pwd.size.should==8
	end

	it "should be long 100 charactes" do
		# options = {:size=>100,:type=>'hex'}
		pwd = PasswordGenerator.new.generate(100,"hex")
		pwd.size.should==100
	end

	it "should be error" do
		pwd = PasswordGenerator.new.generate(100,"IdontExists")
		pwd.should=="Unknown password type"
	end
end