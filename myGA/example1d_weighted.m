clear;
clf;
 
% Define boundaries and other paremeters
lb = zeros(1,6);
ub = ones(1,6);
V = length(ub);
M = 1;

% Choose benchmark; use 3 and 4 in this setup
bm = 3;

% Optimize to find pareto front 
Npoints = 10;
sp = linspace(0,1,Npoints+2)/Npoints;
sp = sp(2:end-1);
for i=1:Npoints
	data(i).population = myGA(@(x) benchmark1d(bm,x,1-sp(i),sp(i)),V,M,lb,ub);
end

% Plot found and actual solution
figure(2)
clf;
hold on
for i=1:Npoints
    i
	temp = benchmark2d(bm,data(i).population(:,1:V));
	plot(temp(:,1),temp(:,2),'*')
end

plot((.28*(bm==4):0.01:1),(bm==4)*(1-(.28*(bm==4):0.01:1).^2)+(bm==3)*(1-sqrt((.28*(bm==4):0.01:1)))) % plot of solution
hold off