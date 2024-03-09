using GLMakie
using Revise
using Manipulate

singleton(x) = [x]

function f(x,y)
  scatter!(lift(singleton, x), lift(singleton, y))
end

manipulate(f; x=0:10, y=5:8)
