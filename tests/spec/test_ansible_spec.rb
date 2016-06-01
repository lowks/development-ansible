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
