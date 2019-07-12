function value=codeimp(A,B1)
Y=load("500f.mat");
% Ft=load('ftrain.mat');
% Fs=load('ftest.mat');
% A=Fs.V(1,:,1);
A=transpose(A);
% B1=Ft.V(1,:,1);
B1=transpose(B1);
x = 2; %window size
y=1; %value of p taken
r=500; %number of rows taken
C = ones(r,x);
for i=1:y
D = zeros(r,x);
for k = 1:x
    D(:,k)= (Y.B(:,:,k)*A) ;
end

C = C.*D;
end
[~,I] = max(C,[],2);


C = ones(r,x);
for i=1:y 
D = zeros(r,x);
for k = 1:x
    D(:,k)= (Y.B(:,:,k)*B1) ;
end

C = C.*D;
end
[~,J] = max(C,[],2);
value=chisq(transpose(I),transpose(J));