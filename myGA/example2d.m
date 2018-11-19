clear;
clf;

% Define boundaries and other paremeters
V = 6;
M = 2;
lb = zeros(1,V);
ub = ones(1,V);

% Choose benchmark; use 3 and 4 in this setup
bm = 3;

population = myGA(@(x) benchmark2d(bm,x),V,M,lb,ub);

% Plot solution
hold on
plot((.28*(bm==4):0.01:1),(bm==4)*(1-(.28*(bm==4):0.01:1).^2)+(bm==3)*(1-sqrt((.28*(bm==4):0.01:1)))) % plot of solution
hold off