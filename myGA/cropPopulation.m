function new=cropPopulation(old,nb)
    if(length(old(:,1))>=nb)
        new=old(1:nb,:);
    else
        new=old;
    end
    

end
