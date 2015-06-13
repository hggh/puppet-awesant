require 'spec_helper'
describe 'awesant' do

  context 'with defaults for all parameters' do
    it { should contain_class('awesant') }
  end
end
