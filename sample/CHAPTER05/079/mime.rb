require 'kconv'
NKF.nkf("-Je", "=?ISO-2022-JP?B?GyRCJDMkcyRLJEEkTxsoQg==?=")  # => "����ˤ���"
NKF.nkf("-Jem0", "=?ISO-2022-JP?B?GyRCJDMkcyRLJEEkTxsoQg==?=")
# => "=?ISO-2022-JP?B?GyRCJDMkcyRLJEEkTxsoQg==?="

NKF.nkf("-EjM", "����ˤ���") # => "=?ISO-2022-JP?B?GyRCJDMkcyRLJEEkTxsoQg==?="
NKF.nkf("-j --mime", "����ˤ���")
# => "=?ISO-2022-JP?B?GyRCJDMkcyRLJEEkTxsoQg==?="
NKF.nkf("-EjMB", "����ˤ���")                # => "GyRCJDMkcyRLJEEkTxsoQg=="
NKF.nkf("-JemB", "GyRCJDMkcyRLJEEkTxsoQg==")  # => "����ˤ���"
NKF.nkf("-j --base64", "����ˤ���")          # => "GyRCJDMkcyRLJEEkTxsoQg=="
[NKF.nkf("-Ej", "����ˤ���")].pack("m*")     # => "GyRCJDMkcyRLJEEkTxsoQg==\n"
NKF.nkf("-EjMQ", "����ˤ���") # => "=1B=24B=243=24s=24K=24A=24O=1B=28B"
NKF.nkf("-JemQ", "=1B=24B=243=24s=24K=24A=24O=1B=28B") # => "����ˤ���"


