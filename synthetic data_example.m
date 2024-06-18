%% Compute the value K for synthetic noisy series
% Generate noise free series of the Logistic or Pomeau-Manneville map X of N samples,
% with a parameter lambda (or alpha), starting from a random initial 
% value x in [0,1]; 

N=10000;
lambda=3.5; %alpha=0.2 for Pomeau-Manneville map
x=rand(1,1);
phi_nn=Logistic_dyn(x,lambda,N,0*randn(1,N));
% phi_nn=Pomeau_dyn(x,lambda,N,0*randn(1,N)); % For the Pomeau-Manneville map

%Generate the Gaussian noise whose std is a percentage of the amplitude of
%the series
noise=0.02*peak2peak(phi_nn)*randn(size(phi_nn));

%Perturb the series with Dynamical noise
phi=Logistic_dyn(x,lambda,N,noise); %phi=Pomeau_dyn(x,lambda,N,noise) %for the Pomeau-Manneville map

%plot of the p-q phase space
[p,q]=compute_pq(phi);
scatter(p,q,'.','linewidth',2)

%compute the signal-to-noise ratio
beta=range(RR)/sigma;

%compute 

fmin=f-0.5; fmax=f+0.5;

%compute the value K
K=test(RR,beta,fmin,fmax);
