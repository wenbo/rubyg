class Archiver            # アーカイブファイルを扱うクラス
  def initialize(archive_file)
    @archive = archive_file
# アーカイブファイルの拡張子に応じてextractメソッドを選択する。
    case archive_file
    when /\.tar\.gz$/, /\.tgz$/ then extend TarGz
    when /\.lzh$/               then extend LHA
    end
  end
# .tar.gz / .tgz 用展開コマンド。
  module TarGz
    def extract() "tar xzf #@archive"  end
  end
# .lzh 用展開コマンド。
  module LHA
    def extract() "lha x #@archive"    end
  end
end
# 拡張子に応じて別のextractメソッドが実行される。
Archiver.new("foo.tgz").extract # => "tar xzf foo.tgz"
Archiver.new("bar.lzh").extract # => "lha x bar.lzh"
