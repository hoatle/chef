require 'chefspec'

describe 'motd::default' do
    let (:chef_run) { ChefSpec::ChefRunner.new.converge 'motd::default' }
    it 'should do create a motd file with the company name' do
        Chef::Recipe.any_instance.stub(:data_bag_item).with('global-properties', 'company').
        and_return({'id' => 'company', 'name' => 'Teracy, Inc'})
        expect(chef_run).to create_file_with_content('/etc/motd.tail',
            'This server is the Property of Teracy, Inc')
    end
end
