%% Compute the value K for real time series
%upload a real time series
RR=load('name.txt');
N=length(RR);

%interpolation procedure
%tt=[1:length(RR)];
%tt_interp=[1:0.1:length(RR)];
%RR_interp=interp1(tt,RR,tt_interp);
%RR_interp=RR_interp(2:10:end);
%RR=RR_interp;

%plot of the p-q phase space
[p,q]=compute_pq(RR);
scatter(p,q,'.','linewidth',2)

%sigma estimation using the code at https://github.com/AndScar/noise_estimation
[sigma,~,~,~,~]=Noise_evaluation_fit_pp(RR,2,0.001,peak2peak(RR));

%compute the signal-to-noise ratio
beta=range(RR)/sigma;

%compute the value K
K=test(RR,beta,0.56,2.01);  %K in LF band
K=test(RR,beta,2.01,5.58);  %K in HF band
