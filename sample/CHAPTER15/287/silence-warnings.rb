require 'rubygems'
require 'active_support'
def f() 1 end
def f() 2 end # !> method redefined; discarding old f
# 「method redefined; discarding old g」と出てこない
silence_warnings do
  def g() 3 end
  def g() 4 end
end
