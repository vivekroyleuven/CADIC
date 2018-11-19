function selection=selectionTournament(population,NP,V,M)
    % selection=population(1:int32(NP/2),:);
    index=1:1:length(population(:,1));
    selection=zeros(NP,V+M);
    for i=1:NP
        ab_size=datasample(index,2,'Replace',false);
        a=ab_size(1);
        b=ab_size(2);
        if(population(a,V+M+1)<population(b,V+M+1))
            selection(i,:)=population(a,1:V+M);
        elseif(population(a,V+M+1)>population(b,V+M+1))
            selection(i,:)=population(b,1:V+M);
        elseif(population(a,V+M+1)==population(b,V+M+1))
            if(population(a,V+M+2)<population(b,V+M+2))
                selection(i,:)=population(b,1:V+M);
            else
                selection(i,:)=population(a,1:V+M);
            end
        end
    end
end
