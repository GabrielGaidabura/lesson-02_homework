# 1) map
def map (array)

   for i in (0..(array.size-1))
      array[i] = yield array[i]
   end

   array
end

p (map [1,2,3]  do |x|
  x + 1
end)

# 2) select
def select (array)

   arrRez = Array.new(array.size)
   n = 0   

   for i in (0..(array.size-1))
      if (yield array[i]) == true
         arrRez[n] = array[i]
         n = n + 1
      end
   end   
   
   arrRez.compact
end

p (select [1,2,3,4,5,6] do |x| 
   x % 2 == 0 
end)

# 3) detect
def detect (array)
   rez = nil
   for i in (0..(array.size-1))
      if (yield array[i]) == true
         rez = array[i]
         break
      end
   end   
   rez
end

p (detect [1,2,3,4,5,6] do |x| 
   x % 2 == 0
end)

# 4) all?
def all? (array)
   counterOfFails = 0;
   for i in (0..(array.size-1))
      if (yield array[i]) == false
         counterOfFails = 1
         break
      end
   end  
 
   counterOfFails == 0
end

p (all? [1,2,3,4,5,6] do |x| 
   x < 7
end)

# 5) any?
def any? (array)
   counterOfTruth = 0;
   for i in (0..(array.size-1))
      if (yield array[i]) == true
         counterOfTruth = 1
         break
      end
   end   
   
   counterOfTruth > 0
end

p (any? [1,2,3,4,5,6] do |x| 
   x > 3
end)

# 6) count
def count (array)
   counter = 0;
   for i in (0..(array.size-1))
      if (yield array[i]) == true
         counter = counter + 1
      end
   end
   
   counter
end

p (count [1,2,3,4,5,6] do |x| 
   x > 0
end)

# 7) reduce
def reduce (array, arg)
   rez = arg
   for i in (0..(array.size-1))
      rez = yield rez, array[i]
   end
   
   rez
end

p (reduce ["a","b","c"],"asd" do |arg, x| 
   arg << x
end)

# 8) twoLargerNumbersOfThree
def twoLargerNumbersOfThree (a,b,c)
   
   if a >= b
      if b >= c
         a * a + b * b
      else
         a * a + c * c
      end
   else
      if a <= c
         b * b + c * c
      else
         a * a + b * b
      end
   end
end

p (twoLargerNumbersOfThree -4,2,2)

# 9) Fibonacci
def fibonacciNumbers (n)
   n1 = 1
   n2 = 1
   rez = 0
   if n > 2
      for i in (0..(n-3))
         rez = n1 + n2
         n1 = n2
         n2 = rez
      end
      rez
   else
      1
   end
    
end

p (fibonacciNumbers 9)