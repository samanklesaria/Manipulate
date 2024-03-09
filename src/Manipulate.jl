module Manipulate
using Makie

export manipulate

function manipulate(f; args...)
  fig = Figure()
  nts = [(label=String(k), range=v) for (k,v) in args]
  sg = SliderGrid(fig[1,1], nts...)
  sliderobservables = [s.value for s in sg.sliders]
  ax = Axis(fig[2,1])
  f(sliderobservables...)
  onany(sliderobservables...) do val...
    reset_limits!(ax) 
  end
  fig
end


end # module Manipulate
