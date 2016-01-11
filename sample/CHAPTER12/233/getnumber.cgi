#!/usr/local/bin/ruby -Ke
$SAFE=1        # CGIスクリプトではセーフレベルを1にしておくとよい
require 'cgi'  # cgiライブラリにCGIが定義されているので読み込む
# CGIオブジェクトを作成する
cgi = CGI.new
# EUC-JPなHTMLを出力する
cgi.out("type"=>"text/html", "charset"=>"EUC-JP") {
  # コントロール名に対応する値を得る
  number = cgi['number']
  name = cgi['name']
  "<html><head><title>結果</title></head><body>\n" +
    # numberに入力された値が数字のみであるならば(妥当性検査)、
    if number =~ /\A\d+\z/
      # 出力するHTML
      "名前:#{CGI.escapeHTML(name)}<br>" +
        "数字 = #{number}<br>" +
        "REQUEST_METHOD = #{ENV['REQUEST_METHOD']}"
    # 数字でないならばエラーメッセージにする
    else
      "数字が不正です。"
    end +
  "\n</body></html>"
}