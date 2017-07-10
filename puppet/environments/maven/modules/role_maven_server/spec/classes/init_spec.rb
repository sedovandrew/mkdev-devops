require 'spec_helper'
describe 'role_maven_server' do
  context 'with default values for all parameters' do
    it { should contain_class('role_maven_server') }
  end
end
