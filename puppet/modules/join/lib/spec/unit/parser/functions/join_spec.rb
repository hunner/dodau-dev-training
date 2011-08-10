require 'puppet'
describe Puppet::Parser::Functions.function(:join) do
  before :each do
    @scope = Puppet::Parser::Scope.new
  end

  it "should turn an array of items into a string" do
    @scope.function_join([['foo','bar','baz'], ':']).should == 'foo:bar:baz'
  end
  it "should fail if the correct arguments are not supplied" do
    expect { @scope.function_join([":"]) }.should raise_error \
      ArgumentError, /incorrect arguments/i
  end
end
