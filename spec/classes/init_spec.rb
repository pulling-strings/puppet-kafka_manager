require 'spec_helper'
describe 'kafka_manager' do

  context 'with defaults for all parameters' do
    it { should contain_class('kafka_manager') }
  end
end
