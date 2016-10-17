class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================

    user_text = nil
    user_word = nil
    user_text = @text.downcase
    user_word = @special_word.downcase

    user_text_array = user_text.split(" ")

# @character_count_with_spaces = user_text_array
    @character_count_with_spaces = user_text.length

i = 0
total = 0
while i < user_text_array.count
  total = total + user_text_array[i].length
  i = i + 1
end

@character_count_without_spaces = total

    # @character_count_without_spaces = user_text.length - user_text.count(" ")
    @word_count = user_text_array.count
    @occurrences = user_text_array.count(user_word)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

    apr = @apr
    years = @years
    principal = @principal

    months = years*12
    rate = apr/1200

    user_payment = (principal*rate)*(1+rate)**months/((1+rate)**months-1)

    @monthly_payment = user_payment

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================


start_time = @starting
end_time = @ending
time_diff = end_time - start_time

    @seconds = time_diff
    @minutes = time_diff/60
    @hours = @minutes/60
    @days = @hours/24
    @weeks = @days/7
    @years = @days/365.25

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================


numbers = @numbers


    @sorted_numbers = numbers.sort

    @count = numbers.count

    @minimum = numbers.sort[0]

    @maximum = numbers.sort[numbers.count-1]

    @range = @maximum - @minimum

      leftover = numbers.count % 2
      if leftover == 1
        #remember this does INTEGER division!
      median = numbers[numbers.count / 2]

      elsif leftover == 0
      median = (numbers[numbers.count / 2 + 1 - 1] + numbers[numbers.count / 2 - 1])/2
      end



    @median = median

    # My summing code!!!!!

    x = 0
    sum = 0

    while x < numbers.count
      sum = sum + numbers[x]
      x = x+1
    end

    @sum = sum


    @mean = @sum/numbers.count

      variance_intermediate = numbers.map{|x| (x-@mean)**2}

      x = 0
      sum = 0

      while x < numbers.count
        sum = sum + variance_intermediate[x]
        x = x+1
      end

      variance = sum/(numbers.count)

    @variance = variance

    @standard_deviation = variance**(0.5)


    user_mode = 0
    last_highest = 0

    numbers.each do |i|
    if numbers.count(numbers[i]) > last_highest
      user_mode = numbers[i]
    end
  end


    @mode = user_mode

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
