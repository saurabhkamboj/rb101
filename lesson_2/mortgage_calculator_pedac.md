=begin
> User innput
- Get the loan amount

  - Make sure it is valid, otherwise, ask again
  - Convert the user input into the required case
- Get Annual Percentage Rate (APR)
  - Make sure it is valid, otherwise, ask again
  - Convert the user input into the required case
- Get loan duration in months
  - Make sure it is valid, otherwise, ask again

- Convert the APR percentage into decimals
  - Calculate monthly interest rate
- Calculate monthly payment
- Display result
- Ask if user wants to do another calculation

> Loan amount -- Convert the user input into the required case

- If the amount only has integers then true
- Else interate over the string and 

- Calculate monthly payment
- Display result
- Ask if user wants to do another calculation
=end

# Problem

Goal - Build a mortgage calculator

Input:

- the loan amount
- the Annual percentage rate (APR)
- the loan duration (in Months)

Output:

- monthly interest rate = `(APR/12)`
- monthly payment = `m = p * (j / (1 - (1 + j)**(-n))) where`

m = monthly payment
p = loan amount
j = monthly interest rate
n = loan duration in months

# Data structures

Possible input

- Loan amount: Whole number with a special character (Currency symbol) or commas or both. (to_i)
- Annual percentage rate: Whole number or a decimal with a special character (%) or a string that contains 'percent'
- Loan duration (in Months): Integer

Required input

- Loan amount: Integer
- Annual percentage rate: Float
- Loan duration: Integer

Output

- Monthly interest rate: Float
- Monthly payment: Float

# Algorithm

- Get the loan amount
  - Convert the input into the required case
  - Validate the converted input
- Get Annual Percentage Rate (APR)
- Get loan duration in months

- Convert APR into monthly interest rate
- Calculate monthly payment

---

## To convert and validate the input loan amount

- To remove ',' we can write a method that substitutes ','
  - If the input contains','
    - then substitute ','
  - Else do not change anything

- Method to validate the input loan amount
  - valid_loan_amount = converted input loan amount
  - valid_loan_amount.to_i.to_s = valid_loan_amount

## To convert and validate the input annual percentage rate

Whole number or a decimal with a special character (%) or a string that contains 'percent' converts to Float

- To remove '%' or 'percent' we can write a method that retrieves '.' and whole numbers. Update > I just checked on irb, using to_f method on a string that contains '%' or 'percent' returns decimals only.
