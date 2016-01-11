module Net
  class HTTP
  end
  class FTP
  end
end
Net::HTTP.new # => #<Net::HTTP:0xb7b1797c>
Net::FTP.new  # => #<Net::FTP:0xb7b17760>
