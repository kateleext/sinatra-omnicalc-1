require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square_new)
end

get("square/new") do
  number = params.fetch("number").to_fs
  square = number ** 2
  @results = {"Number" => number, "Square" => square}
  erb(:results)
end

get("square_root/new") do
  number = params.fetch("number").to_fs
  square_root = number ** 0.5
  @results = {"Number" => number, "Square Root" => square_root}
  erb(:results)
end

get("payment/new") do
  @apr = params.fetch("apr").to_fs(:percentage,{:precision => 4})
  @years = params.fetch("years").to_fs
end

get(":operation/results") do
  
end
