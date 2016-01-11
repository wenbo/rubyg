require 'erb'
require 'erubis'
template = '1+1=<%=1+1 %>'
ERB.new(template).src
# => "_erbout = ''; _erbout.concat \"1+1=\"; _erbout.concat((1+1 ).to_s); _erbout"
Erubis::Eruby.new(template).src
# => "_buf = ''; _buf << '1+1='; _buf << (1+1 ).to_s;\n_buf.to_s\n"
