def lambda_return
  # lambda������֤���
  lambda { return :return_from_lambda }.call # => :return_from_lambda
  return :return_from_method
end
def proc_return
  # �᥽�åɤ���ȴ����
  Proc.new { return :return_from_Proc_new }.call # => 
  return :return_from_method
end
lambda_return  # => :return_from_method
proc_return    # => :return_from_Proc_new
