require 'spec_helper'
describe 'ansible' do
  context 'with default values for parameters' do
    it { should compile.with_all_deps }

    it {
      should contain_package('ansible').with({
        'ensure' => 'present',
        'name'   => 'ansible',
      })
    }
  end
end
