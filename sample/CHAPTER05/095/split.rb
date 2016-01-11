#!/usr/local/bin/ruby -Ke
# 空白文字で分割する。
" a b  c\t\r\nd ".split                   # => ["a", "b", "c", "d"]
" a b  c\t\r\nd ".split(/\s+/)            # => ["", "a", "b", "c", "d"]
# 特定の文字で分割する。
"rubikitch@ruby-lang.org".split(/@/)      # => ["rubikitch", "ruby-lang.org"]
# 文字列も指定できる。
"a+b+c".split("+")                        # => ["a", "b", "c"]
# パス名を各要素に分割する。ただし、Enumerable#dropはRuby 1.8.7以降。
"/usr/local/bin/ruby".split("/")          # => ["", "usr", "local", "bin", "ruby"]
"/usr/local/bin/ruby".split("/")[1..-1]   # => ["usr", "local", "bin", "ruby"]
"/usr/local/bin/ruby".split("/").drop(1)  # => ["usr", "local", "bin", "ruby"]
# 文字列を1文字ずつ分割するイディオム。
"[名前]".split(//)                        # => ["[", "名", "前", "]"]
",a,b,c,,d,".split(",")                   # => ["", "a", "b", "c", "", "d"]
# 分割数の限度を指示する。
",a,b,c,,d,".split(",",3)                 # => ["", "a", "b,c,,d,"]
# 末尾の空文字列も含む。
",a,b,c,,d,".split(",",-1)                # => ["", "a", "b", "c", "", "d", ""]
# URLのクエリを分離する。
"http://127.0.0.1/wiki?p=Foo".split("?", 2)  # => ["http://127.0.0.1/wiki", "p=Foo"]
"http://127.0.0.1/wiki".split("?", 2)        # => ["http://127.0.0.1/wiki"]
# ()付き正規表現を指定した場合は()の中も分割結果に含める。
"a+b-c*d".split(/([\+\-\*\/])/)  # => ["a", "+", "b", "-", "c", "*", "d"]
"a++b--".split(/([\+\-]){2}/)    # => ["a", "+", "b", "-"]
