function result=equally_dominant(element1,element2,V,M)
result=false; 
for i=V+1:M+V
     if(element2(i)>=element1(i))
         %clearly element2 cannot be dominating over element1
         result=true;
         break
     end
 end
end
