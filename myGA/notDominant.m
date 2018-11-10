function nonDominance=notDominant(element1,element2,V,M)
nonDominance=false; 
for i=V+1:M+V
     if(element1(i)>element2(i))
         nonDominance=true;
         break
     end
 end
end
