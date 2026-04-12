class ConverterController < ApplicationController
    def convert
        amount = params[:amount].to_f
        from  = params[:from]
        to = params[:to]

        base = {
            "USD" => 1.0,
            "EUR" => 0.92,
            "INR" => 83,
            "GBP" => 0.73
        }

        if !base[to] || !base[from]
            render json: { error: "invalid currency type" }, status: 422
            return 
        end
        usd = amount / base[from]
        converted = usd * base[to]

        render json: {
            from: from,
            to: to,
            original: amount,
            converted: converted.round(2)
        }
    end

end
