# fileutils�饤�֥���FileUtils���������Ƥ���Τ��ɤ߹���
require 'fileutils'
abcd = File.read "abcd.txt"
efgh = File.read "efgh.txt"
# �ǥ��쥯�ȥ�d1/d2��쵤�˺������롣
FileUtils.mkdir_p "d1/d2"
# abcd.txt��efgh.txt��d1/d2�إ��ԡ����롣
FileUtils.cp %w[abcd.txt efgh.txt], "d1/d2"
# ���Ƥ�Ʊ���ʤΤǳΤ��˥��ԡ����줿��
abcd == File.read("d1/d2/abcd.txt") # => true
efgh == File.read("d1/d2/efgh.txt") # => true
# �ǥ��쥯�ȥ�d1��ݤ��Ⱥ�����롣
FileUtils.rm_rf "d1"
# d1��¸�ߤ��ʤ��ΤǳΤ��˺�����줿��
File.exist? "d1"                    # => false
