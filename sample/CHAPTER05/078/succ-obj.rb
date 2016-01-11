("memo01.txt" .. "memo03.txt").select {|fn| File.size(fn) >= 20 } rescue $!
# => #<Errno::ENOENT: No such file or directory - memo01.txu>
"memo01.txt".succ   # => "memo01.txu"

module SuccNumber
  def succ() sub(/\A(.*)(\d+)(.*)\z/) { "#$1#{$2.succ}#$3" }.extend(SuccNumber) end
end
def file(filename) filename.extend(SuccNumber) end
file("memo01.txt").succ         # => "memo02.txt"
file("memo01.txt").succ.succ    # => "memo03.txt"
File.size "memo02.txt"          # => 24
(file("memo01.txt") .. file("memo03.txt")).select {|fn| File.size(fn) >= 20 }
# => ["memo02.txt"]
