require 'cgi'
module Escape
  def url_escape()  CGI.escape(self) end
end
"<a>".extend(Escape).url_escape  # => "%3Ca%3E"
