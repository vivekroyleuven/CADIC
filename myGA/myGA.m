function population=myGA(f,V,M,lb,ub)
% myGA(f,V,M,lb,ub)
% f : function to minimize
% V : Dimension of the search space.
% sM : Number of objectives.
% lb = lower bound vector.
% ub = upper bound vector. 

%% DEFINITION OF THE PARAMETERS

N=100;    % Population size
NP=60;    % Size of the mating pool
NC=30;    % Number of children generated by generation
P=0.5;     % probability of recombination

verbose=1;

%% GENETIC ALGORITHM

% Generation of the intial population
population=initPopulation(N,V);
population=evaluatePopulation(population,f,V,M,lb,ub);

population=sortPopulation(population,V,M);
% clip the population to avoid passing the rank!
%population=population(:,1:V+M);

% Main loop

it=1;
while stopCriterion(it)

    parents=selectionTournament(population,NP,V,M);	
    % clip the population to avoid passing the rank!
    
    offspring=geneticOperators(parents,NC,P,V,M,f,lb,ub);
    
    population = [ population(:,1:V+M) ; offspring(:,1:V+M) ];
    
    population=sortPopulation(population,V,M);
    
 
    population=cropPopulation(population,N);

    % Visualization
    if verbose
        illustratePopulation(population,V,M,lb,ub,it);
        drawnow;
        pause(0.005);
    end
        
    it=it+1;
end


end
