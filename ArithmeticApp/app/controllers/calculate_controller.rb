class CalculateController < ApplicationController
  def index
  end

  def calculate
    @num1 = params[:num1].to_f
    @num2 = params[:num2].to_f
    @operation = params[:operation]

    if @operation == '/' && @num2 == 0
      @result = "Error: Division by zero"
    else
      @result = case @operation
                when '+' then @num1 + @num2
                when '-' then @num1 - @num2
                when '*' then @num1 * @num2
                when '/' then @num1 / @num2
                else "Invalid operation"
                end
    end

    render :index
  end
end