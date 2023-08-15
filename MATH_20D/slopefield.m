function slopefield(f,trange,yrange,density)
% slopefield(f, [tmin,tmax], [ymin,ymax], density)
%   
%   Plots the slope field (direction field) for the first order ODE
%       y' = f(t,y)
%   using t-values from tmin to tmax with spacing of (t2-t1)/density &
%   using y-values from ymin to ymax with spacing of (y2-y1)/density.
%
%   f is an @ function.
%   density is a positive number.
%
% Example: y' = (1 - t^2)*exp(y)
%   Show direction field for t in [-4,4], y in [-3,5],
%       with a slope mark whenever you travel across 1/20th of the region
%       in any direction.
%
%   f = @(t,y) (1 - t^2)*exp(y)
%   slopefield(f, [-4,4], [-3,5], 20)

dt = (trange(2) - trange(1))/density;
dy = (yrange(2) - yrange(1))/density;
tval = trange(1):dt:trange(2);
yval = yrange(1):dy:yrange(2);
[tm,ym]=meshgrid(tval,yval);
fv = vectorize(f);
if isa(f,'function_handle')
  fv = eval(fv);
end
yp=feval(fv,tm,ym); 
s = 1./max(1/dt,abs(yp)./dy)*0.38;
h = ishold;
quiver(tval,yval,s,s.*yp,0,'.','Color',[.57 .45 .81]); hold on;
quiver(tval,yval,-s,-s.*yp,0,'.','Color',[.57 .45 .81]);
if h
  hold on
else
  hold off
end
axis tight equal square