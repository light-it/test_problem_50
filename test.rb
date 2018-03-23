require 'prime'

def primes_for(n)
  sum = 0
  result = 0
  number_of_terms = 0
  primes = []
  primes_sum = [0]

  Prime.each do |prime|
    sum += prime
    break if prime > n

    primes << prime
    primes_sum << sum
  end

  primes_sum.each_index do |i|
    (i - (number_of_terms + 1)).downto(0).each do |j|
      number = primes_sum[i] - primes_sum[j]

      break if number > n

      if primes.include?(number)
        number_of_terms = i - j
        result = number
      end
    end
  end

  puts "largest prime: #{result}, number of terms: #{number_of_terms}"
end

puts "Enter integer value"
primes_for(gets.chomp.to_i)