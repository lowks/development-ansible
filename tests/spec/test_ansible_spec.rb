require 'serverspec'

set :backend, :exec 

describe package('zsh') do
    it { should be_installed }
end

describe package('cock') do
    it { should be_installed }
end
