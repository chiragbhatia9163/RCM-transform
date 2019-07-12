tic
Ft=load('ftrain.mat');
Fs=load('ftest.mat');
c=1;
e=1;
l=1;
q=0;
for i=1:50
    a=0;
    for j=1:50
        q=q+1;
        disp(q);
        a=check(Fs.V(i,:),Ft.V(j,:));
        score(l)=a;
        l=l+1;
        if(i==j)
           g(c)=a;
           c=c+1;
       else
           im(e)=a;
           e=e+1;
        end
    end
end

me=min(score);
ma=max(score);

for i=1:50
    g(i)=1-(g(i)-me)/(ma-me);
end

for i=1:2450
%     im(i)=1-im(i);
    im(i)=1-(im(i)-me)/(ma-me);
end
[count, bins] = hist(g);
[count1, bins1] = hist(im);
count = smooth(count,'lowess');
count1 = smooth(count1,'lowess');
figure(1);
plot(bins,count/50*100,'-s',bins1,count1/2450*100,'-d','linewidth',2);
xlabel('Score');
ylabel('Normalized Frequency');
legend('Genuine Scores','Imposter Scores');
eer;
time = toc