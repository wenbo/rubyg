def abracadabra() 2 end

def foo
  unless @foo # !> instance variable @foo not initialized
    # ������
    @foo = abracadabra
  end
  @foo
end
foo

def bar
  @bar ||= begin
             # ������
             abracadabra
           end
end
bar

def baz
  @baz ||= lambda do
    # ������
    abracadabra
  end.call
end
baz
