function [sigma,beta,K]=main(RR,fmin,fmax)
%RR is the signal
%[fmin, fmax] is the interval in which K is computed
%interpolation procedure
tt=[1:length(RR)];
tt_interp=[1:0.1:length(RR)];
RR_interp=interp1(tt,RR,tt_interp);
RR_interp=RR_interp(2:10:end);
RR=RR_interp;

%sigma estimation using the code at https://github.com/AndScar/noise_estimation
[sigma,~,~,~,~]=Noise_evaluation_fit_pp(RR,2,0.001,peak2peak(RR));

beta=range(RR)/sigma;

K=test(RR,beta,fmin,fmax);
end
