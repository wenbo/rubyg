begin
  raise "raise a RuntimeError"
rescue                          # �㳰����ª����
  $!  # => #<RuntimeError: raise a RuntimeError>
  raise                         # ��ª�����㳰���ȯ��������
end
# ~> -:2:in `<main>': raise a RuntimeError (RuntimeError)
