function out2=f2_shift(out,LL)
    
[N M]=size(out);

out2=zeros(N,M);
for k=1:N
   i1=k+LL; 
   if i1>N 
       i1=i1-N; 
   end	
   if i1<=0 
       i1=N+i1; 
   end	
   for m=1:M
        j1=m+LL; 
        if j1>M 
            j1=j1-M; 
        end	
        if j1<=0 
            j1=M+j1; 
        end	
    out2(i1,j1)=out(k,m); 
   end     
end

end

