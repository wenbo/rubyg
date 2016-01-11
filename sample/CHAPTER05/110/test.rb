require 'erubis'
class Test
  filename = "test.rtxt"
  erubis = Erubis::Eruby.new File.read(filename)
  erubis.def_method self, "hoge(hoge)", filename
end
Test.new.hoge(3)
# ~> test.rtxt:3:in `hoge': undefined local variable or method `hage' for #<Test:0x8187c7c> (NameError)
# ~> 	from -:7:in `<main>'
