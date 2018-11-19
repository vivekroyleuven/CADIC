function sorted=sortPopulation(unsorted,V,M)


if M==1
   % To be written
   sorted=sortrows(unsorted,V+M);

else % Multi-objective case : non-domination sorting
    
    %% Ranking
    % To be written
    unsorted_buf=unsorted;
    unsorted=[unsorted zeros(length(unsorted(:,1)),1)]; % add an extra column for the rank
    sorted=[];
    N=zeros(length(unsorted(:,1)),1); % this is the vector where N(i) indicates the number of elements that dominate unsorted(:,:)
    sorted=[];
    front_counter=1; 
    front_set{front_counter}={};
    for i=1:length(unsorted(:,1))
        S{i}=[];
        for j=1:length(unsorted(:,1))
            if(i~=j)
                %don't compare the same element to each other as
                %element dominates itself by definition
                if(does1dominate2(unsorted(i,:),unsorted(j,:),V,M))
                    %this is the case where unsorted(i,:) dominates
                    %unsorted(j,:)
                    S{i}=[S{i} j]; %store the index of the citizen that dominates unsorted{i,:)
                else
                    %need to check whether unsorted(j,:) dominates
                    %unsorted(i,:)
                    if(does1dominate2(unsorted(j,:),unsorted(i,:),V,M))
                        N(i)=N(i)+1;
                    end
                end
            end
        end
        if(N(i)==0)
            % no individual dominates unsorted(i,:) and therefore N(i)
            % belongs to the first rank
            unsorted(i,V+M+1)=front_counter; %note that front counter here is 1
            sorted=[sorted;unsorted(i,:)];
            front_set{front_counter}=[front_set{front_counter} i];
        end
    end
    elements_in_current_front=cell2mat(front_set{front_counter});
    while(length(elements_in_current_front)>0)
        %extract the elements in the front, 'front_counter'
        elements_in_current_front=cell2mat(front_set{front_counter});
        %fprintf('Doing it for front set %d\n',front_counter);
        %fprintf('Number of elements in front set %d is %d\n\n',front_counter,length(elements_in_current_front));
        
        % for each individual in the current front
        i=1;
        front_set{front_counter+1}={}; %this is the set for storing the individuals for the {front_counter+1}th front
        while(i<=length(elements_in_current_front))
            
            %fprintf('Doing it for element %d in the front %d\n',i,front_counter);
            %At this point we need to find the list of all individuals
            %which were dominated by the 'i'th individual in elements_in_current_front
            Sp=S{elements_in_current_front(i)};
            
            %for each individual q in Sp (Sp is the set of individuals
            %dominated by p where p is a member of the front 'front_counter'
            k=1;
            for j=1:length(Sp)
                
                %lets extract the index in the actual population 
                unsorted_index=Sp(j);
                
                %domination count decreased by 1. This is because
                %individuals that dominated Sp(j) have already been moved
                %to the previous front and we are trying to find
                %individuals of the next front.
                N(unsorted_index)=N(unsorted_index)-1;
                if(N(unsorted_index)==0)
                    %fprintf('\t k==%d and putting it in %d\n',k,front_counter+1);
                    k=k+1;
                    %no individuals in the subsequent front would dominate q!
                    unsorted(unsorted_index,V+M+1)=front_counter+1;
                    front_set{front_counter+1}=[front_set{front_counter+1} unsorted_index];
                    sorted=[sorted;unsorted(unsorted_index,:)];
                end
            end
            i=i+1;
        end
        %increment the front_counter.
        %continue the while loop if there is element in the next front_set
        front_counter=front_counter+1;
        elements_in_current_front=cell2mat(front_set{front_counter});
    end
    if(length(sorted(:,1))~=length(unsorted(:,1)))
        printf('FATAL!')
    end
end


    %% Crowding Distance
    % To be written
    sorted=[sorted zeros(length(unsorted(:,1)),1)]; % add an extra column for the CD an initialize it to zero
    sorted_buf=[];
    sorted_front=[];
    front=[];
    anchor=0;
    for i=1:front_counter-1 %for every front
        front=sorted(anchor+1:anchor+length(front_set{i}),:);
        anchor=length(front_set{i});
        for j=1:M %for every objective funciton   
            sorted_front=sortrows(front,V+j); %sort based on the mth objective
            sorted_front(1,V+M+2)=inf; %set first and last element's CD to inf
            sorted_front(end,V+M+2)=inf;
            for k=2:anchor-1 
                sorted_front(k,V+M+2)=sorted_front(k,V+M+2)+(sorted_front(k+1,V+j)-sorted_front(k-1,V+j))/(sorted_front(end,V+j)-sorted_front(1,V+j));
            end %% assigning the crowding distance doubt about what fmax and fmin are (each front or global)
        end
        %the front is done time to add it
        sorted_buf=[sorted_buf;sorted_front];
        
    end
    sorted=sorted_buf;




end
    
            
            
                
            
    
        
    
    
    


