require 'optparse'
ARGV.replace %w[-a -bhoge --without-arg --with-arg=1 2]
params = OptionParser.getopts("ab:", "without-arg", "with-arg:")
params  # => {"a"=>true, "b"=>"hoge", "without-arg"=>true, "with-arg"=>"1"}
ARGV    # => ["2"]
