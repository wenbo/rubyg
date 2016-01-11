require 'kconv'
NKF.nkf("-Je", "=?ISO-2022-JP?B?GyRCJDMkcyRLJEEkTxsoQg==?=")  # => "こんにちは"
NKF.nkf("-Jem0", "=?ISO-2022-JP?B?GyRCJDMkcyRLJEEkTxsoQg==?=")
# => "=?ISO-2022-JP?B?GyRCJDMkcyRLJEEkTxsoQg==?="

NKF.nkf("-EjM", "こんにちは") # => "=?ISO-2022-JP?B?GyRCJDMkcyRLJEEkTxsoQg==?="
NKF.nkf("-j --mime", "こんにちは")
# => "=?ISO-2022-JP?B?GyRCJDMkcyRLJEEkTxsoQg==?="
NKF.nkf("-EjMB", "こんにちは")                # => "GyRCJDMkcyRLJEEkTxsoQg=="
NKF.nkf("-JemB", "GyRCJDMkcyRLJEEkTxsoQg==")  # => "こんにちは"
NKF.nkf("-j --base64", "こんにちは")          # => "GyRCJDMkcyRLJEEkTxsoQg=="
[NKF.nkf("-Ej", "こんにちは")].pack("m*")     # => "GyRCJDMkcyRLJEEkTxsoQg==\n"
NKF.nkf("-EjMQ", "こんにちは") # => "=1B=24B=243=24s=24K=24A=24O=1B=28B"
NKF.nkf("-JemQ", "=1B=24B=243=24s=24K=24A=24O=1B=28B") # => "こんにちは"


