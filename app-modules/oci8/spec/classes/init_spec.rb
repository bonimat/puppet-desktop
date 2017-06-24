require 'spec_helper'
describe 'oci8' do
  context 'with default values for all parameters' do
    it { should contain_class('oci8') }
  end
end
