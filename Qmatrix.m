function Q=Qmatrix(Xz,M,G,D)
% function for calculating the matrix Q

d=length(D);

Q=zeros(G,M*d); 
for i=1:d
    Q(:,M*(i-1)+1:M*i)=Xz.^D(i); 
end