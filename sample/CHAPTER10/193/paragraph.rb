require 'stringio'
text = StringIO.new <<EOT
StringIOは
IOを真似した文字列クラス。

だからこの場合は
IOそのものと思ってくれ。

これはふたつの改行を区切りにした例だ。
EOT
text.gets("\n\n")               # => "StringIOは\nIOを真似した文字列クラス。\n\n"
text.gets("\n\n").chomp("\n\n") # => "だからこの場合は\nIOそのものと思ってくれ。"
text.gets("\n\n")               # => "これはふたつの改行を区切りにした例だ。\n"
text.rewind                     # ファイルポインタを最初に戻す。
text.readlines("\n\n")
# => ["StringIOは\nIOを真似した文字列クラス。\n\n",
#     "だからこの場合は\nIOそのものと思ってくれ。\n\n",
#     "これはふたつの改行を区切りにした例だ。\n"]
