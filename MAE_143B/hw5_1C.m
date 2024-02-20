syms s c b J t

tf = (c/J)/(s*(s + b/J))

unit_response_ilaplace = ilaplace((1/s)*tf)

slope = diff(unit_response_ilaplace,t)
