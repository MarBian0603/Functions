function [p,q]=compute_pq(RR,f)
%RR is the signal
%f is the frequency
N=length(RR);
p=zeros(1,N);
q=zeros(1,N);
p(1)=RR(1)*cos(f);
q(1)=RR(1)*sin(f);
for i=2:N
    p(i)=p(i-1)+RR(i)*cos(f*i);
    q(i)=q(i-1)+RR(i)*sin(f*i);
end
end