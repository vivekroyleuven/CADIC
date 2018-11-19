function children=geneticOperators(parents,NC,P,V,M,f,lb,ub)

%    PS=size(parents,1);
    NC_r=int32(P*NC);
    NC_m=NC-NC_r;
    index=1:1:length(parents(:,1));
    children=zeros(NC,V);
    for i=1:NC_r
        a=datasample(index,2,'Replace',false);
        for j=1:V
            children(i,j)=datasample([parents(a(1),j),parents(a(2),j)],1);
        end
    end
    these_parents=zeros(2,V);
    for j=NC_r+1:NC
        alpha_row=rand(1,2)/2;
        a=datasample(index,2,'Replace',false);
        these_parents=[parents(a(1),1:V) ; parents(a(2),1:V) ];
        children(j,1:V)=alpha_row*these_parents; 
    end
    children_denormalised=children;
    for i=1:NC
        for j=1:V
            children_denormalised(i,j)=lb(j)+children(i,j)*(ub(j)-lb(j));
        end
    end
    results=f(children_denormalised);
    children=[children results];
end
