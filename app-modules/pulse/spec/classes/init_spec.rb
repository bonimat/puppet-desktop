require 'spec_helper'
describe 'pulse' do
  context 'with default values for all parameters' do
    it { should contain_class('pulse') }
  end
end
