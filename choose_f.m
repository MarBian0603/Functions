function f=choose_f(freq,p)
% This function computes the normalized frequency corresponding 
% to the smallest magnitude greater than zero
% The function takes as inputs:
% freq - the vector of frequencies
% p - the corresponding PSD values

A=[freq' p'];
ind=find(p'<0.01);
A(ind,:)=[];
k=min(find(A(:,1)>0.7));   
k1=min(find(A(:,1)>0.5));
B=A(1+k:length(A)-k,:);
[~, i_m1]=min(B(:,2)); 
i_m=i_m1+k;  
mr=mean(A(1:length(A),2))+std(A(1:length(A),2));  
if length(find(A(:,2)>mr))>length(A)/10
    f=A(i_m,1);
else
j=1;
while j<k1
if max(A(i_m-j:i_m+j,2))>mr
    B(i_m1,2)=mr;
   [~, i_m1]=min(B(:,2));
   i_m=i_m1+k;
   j=1;
else
    j=j+1;
end
end
f=A(i_m,1);
end
end