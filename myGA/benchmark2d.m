function f=benchmark2d(nb,x)
% Benchmark functions in two dimensions
% nb : number of the function (see below).
% x : vector of variables.

[N,V] = size(x);
f = zeros(N,2);

switch nb
	case 3 % ZDT4
	    f(:,1)=x(:,1);
		g=(1+10*(V-1))*ones(N,1);
		for i=2:V
		    g=g+(x(:,i)).^2-10*cos(4*pi*x(:,i));
		end
		f(:,2)=g.*(1-sqrt(x(:,1)./g));
        
    case 4 % ZDT6
        g = 1 + 9 * (sum(x(:,2:V),2)/(V-1)).^0.25;
        f(:,1) = 1 - exp(-4*x(:,1)) .* sin(6*pi*x(:,1)).^6;
        f(:,2) =  (1 - (f(:,1)./g).^2);
end

end
