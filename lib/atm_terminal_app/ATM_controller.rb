# frozen_string_literal: true

# ** ATM **
# dispense money(model)
# respond to user choice(controller)
# display balance(view)
# retrieve balance(view)
# prompt for user input(view)
# respond to invalid password(controller)
require_relative 'ATM_model.rb'
require_relative 'ATM_views.rb'


class ATM_controller
  def initialize
    @model = ATM_model.new
    @view = ATM_views.new
    @model.password
    @model.deposit(deposit: 500) # default money set to "500"
  end

  def run
    @view.welcome
    @view.password_input_message
    while (password = @view.password_input) != @model.password
      @view.password_wrong_message(password)
      until %w[1 2].include?(choice_num = @view.password_wrong_message_choice) # shortcut to make an array %w (%w &%W) https://stackoverflow.com/questions/8997130/what-is-the-difference-between-w-and-w
        @view.wrong_message
        @view.password_wrong_message(password)
      end
      if choice_num.to_i == 2
        return @view.farewell
      else
        @view.password_input_message
      end
    end
    @view.financial_review(@model.balance)
    @view.choice
    selection = valid_selection(1, 2, 3)

    loop do
      case selection
      when 1
        @view.withdraw_input_message
        # if enter number over your saving re-entry.
        while (spend = valid_data(@view.withdraw_input)) > @model.balance
          @view.withdraw_exceed
        end
        @view.financial_review(@model.withdraw(withdraw: spend))
        if @model.balance == 0
          @view.zero_save_message
          zero_save_selection = valid_selection(1, 2)
          selection = if zero_save_selection == 1
                        2
                      else
                        3
                      end
        else
          @view.choice
          selection = valid_selection(1, 2, 3)
          end
      when 2
        @view.deposit_input_message
        save = valid_data(@view.deposit_input)
        @view.financial_review(@model.deposit(deposit: save))
        @view.choice
        selection = valid_selection(1, 2, 3)
      # save = valid_data(@view.deposit_input)
      # @view.financial_review(@model.deposit(deposit:save))
      # selection = valid_selection(1,2,3)
      else
        return @view.farewell
      end
    end
  end

  def valid_selection(*choices) # validation of user selection number.
    # accept an undetermined number of arguments, or just some optional ones. http://codeloveandboards.com/blog/2014/02/05/ruby-and-method-arguments/
    loop do
      selection = gets.chomp
      if choices.to_s.include?(selection)
        return selection.to_i
        puts 'Invalid choice number, please re-enter'
      end
    end
  end

  def valid_data(data) # check if the input data is a valid number.
    loop do
      if data.to_i.to_s == data
        return data.to_i
      elsif data.to_f.to_s == data
        return data.to_f
      else
        puts "You didn't enter a number, please enter again!"
      end

      puts 'Enter the amount of the money: '
      data = gets.chomp
    end
  end
end

ATM_test = ATM_controller.new
ATM_test.run
