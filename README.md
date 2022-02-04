# Katas

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `katas` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:katas, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/katas](https://hexdocs.pm/katas).

# FizzBuzz
1st Kata
FizzBuzz is one of the most famous coding exercises for beginners. It is a simple exercise but an excellent one to start learning the TDD flow with.
Requirements
Write a “fizz_buzz/1” function that accepts a number as input and returns it as a String.
Notes:
start with the minimal failing solution
keep the three rules in mind and always write just sufficient enough code
do not forget to refactor your code after each passing test
write your assertions relating to the exact requirements
0 should return "0"
2. For multiples of three return “Fizz” instead of the number
3. For the multiples of five return “Buzz”
4. For numbers that are multiples of both three and five return “FizzBuzz”.


# Password Checker 

2nd Kata – Password validation
Create a function that can be used as a validator for a password.
The validation function takes a string as an input and returns a validation result. The validation result should contain a boolean indicating if the password is valid or not, and also a field with the possible validation errors.
Requirements
1. The password must be at least 8 characters long. If it is not met, then the following error message should be returned: “Password must be at least 8 characters”
2. The password must contain at least 2 numbers. If it is not met, then the following error message should be returned: “The password must contain at least 2 numbers”
3. The validation function should handle multiple validation errors.
For example, "somepassword" should an error message: "Password must be at least 8 characters\nThe password must contain at least 2 numbers"
4. The password must contain at least one capital letter. If it is not met, then the following error message should be returned: "password must contain at least one capital letter"
5. The password must contain at least one special character #$%&'()*+,-./:;<=>?@[\]^_{|}~`. If it is not met, then the following error message should be returned: “password must contain at least one special character

# Simple Calculator

3rd Kata
Create a simple calculator that takes a String and returns a integer
Calculator.add(numbers:String) -> Integer
Spec Requirements
1. The method can take up to two numbers, separated by commas, and will return their sum as a result.
Example: So the inputs can be: "". , or "1" , or "1,2".
For an empty string, it will return 0.
Notes:
start with the simplest case (empty string) and extend it with the more advanced cases ("1" and "1,2") step by step
keep the three rules in mind and always write just sufficient enough code
do not forget to refactor your code after each passing test
2. Allow the add function to handle an unknown number of arguments
3. Allow the add function to handle newlines as separators, instead of comas
"1,2\n3" should return "6"
"2,\n3" is invalid, but no need to clarify it with the program
4. Add validation to not to allow a separator at the end
For example "1,2," should return an error (or throw an exception
5. Allow the add method to handle different delimiters -> To change the delimiter, the beginning of the input will contain a separate line that looks like this:
  ```"[delimiter]\n[numbers]"```
  ```";\n1;3"``` should return 4
  ```"|\n1|2|3"``` should return 6
  "sep\n2s1e2p5" should return 10
  "|\n1|2,3" is invalid and should raise an error  with the message "'|' expected but ',' found at position 3"
6. Calling add with negative numbers will return the message "Negative number(s) not allowed: #{negative_number}"  where negative_number  is dynamic value (of the argument)
"1,-2" is invalid and should return the message "Negative number(s) not allowed: -2"
"2,-4,-9" is invalid and should return the message "Negative number(s) not allowed: -4, -9"
7. Calling add with multiple errors will return all error messages separated by newlines.
"//|\n1|2,-3" is invalid and return the message "Negative number(s) not allowed: -3\n'|’ expected but ',' found at position 3."
8. Numbers bigger than 1000 should be ignored, so adding 2 + 1001 = 2
References :
https://elixir-lang.org/getting-started/try-catch-and-rescue.html#errors

# City Find

Implement a city search functionality. The function takes a string (search text) as input and returns the found cities which corresponds to the search text.
Prerequisites
Create a collection of strings @cities that will act as a database or CSV for the city names with the separator \n.
City names:
Paris\nBudapest\nSkopje\nRotterdam\nValencia\nVancouver\nAmsterdam\nVienna\nSydney\nNew York City\nLondon\nBangkok\nHong Kong\nDubai\nRome\nIstanbul
Requirements
1. If the search text is fewer than 2 characters, then should return no results. (It is an optimization feature of the search function.)
2. If the search text is equal to or more than 2 characters, then it should return all the city names starting with the exact search text.
For example for search text "Va, the function should return Valencia and Vancouver
3. The search functionality should be case insensitive
4. The search functionality should work also when the search text is just a part of a city name
For example "ape" should return "Budapest" city
5. If the search text is a "*" (asterisk), then it should return all the city names.


