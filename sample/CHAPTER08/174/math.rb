# sin 0����롣
Math.sin(0)     # => 0.0
# Math�⥸�塼��򥤥󥯥롼�ɤ��뤳�Ȥǿ��شؿ����ؿ��Ȥ��ƻȤ���褦�ˤʤ롣���Ѵؿ��γ��٤�ñ�̤ϥ饸����Ǥ��롣
include Math
cos(PI)         # => -1.0

# �٢����饸�����Ѵ�
# ���٢��饸������Ѵ���Ԥ���Numeric#deg�פ�������롣
class Numeric
  def deg
    self * Math::PI / 180.0
  end
end
# �֥饸�����١��Ѵ���Ԥ��ؿ���Kernel#deg�פ�������롣
def deg(rad)
  rad * 180.0 / Math::PI
end
# 60�٤�饸������Ѵ����롣
60.deg          # => 1.0471975511966
# �ٻ���ǻ��Ѵؿ���Ȥ���
cos(60.deg)     # => 0.5
sin(30.deg)     # => 0.5
cos(180.deg)    # => -1.0
# asin(0.5)���٤ǵ��롣
deg(asin(0.5))  # => 30.0
