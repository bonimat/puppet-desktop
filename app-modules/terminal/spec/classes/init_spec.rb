require 'spec_helper'
describe 'terminal' do
  context 'with default values for all parameters' do
    it { should contain_class('terminal') }
  end
end
