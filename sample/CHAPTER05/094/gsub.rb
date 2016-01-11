# �ǽ�Ρ�small�פΤߤ��big�פ��ִ����롣
"small cat, small dog".sub(/small/, 'big')    # => "big cat, small dog"
# ���ƤΡ�small�פ��big�פ��ִ����롣
"small cat, small dog".gsub(/small/, 'big')   # => "big cat, big dog"
# ��\&�ס���$&�פϥޥå�������ʬ��
'small big'.gsub(/[a-z]+/, '{\&}')            # => "{small} {big}"
'small big'.gsub(/[a-z]+/) { $&.capitalize }  # => "Small Big"
# ʸ���� '+' ��ѥ�����ˤ���ȡ� '+' ���֤������оݤˤʤ롣
'3+2'.sub(/\+/, '-')                          # => "3-2"
'3+2'.sub('+', '-')                           # => "3-2"
# HTML��B���Ǥ�EM���Ǥ��ִ�������
html = '<b>Big</b>, <b>Huge</b>'
# �ִ�ʸ������Ǥϡ��ǽ�γ�̤˥ޥå�������ʬ���\1�פǻ��ꤹ�롣
html.gsub(%r!<b>(.+?)</b>!, '<em>\1</em>')    # => "<em>Big</em>, <em>Huge</em>"
html.gsub(%r!<b>([^>]+)</b>!, '<em>\1</em>')  # => "<em>Big</em>, <em>Huge</em>"
# �ޥå�������ʬ��֥�å�ɾ����̤��֤������롣
html.gsub(%r!<b>(.+?)</b>!) {"<em>#$1</em>"}  # => "<em>Big</em>, <em>Huge</em>"
