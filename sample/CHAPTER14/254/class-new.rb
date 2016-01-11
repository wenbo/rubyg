class Class
  def new(*args, &block)
    obj = allocate
    obj.__send__ :initialize, *args, &block
    obj
  end
end
