function Err = msr_error( o, out )

[N1, N2]=size(o);

Err=0.;   
N=sqrt(N1*N2);

for j=1:N1 
    for k=1:N2
        t=out(j,k)-o(j,k); 
        t=t/N; 
        Err=Err+t*t;	
    end
end

Err=sqrt(Err)/N;

end

