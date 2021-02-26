require "benchmark" 
require "bigdecimal/util"

d = 3.to_d 
e = BigDecimal("3")
f = Float(3)
g = BigDecimal("3").to_d

# This report shows the user CPU time, system CPU time, the sum of the user and system CPU times, and the elapsed real time. 
# The unit of time is seconds.
time_decimal = Benchmark.measure{ (1..10000000).each { |i| d * d } } 
time_bench = Benchmark.measure{ (1..10000000).each { |i| e * e } } 
time_float = Benchmark.measure{ (1..10000000).each { |i| f * f } } 
time_bench_d = Benchmark.measure{ (1..10000000).each { |i| g * g } }

puts time_decimal 
puts time_bench 
puts time_float 
puts time_bench_d 
