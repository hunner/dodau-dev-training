require 'puppet'
require 'fileutils'
require 'mocha'
RSpec.configure do |config|
    config.mock_with :mocha
end
provider_class = Puppet::Type.type(:rcsrepo).provider(:git)
describe provider_class do
  before :each do
    @test_dir = File.join('/tmp', Time.now.to_i.to_s, 'repo')
    @resource = Puppet::Type::Rcsrepo.new({:path => @test_dir})
    @provider = provider_class.new(@resource)
  end

  it 'should ensure that exists? does not find nonexisting repos' do
    @provider.exists?.should == false
  end

  it 'should call git init when no source is set' do
    @provider.expects(:git).with('--git-dir',@test_dir + '/.git', '--work-tree', @test_dir, 'init')
    @provider.create
  end

  it 'should stubbily call git clone when a source is set' do
    source = 'git://github.com/puppetlabs/puppet-lvm.git'
    @provider.resource[:source] = source
    @provider.expects(:git).with('clone',source, @test_dir)
    @provider.create
  end

  it 'should stubbily call rm -rf when destroying a repo' do
    #FileUtils.expects(:rm_rf).with(@test_dir)
    FileUtils.expects(:rm_rf).with(@provider.resource[:path])
    @provider.destroy
    FileUtils.unstub(:rm_rf)
  end

  it 'should call git clone when a source is set' do
    source = 'git://github.com/puppetlabs/puppet-lvm.git'
    @provider.resource[:source] = source
    @provider.create
    @provider.exists?.should == true
    @provider.destroy
  end

  it 'should be able to get a revision' do
    source = 'git://github.com/puppetlabs/puppet-lvm.git'
    @provider.resource[:source] = source
    @provider.create
    @provider.revision.should == 'd92be18d6f266f6ece70797a4c617e0536a3c8c3'
    @provider.destroy
  end

  it 'should be able to set a revision' do
    source = 'git://github.com/puppetlabs/puppet-lvm.git'
    @provider.resource[:source] = source
    @provider.resource[:revision] = '3a7129fae95a4b0c24d6a39568437d8accd938a1'
    @provider.create
    #@provider.revision = @provider.resource[:revision]
    @provider.revision.should == '3a7129fae95a4b0c24d6a39568437d8accd938a1'
  end

  #it 'should ensure that exists? finds existing repos'do
  #  @provider.create
  #  @provider.exists?.should == true # not when stubbed
  #end

  after :each do
    FileUtils.rm_rf(File.dirname(@test_dir))
  end
end
