class Writer
  def write_book(book, content)  book.__send__(:content=, content)  end
end
class Book
  attr_reader :name
  attr_accessor :content
  private :content=
end
b = Book.new
w = Writer.new
w.write_book b, "I love Ruby!"
b  # => #<Book:0x83954d8 @content="I love Ruby!">
