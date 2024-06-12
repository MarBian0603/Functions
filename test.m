function K=test(RR,beta,fmin,fmax)
%RR is the signal
%beta is the signal-to-noise ratio
%[fmin, fmax] is the interval in which K is computed
N=length(RR);
ncut=N/10;
F=(fmax-fmin).*rand(100,1)+fmin;
lambda=2; miu=3;
g_beta=(ncut/10)*sqrt(lambda/(2*pi*(0.1*beta)^3))*exp(-lambda*((0.1*beta-miu)^2)/(2*miu^2*0.1*beta));
K_f=zeros(1,100);
parfor i=1:100
    f=F(i);
    [p,q]=compute_pq(RR,f);
    M=compute_M(RR,p,q);
    D=M-mean(RR)^2*(1-cos((1:ncut)*f))/(1-cos(f));
    Dstar=D+g_beta*mean(RR)^2*sin(sqrt(2)*(1:ncut));
    K_f(i)=corr((1:ncut)',Dstar');
end
K=median(K_f);
end
