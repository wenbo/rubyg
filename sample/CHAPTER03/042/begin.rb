def begin_test(sym)
  flow = []                     # �����ή���ɽ�����󡣡�<<�פ��ͤ��ɲä��롣
  value = begin
            case sym            # �����ͤ˱����ƾ��ʬ��
            when :normal          then flow << "OK"
            when :argument_err    then raise ArgumentError
            when :not_implemented then raise NotImplementedError
            when :runtime_err     then raise RuntimeError
            end
            :begin
          rescue => e           # �ڤ��㳰
            flow << "normal rescue"     
            :rescue
          rescue NotImplementedError => e # NotImplementedError�Τ�
            flow << "NotImplementedError" 
            :rescue_NotImplementedError
          rescue Exception      # ���٤Ƥ��㳰����ª���뤬��
            flow << "Exception" # ���rescue���ɾ�����������̤�ʤ�
            :exception
          else                  # �㳰�������ʤ��ä����
            flow << "no error"
            :else
          ensure                # ɬ����ã����
            flow << "ensure"
            :ensure
          end
  flow << "outer"
  # :flow�������ή���:value��begin�����֤��ͤ�ɽ��
  {:flow => flow, :value => value}
end

# :flow���ͤ������ή���:value���ͤ�begin�����֤��ͤ�ɽ��
begin_test :normal # => {:flow=>["OK", "no error", "ensure", "outer"], :value=>:else}
begin_test :argument_err # => {:flow=>["normal rescue", "ensure", "outer"], :value=>:rescue}
begin_test :not_implemented # => {:flow=>["NotImplementedError", "ensure", "outer"], :value=>:rescue_NotImplementedError}
begin_test :runtime_err # => {:flow=>["normal rescue", "ensure", "outer"], :value=>:rescue}
