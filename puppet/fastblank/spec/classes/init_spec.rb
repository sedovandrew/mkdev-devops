require 'spec_helper'
describe 'fastblank' do
  context 'with default values for all parameters' do
    it { should contain_class('fastblank') }
  end
end
