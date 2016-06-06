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
	describe file("/opt/miniconda2/bin/conda") do
	    it { should exist }
	    it { should be_executable }
	end

	describe file("/home/lowks/Projects") do
	    it { should exist }
	    it { should be_owned_by "lowks" }
	end

	describe file("/home/lowks/.vim/bundle/Vundle.vim") do
	    it { should exist }
	    it { should be_owned_by "lowks" }
	end
    
	describe file("/home/lowks/.zshrc") do
	    it { should exist }
	    it { should be_symlink }
	    it { should be_linked_to '/home/lowks/.zprezto/runcoms/zshrc' }
	end

	describe file("/home/lowks/.emacs.d") do
	    it { should exist }
	    it { should be_owned_by "lowks" }
	end

end

describe "Group that should exist" do
	describe group('docker') do
	    it { should exist }
	end
end

describe ppa('ppa:nilarimogard/webupd8') do
	it { should be_enabled }
end

describe ppa('ppa:aacebedo/fasd') do
	it { should be_enabled }
end

describe "Files should contain strings" do
    describe file("/home/lowks/.zshrc") do
        it { should contain "export PATH=$HOME/miniconda/bin/:$PATH" }
    end

end
