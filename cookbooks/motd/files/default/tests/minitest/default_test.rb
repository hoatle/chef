require 'minitest/spec'

describle_recipe 'motd::default' do
  it 'create motd.tail' do
    file('/etc/motd.tail').must_exist
  end
end