clear;
clf;

% Define boundaries and other paremeters
lb = [-5 -5]; 
ub = [5 5];
V = 2; % number of traits
M = 1; % number of objective

% Choose benchmark; use 1 and 2 in this setup
bm = 2;

% Use your implementation of GA
population = myGA(@(x) benchmark1d(bm,x),V,M,lb,ub);

% Show local and global optima of benchmark 2
if (bm==2)
	test_ShowFunction
end