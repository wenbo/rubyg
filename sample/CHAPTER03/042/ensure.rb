begin
  file = open("ensure.rb")
  content = file.read
ensure
  file.close
end
