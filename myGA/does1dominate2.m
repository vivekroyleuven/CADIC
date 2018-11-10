function result=does1dominate2(element1,element2,V,M)
    %1 dominates 2 if for every objective, element1 has a lesser or equal
    %to value as element 2
    %note that any element will dominate itself by definition
    %make sure in the comparison of the population you do not compare any
    %element to itself
    result=true;
    for i=V+1:V+M
        result=result & (element1(i)<=element2(i));
    end
end

