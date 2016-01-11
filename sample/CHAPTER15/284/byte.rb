require 'rubygems'
require 'active_support'
# 1KiB ��1024�Х��ȡ�
1.kilobyte                  # => 1024
# 2MiB��12KiB��­����2109440�Х��ȡ�
2.megabytes + 12.kilobytes  # => 2109440
# 1,000,000,000�Х��Ȥ���0.93GiB��
10**9 / 1.0.gigabyte        # => 0.931322574615479
# 500,000,000,000�Х��Ȥ�465GiB���˲᤮�ʤ���
500*10**9 / 1.0.gigabyte    # => 465.661287307739
