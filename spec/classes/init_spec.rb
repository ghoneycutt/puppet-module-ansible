require 'spec_helper'
describe 'ansible' do
  context 'with default values for parameters' do
    it { should compile.with_all_deps }

    it do
      should contain_package('ansible').with({
        'ensure' => 'present',
        'name'   => 'ansible',
      })
    end
  end

  context 'with package_name set to valid string <package>' do
    let(:params) { { :package_name => 'package' } }
    it { should contain_package('ansible').with_name('package') }
  end

  describe 'variable type and content validations' do
    mandatory_params = {} if mandatory_params.nil?

    validations = {
      'string' => {
        :name    => %w[package_name],
        :valid   => %w[string],
        :invalid => [%w[array], { 'ha' => 'sh' }, 3, 2.42, true],
        :message => 'expects a String value',
      },
    }

    validations.sort.each do |type, var|
      var[:name].each do |var_name|
        var[:params] = {} if var[:params].nil?
        var[:valid].each do |valid|
          context "when #{var_name} (#{type}) is set to valid #{valid} (as #{valid.class})" do
            let(:params) { [mandatory_params, var[:params], { :"#{var_name}" => valid, }].reduce(:merge) }
            it { should compile }
          end
        end

        var[:invalid].each do |invalid|
          context "when #{var_name} (#{type}) is set to invalid #{invalid} (as #{invalid.class})" do
            let(:params) { [mandatory_params, var[:params], { :"#{var_name}" => invalid, }].reduce(:merge) }
            it { is_expected.to compile.and_raise_error(/#{var[:message]}/) }
          end
        end
      end # var[:name].each
    end # validations.sort.each
  end # describe 'variable type and content validations'
end
