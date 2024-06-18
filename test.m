function K=test(phi,beta,fmin,fmax)
% This function computes the value K.
% The function takes as inputs:
% phi - the signal
% beta - the signal-to-noise ratio
% fmin and fmax - the extreme values of the interval in which K is computed

N=length(phi);
ncut=floor(N/10);
F=(fmax-fmin).*rand(100,1)+fmin;
lambda=2; miu=3;
g_beta=(ncut/10)*sqrt(lambda/(2*pi*(0.1*beta)^3))*exp(-lambda*((0.1*beta-miu)^2)/(2*miu^2*0.1*beta));
K_f=zeros(1,100);
for i=1:100
    f=F(i);
    [p,q]=compute_pq(phi,f);
    M=compute_M(phi,p,q);
    D=M-mean(phi)^2*(1-cos((1:ncut)*f))/(1-cos(f));
    Dstar=D+g_beta*mean(phi)^2*sin(sqrt(2)*(1:ncut));
    K_f(i)=corr((1:ncut)',Dstar');
end
K=median(K_f);
end
