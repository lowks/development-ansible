require 'serverspec'

set :backend, :exec 

packages = ["zsh", "git", "albert", "fasd"] 

describe "Make sure base packages installed" do
	
	packages.each do |base|
	   describe package(base) do
	      it { should be_installed }
	   end
	end

end

describe "path should exist" do
	describe path("/opt/miniconda2/bin/conda") do
	    it { should exist }
	    it { should be_executable }
	end
end
