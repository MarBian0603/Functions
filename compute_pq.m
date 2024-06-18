function [p,q]=compute_pq(phi,f)
% This function computes the vector p and the vector q.
% The function takes as inputs:
% phi - the signal
% f - the frequency
N=length(phi);
p=zeros(1,N);
q=zeros(1,N);
p(1)=phi(1)*cos(f);
q(1)=phi(1)*sin(f);
for i=2:N
    p(i)=p(i-1)+phi(i)*cos(f*i);
    q(i)=q(i-1)+phi(i)*sin(f*i);
end
end
