require 'uri'
isbn=URI("URN:ISBN:0-123456-78-9")
# => #<URI::Generic:0x82f431c URL:URN:ISBN:0-123456-78-9>
[ isbn.scheme, isbn.opaque ]  # => ["URN", "ISBN:0-123456-78-9"]
