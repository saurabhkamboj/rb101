# Building a Mortgage Calculator

## Problem

Goal - Build a mortgage calculator

Input:

- the loan amount
- the Annual percentage rate (APR)
- the loan duration (in Months)

Output:

- monthly interest rate = `(APR/12)`
- monthly payment = `m = p * (j / (1 - (1 + j)**(-n))) where`

m = monthly payment\
p = loan amount\
j = monthly interest rate\
n = loan duration in months

## Data structures

Possible input

- Loan amount: Whole number with a special character (Currency symbol or ',' or both) - to_i removes the currency symbol
- Annual percentage rate: Whole number or a decimal with a special character (%) or a string that contains 'percent' - to_i and to
-f remove the string
- Loan duration (in Months): Integer

Required input

- Loan amount: Integer
- Annual percentage rate: Float
- Loan duration: Integer

Output

- Monthly interest rate: Float
- Monthly payment: Float

## Algorithm

- Get the loan amount
  - Convert the input into the required case
  - Validate the converted input, if not valid, as again
- Get Annual Percentage Rate (APR)
  - Convert the input into the required case
  - Validate the converted input, if not valid, as again
- Get loan duration in months
  - Validate the converted input, if not valid, as again

- Convert APR into monthly interest rate

### To convert and validate the input loan amount

- To remove ',' we can write a method that substitutes ','
  - If the input contains ','
    - then substitute ',' and remove empty space(s)
  - Else only remove empty spaces

- Method to validate the input loan amount _Same for all except APR, need to validate float as well_
  - valid_loan_amount = converted input loan amount
  - valid_loan_amount.to_i.to_s = valid_loan_amount

### To convert and validate the input annual percentage rate

- To remove '%' we can write a method that substitutes '%'
  - If the input contains'%'
    - then substitute '%' and remove empty space(s)
  - Else only remove empty space(s)

- Calculate monthly payment
- Display result
- Ask if user wants to perform another calculation

## Prompts

- Title `title:`
- Loan amount `ask_loan_amount:`
- Annual percentage rate `ask_annual_percent_rate:`
- Loan duration in months `ask_loan_duration:`
- Invalid value `invalid_value:`
- Calculating `calculating:`
- Result `result:`
- Calculate again `calculate_again:`
- Thank you `thank_you:`
