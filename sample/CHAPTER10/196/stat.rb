File.read "abc.txt"     # => "abc\n"
# �ե����뤬¸�ߤ���Ȥ�true��
File.exist? "abc.txt"           # => true
# �ե�����ξ������䤹�뤿���File::Stat���֥������Ȥ����롣
s = File.stat "abc.txt"         # => #<File::Stat dev=0x302, ino=24776410, mode=0100644, nlink=1, uid=1001, gid=100, rdev=0x0, size=4, blksize=4096, blocks=8, atime=2008-10-05 11:27:45 +0900, mtime=2008-03-15 14:41:04 +0900, ctime=2009-10-05 08:06:42 +0900>
# ������File�Υ��饹�᥽�åɤȤ��ƻȤ��롣
# �ǽ������������
s.atime               # => 2008-10-05 11:27:45 +0900
# �ǽ������ѹ������Unix��OS�Ǥ�chmod�ʤ�i-node���ѹ��ˡ�
s.ctime               # => 2009-10-05 08:06:42 +0900
# �ǽ��������
s.mtime               # => 2008-03-15 14:41:04 +0900
# �ե�����Υ����ס���"file"��"directory"��"characterSpecial"��"blockSpecial"��
# "fifo"��"link"��"socket"��"unknown"�פΤɤ줫���֤���
s.ftype               # => "file"
# �ʲ���File�Υ��饹�᥽�åɤȤ��Ƥ�FileTest�Υ᥽�åɤȤ��Ƥ�Ȥ��롣
# �ǥ��쥯�ȥ�ΤȤ�true��
s.directory?          # => false
# �̾�Υե�����ΤȤ�true��
s.file?               # => true
# �ѥ��פΤȤ�true��
s.pipe?               # => false
# ����ܥ�å���󥯤ΤȤ�true��
s.symlink?            # => false
# �����åȤΤȤ�true��
s.socket?             # => false
# �֥�å����ڥ����ե�����ΤȤ�true��
s.blockdev?           # => false
# ����饯�����ڥ����ե�����ΤȤ�true��
s.chardev?            # => false
# �ɤ߹��߲�ǽ�ΤȤ�true��
s.readable?           # => true
# �¥桼�����¥��롼�פ��ɤ߹��߲�ǽ�ΤȤ�true��
s.readable_real?      # => true
# �񤭹��߲�ǽ�ΤȤ�true��
s.writable?           # => true
# �¥桼�����¥��롼�פǽ񤭹��߲�ǽ�ΤȤ�true��
s.writable_real?      # => true
# �¹Բ�ǽ�ΤȤ�true��
s.executable?         # => false
# �¥桼�����¥��롼�פǼ¹Բ�ǽ�ΤȤ�true��
s.executable_real?    # => false
# ��������0�Х��ȤΤȤ�true��
s.zero?               # => false
# �ե�����Υ��������֤���size?��0�Х��ȤΥե�������Ф��Ƥϵ����֤���
s.size?               # => 4
s.size                # => 4
# ��ʬ����ͭ�ԤǤ���Ȥ�true��
s.owned?              # => true
# ���롼��ID���¸����롼��ID���������Ȥ�true��
s.grpowned?           # => true
# setuid/setgid����Ƥ���Ȥ�true��
s.setuid?             # => false
s.setgid?             # => false
# sticky�ӥåȤ�Ω�äƤ���Ȥ�true��
s.sticky?             # => false
# File�Υ��饹�᥽�åɤϰ����˥ե�����̾����ꤹ�롣
File.file? "abc.txt"  # => true
