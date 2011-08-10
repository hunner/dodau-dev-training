# vim: sw=2 sts=2 et tw=80 :
#
# Add to $HOME/.vimrc:
# nmap <F8> :!rspec --color %<CR>
require 'puppet'
require 'puppet/type/rcsrepo'
describe Puppet::Type.type(:rcsrepo) do
  before :each do
    @rcsrepo = Puppet::Type.type(:rcsrepo).new(:path => '/tmp/foo')
  end

  it 'should be ensurable' do
    @rcsrepo[:ensure] = 'present'
    @rcsrepo[:ensure].should == :present
    @rcsrepo[:ensure] = 'absent'
    @rcsrepo[:ensure].should == :absent
    expect { @rcsrepo[:ensure] = 'latest' }.should \
      raise_error Puppet::Error, /ensure failed/
  end

  it 'should not accept an invalid path' do
    expect { @rcsrepo[:path] = 'tmp/foo' }.should \
      raise_error(Puppet::Error, /Path is not an absolute path/)
  end

  it 'should accept a valid source' do
    @rcsrepo[:source] = 'http://foo'
    @rcsrepo[:source].should == 'http://foo'

    @rcsrepo[:source] = 'https://foo'
    @rcsrepo[:source].should == 'https://foo'

    # Add in later after the provider
    #@rcsrepo[:source] = 'git://foo'
    #@rcsrepo[:source].should == 'git://foo'
  end

  it 'should not accept whitespace in a revision' do
    expect { @rcsrepo[:revision] = '1234 5678' }.should \
      raise_error(Puppet::Error, /Valid values match/)
  end

  it 'should not accept an invalid source' do
    expect { @rcsrepo[:source] = '//foo' }.should \
      raise_error(Puppet::Error, /Source is not a http\(s\) or git URL/)
  end
end

