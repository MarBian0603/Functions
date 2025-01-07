%% Compute the value K for synthetic noisy series
% Generate noise free series of the Logistic or Pomeau-Manneville map X of N samples,
% with a parameter lambda (or gamma), starting from a random initial 
% value x in [0,1]; 

fs=50; %sampling frequency
t=[0:1/fs:200];    
N=length(t);
lambda=3.5; %gamma=0.2 for the Pomeau-Manneville map
x=rand(1,1);
phi_nn=Logistic_dyn(x,lambda,N,0*randn(1,N));
% phi_nn=Pomeau_dyn(x,gamma,N,0*randn(1,N)); % For the Pomeau-Manneville map

% Generate the Gaussian noise whose std is a percentage of the amplitude of
% the series
sigma=0.02;
sd=sigma*peak2peak(phi_nn);
noise=sd*randn(size(phi_nn));

% Perturb the series with Dynamical noise
phi=Logistic_dyn(x,lambda,N,noise); %phi=Pomeau_dyn(x,gamma,N,noise) %for the Pomeau-Manneville map

% plot of the p-q phase space
[p,q]=compute_pq(phi,1);
scatter(p,q,'.','linewidth',2)

% compute the signal-to-noise ratio
beta=range(phi)/sd;

% compute the frequency band
freq=linspace(0,fs/2,(N+1)/2)*4*pi/fs;
F=fft(phi-mean(phi));
p2=abs(F);
p1=p2(1:(N+1)/2);
f=choose_f(freq,p1);
fmin=f-0.5; fmax=f+0.5;

% compute the value K
K=test(phi,beta,fmin,fmax);
