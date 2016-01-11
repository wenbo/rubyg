require 'narray'
m1 = NMatrix[[1,2],[3,4]]
m2 = NMatrix[[5.0,6.6], [7.2,8.9]]
v1 = NVector[3,4]
m1+m2 # => NMatrix.float(2,2): [[6.0, 8.6], [10.2, 12.9]]
m1*m2 # => NMatrix.float(2,2): [[19.4, 24.4], [43.8, 55.4]]
3*m1  # => NMatrix.int(2,2): [[3, 6], [9, 12]]
4*v1  # => NVector.int(2): [12, 16]
m1*v1 # => NVector.int(2): [11, 25]
