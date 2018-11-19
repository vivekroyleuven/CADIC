function population=evaluatePopulation(population,f,V,M,lb,ub)
    population_denormalised=population;
    for i=1:length(population(:,1))
        for j=1:V
            population_denormalised(i,j)=lb(j)+population(i,j)*(ub(j)-lb(j));
        end
    end
    
    results=f(population_denormalised);
%     results=zeros(length(population(:,1),M));
%     for i=1:length(population(:,1))
%         results(i)=f(population_denormalised(i,:));
%     end
    population=[population results];
        
            
end
