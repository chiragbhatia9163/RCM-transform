r=1000;
m=19008;
x=2;
B = zeros(r,m); 
for j=1:x
    D=eye(r,m);
    D = D(randperm(r),randperm(m));
    B(:,:,j) = D;
end
save("1000ff.mat","B");