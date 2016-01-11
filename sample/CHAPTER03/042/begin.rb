def begin_test(sym)
  flow = []                     # 制御の流れを表す配列。「<<」で値を追加する。
  value = begin
            case sym            # 入力値に応じて場合分け
            when :normal          then flow << "OK"
            when :argument_err    then raise ArgumentError
            when :not_implemented then raise NotImplementedError
            when :runtime_err     then raise RuntimeError
            end
            :begin
          rescue => e           # 軽い例外
            flow << "normal rescue"     
            :rescue
          rescue NotImplementedError => e # NotImplementedErrorのみ
            flow << "NotImplementedError" 
            :rescue_NotImplementedError
          rescue Exception      # すべての例外を捕捉するが、
            flow << "Exception" # 上のrescue節を評価した場合は通らない
            :exception
          else                  # 例外が起きなかった場合
            flow << "no error"
            :else
          ensure                # 必ず到達する
            flow << "ensure"
            :ensure
          end
  flow << "outer"
  # :flowは制御の流れを、:valueはbegin式の返り値を表す
  {:flow => flow, :value => value}
end

# :flowの値が制御の流れを、:valueの値がbegin式の返り値を表す
begin_test :normal # => {:flow=>["OK", "no error", "ensure", "outer"], :value=>:else}
begin_test :argument_err # => {:flow=>["normal rescue", "ensure", "outer"], :value=>:rescue}
begin_test :not_implemented # => {:flow=>["NotImplementedError", "ensure", "outer"], :value=>:rescue_NotImplementedError}
begin_test :runtime_err # => {:flow=>["normal rescue", "ensure", "outer"], :value=>:rescue}
