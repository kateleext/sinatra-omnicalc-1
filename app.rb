require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square_new)
end

get("/:operation/new") do
  @operation = params.fetch("operation")
  if @operation == "square"
    erb(:square_form)
  elsif @operation == "square_root"
    erb(:square_root_form)
  elsif @operation == "payment"
    erb(:payment_form)
  elsif @operation == "random"
    erb(:random_form)
  end
end

get("/:operation/results") do
  @operation = params.fetch("operation")
  if @operation == "square"
    number = params.fetch("number").to_f
    square = number ** 2
    @results = {"Number" => number, "Square" => square}
    @instruction = "Calculate another square"
    erb(:results)

  elsif @operation == "square_root"
    number = params.fetch("number").to_f
    square_root = number ** 0.5
    @results = {"Number" => number, "Square Root" => square_root}
    @instruction = "Calculate another square root"
    erb(:results)

  elsif @operation == "payment"
    apr = params.fetch("apr").to_f
    p = params.fetch("principal").to_f
    years = params.fetch("years").to_i

    #calculate monthly payment
    r = (apr/12)/100
    n = years*12
    payment = p*(r*(1+r)**n)/((1+r)**n-1)
    @results = {"APR" => apr.to_fs(:percentage,{:precision => 4}), "Number of Years" => years, "Principal" => p.to_fs(:currency), "Monthly Payment" => payment.to_fs(:currency)}
    @instruction = "Calculate another payment"
    erb(:results)

  elsif @operation == "random"
    min = params.fetch("min").to_f
    max = params.fetch("max").to_f
    random = rand(min..max)
    @results = {"Minimum" => min, "Maximum" => max, "Random Number" => random}
    @instruction = "Pick another random number"
    erb(:results)

  end
end
