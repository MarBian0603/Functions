function M=compute_M(RR,p,q)
%RR is the signal
%p and q are the vectors computed by the function compute_pq(RR,f) 
N=length(RR);
ncut=floor(N/10);
M=zeros(1,ncut);
for n=1:ncut
  t=0;
  for j=1:(N-n)
     s=t+(p(j+n)-p(j))^2+(q(j+n)-q(j))^2;
     t=s;
  end
  M(n)=s/(N-n);
end
end
