require 'digest/sha1'            # ���르�ꥺ���ѹ������׽���
HashAlgorithm=Digest::SHA1       # ���르�ꥺ�����Ѥˤ��뤿������������
HashAlgorithm.hexdigest "hoge!"  # => "73d12fadce55b2e301e9c57eef10342b79633c03"
CRYPTED_PASSWORD = "73d12fadce55b2e301e9c57eef10342b79633c03"
def correct_password?(input)
  HashAlgorithm.hexdigest(input) == CRYPTED_PASSWORD
end
correct_password? "hoge!"        # => true
correct_password? "wrong"        # => false
