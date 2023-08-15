%%problem 8
f1 = @(x) 1/(2*((2*x +.5))^2+1);
f2 = @(x) 2*sec(4*x)^2;

%% x0 = 0;

f1a = zeros(1,100);
f1a(1) = 0;
for i = 2:1:(length(f1a))
   f1a(i) = f1(f1a(i-1));
end
% stops differentiationg by 10^-5 at n = 40

f2a = zeros(1,100);
f2a(1) = 0;
for i = 2:1:(length(f2a))
   f2a(i) = f2(f2a(i-1));
end

%% x0 = 2
f1b = zeros(1,100);
f1b(1) = 2;
for i = 2:1:(length(f1b))
   f1b(i) = f1(f1a(i-1));
end
% stops differentiationg by 10^-5 at n = 40

f2b = zeros(1,100);
f2b(1) = 2;
for i = 2:1:(length(f2b))
   f2b(i) = f2(f2b(i-1));
end

%% x0 = 1000
f1c = zeros(1,100);
f1c(1) = 1000;
for i = 2:1:(length(f1c))
   f1c(i) = f1(f1c(i-1));
end
% stops differentiationg by 10^-5 at n = 40

f2c = zeros(1,100);
f2c(1) = 1000;
for i = 2:1:(length(f2c))
   f2c(i) = f2(f2c(i-1));
end
