begin
  raise "raise a RuntimeError"
rescue                          # 例外を捕捉する
  $!  # => #<RuntimeError: raise a RuntimeError>
  raise                         # 捕捉した例外を再発生させる
end
# ~> -:2:in `<main>': raise a RuntimeError (RuntimeError)
