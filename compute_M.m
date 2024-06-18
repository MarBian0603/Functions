function M=compute_M(phi,p,q)
% This function computes the mean square displacement M.
% The function takes as inputs:
% phi - the signal
% p and q - the vectors computed by the function compute_pq(phi,f) 
N=length(phi);
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
