alist = [["one",1,"extra element"], ["two",2], ["three",3]]
# �������б�����ڥ������롣
alist.assoc("one")     # => ["one", 1, "extra element"]
# �������б������ͤ����롣
alist.assoc("one")[1]  # => 1
# �ͤ��б�����ڥ������롣
alist.rassoc(2)        # => ["two", 2]
# �ͤ��б����륭�������롣
alist.rassoc(2)[0]     # => "two"
