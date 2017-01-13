# ask the user for the loan amount
# ask the user for the APR
# ask the user for loan duration
# perform the operation of the information given
# output the monthly payment

def prompt(message)
  Kernel.puts("=> #{message}")
end

prompt("Welcome to the Mortgage Calculator!")

loop do
  prompt("What's the amount of the loan?")
  loan_amt = ''
  loop do
    loan_amt = Kernel.gets().chomp()
    if loan_amt.empty?() || loan_amt.to_i() <= 0
      prompt('Please enter a positive loan amount')
    else
      break
    end
  end

  prompt("What's the APR of the loan? (%)?")

  loan_apr = ''
  loop do
    loan_apr = Kernel.gets().chomp()
    if loan_apr.empty?() || loan_apr.to_f < 0
      prompt('Please enter a valid percentage.')
    else
      break
    end
  end

  loan_dur = ''
  loop do
    prompt("What's the duration of the loan in years?")
    loan_dur = Kernel.gets().chomp()
    if loan_dur.empty?() || loan_dur.to_i <= 0
      prompt('Please enter a valid number of years')
    else
      break
    end
  end

  amount = loan_amt.to_f()
  int_rate = (loan_apr.to_f() / 100) / 12
  duration = loan_dur.to_i() * 12

  if int_rate == 0.0
    monthly_payment = amount / duration
  else
    monthly_payment = amount * (int_rate / (1 - (1 + int_rate)**-duration))
  end

  prompt("You're monthly payment will be $#{monthly_payment.round(2)}.")
  prompt("Do you want to another calcuation? (Y to continue)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the Mortgage Calculator.")
