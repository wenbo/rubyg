str = "Summary"
# ��Summary�פ�3�󷫤��֤���
str * 3             # => "SummarySummarySummary"
# 10�ĤΡ�=�פ�������롣
"=" * 10            # => "=========="
# ��Summary�פμ����3�ĤΡ�=�פ��դ��롣
"="*3 + str + "="*3 # => "===Summary==="
# �����狼�äƤ������String#center��padding�����ꤹ��Ȥ褤��
str.center(9, "=")  # => "=Summary="
