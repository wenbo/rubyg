def abracadabra() 2 end

def foo
  unless @foo # !> instance variable @foo not initialized
    # 処理…
    @foo = abracadabra
  end
  @foo
end
foo

def bar
  @bar ||= begin
             # 処理…
             abracadabra
           end
end
bar

def baz
  @baz ||= lambda do
    # 処理…
    abracadabra
  end.call
end
baz
