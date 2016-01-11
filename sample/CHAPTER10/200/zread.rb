# zlibライブラリにZlibが定義されているので読み込む
require 'zlib'
# 無圧縮・圧縮ファイルの読み書きの比較
open("uncompressed.txt", "w") {|f| f.puts "uncompressed" }
# 書き込み後にgzip圧縮する。
Zlib::GzipWriter.open("compressed.txt.gz") {|gz| gz.puts "compressed"}
open("uncompressed.txt") {|f| f.read }                     # => "uncompressed\n"
# gzip圧縮のファイルを読み込む。
Zlib::GzipReader.open("compressed.txt.gz") {|gz| gz.read } # => "compressed\n"

# gzip透過のファイル読み込みメソッドFile.zreadを定義する。
Zlib::GZIP_MAGIC = "\x1F\x8B"   # gzipファイルの先頭2バイト
# Ruby 1.9だとエンコーディングを指定しないと動作しない。
Zlib::GZIP_MAGIC.force_encoding("ASCII-8BIT") if RUBY_VERSION >= "1.9"
def File.zread(file)
# File.openよりもopenの方が汎用性が高いので後者を使いたい。この時点でselfがFileなのでopen関数を呼ぶにはObjectクラスの文脈にする必要がある。
  Object.module_eval do
    open(file) do |f|           # Kernel#openが呼ばれる
# ファイルの先頭2バイトを読み込み、ファイルポインタを先頭に戻す。
      magic = f.read(2)
      f.rewind
      if magic == Zlib::GZIP_MAGIC # gzipファイルであることの判定
# fをZlib::GzipReaderでくるみ、解凍された内容を読み込む。
        Zlib::GzipReader.wrap(f) {|gz| gz.read }
      else
# gzipファイルではない場合はそのままファイルを読み込む。
        f.read
      end
    end
  end    
end
# このように圧縮ファイルも無圧縮ファイルも同じように扱える。
File.zread "uncompressed.txt"  # => "uncompressed\n"
File.zread "compressed.txt.gz" # => "compressed\n"
# 内部でopen関数を使っているのでopen-uriを使うとURLを読み込むこともできる。
require 'open-uri'
File.zread("http://www.ruby-lang.org/en/")[0,20] # => "<!DOCTYPE html PUBLI"
