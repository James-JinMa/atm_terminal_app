# frozen_string_literal: true

# Automated Teller Machine
require 'io/console'
require 'colorize'

class ATM_views
  String.colors
  def welcome
    puts 'welcome to use your financial review app'.colorize(:light_yellow)
  end

  def password_input_message
    puts 'please enter your password:'
  end

  def password_input
    password = STDIN.noecho(&:gets).chomp # https://ruby-doc.org/stdlib-2.5.1/libdoc/io/console/rdoc/IO.html cover private message
  end

  def password_wrong_message(wrong_password)
    puts "Wrong password #{wrong_password}. 1.Try again 2.Exit"
  end

  def choice
    line_separator
    puts 'please choose your service 1.Withdraw 2.Deposit 3.Exit'
  end

  def password_wrong_message_choice
    choice_num = gets.chomp
  end

  def deposit_input_message
    puts 'please enter the money you want save: '
  end

  def deposit_input
    gets.chomp
  end

  def withdraw_input_message
    puts 'please enter the money you want spend: '
  end

  def withdraw_exceed
    puts 'Your withdraw more than you have, enter again'
  end

  def zero_save_message
    puts 'You can only deposit money, cause you have no money. 1.Deposit 2.Exit'
  end

  def withdraw_input
    gets.chomp
  end

  def wrong_message
    puts 'Invalid entry, please enter a number.'
  end

  def financial_review(saving)
    puts 'Your saving is:' + " #{saving}.".colorize(:light_cyan)
  end

  def farewell
    puts 'Thank you for using financial review app. See you!'
  end
end
