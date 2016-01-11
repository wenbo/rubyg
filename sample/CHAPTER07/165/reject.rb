#!/usr/local/bin/ruby -Ke
PASS_MARK = 65                  # �����������
STATS = [["Ted", 77], ["Bob", 55], ["Meg", 61], ["Andy", 99]] # ����ɽ������������ɽ��
# �Թ�ʼԤ�̾������������롣��reject�ץ᥽�åɤΥ֥�å��ˤϹ�ʾ���񤯤��Ȥ��ݥ���ȡ�����դˤ��ơ�select�פ���Ѥ��Ƥ�褤����reject�פη�̤�̾��������������ˤʤ�Τǡ�̾�����������뤿���((:Enumerable#map:))����Ѥ��롣
not_passed = STATS.reject{|name, score| score >= PASS_MARK }.map{|name,| name}
# ����ɽ���������Ʒ��ȯɽ��puts�ؿ����������ꤹ��ȳ����Ǥ��Ȥ˲��Ԥ���롣Array#join��̾����̾���δ֤ˡ֡��פ��������롣
print "����Υƥ��Ȥη�̤�", STATS.map{|name, score| "#{name}: #{score}��"}.join("��")
print "�Ǥ���\n�Թ�ʼԤ�#{not_passed.join '��'}�Ǥ���\n"
# >> ����Υƥ��Ȥη�̤�Ted: 77����Bob: 55����Meg: 61����Andy: 99���Ǥ���
# >> �Թ�ʼԤ�Bob��Meg�Ǥ���
