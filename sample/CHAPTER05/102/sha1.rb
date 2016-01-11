require 'digest/sha1'            # アルゴリズム変更時は要修正
HashAlgorithm=Digest::SHA1       # アルゴリズムを可変にするために定数に代入
HashAlgorithm.hexdigest "hoge!"  # => "73d12fadce55b2e301e9c57eef10342b79633c03"
CRYPTED_PASSWORD = "73d12fadce55b2e301e9c57eef10342b79633c03"
def correct_password?(input)
  HashAlgorithm.hexdigest(input) == CRYPTED_PASSWORD
end
correct_password? "hoge!"        # => true
correct_password? "wrong"        # => false
