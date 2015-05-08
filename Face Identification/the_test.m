facetest=facedata(401:2429,:);
k=size(facetest);
testem=zeros(1,k(1));

count_face=0;
count_nonface=0;
for i=1:k(1)
    testem(i)=testit(w2,facetest(i,:)');
    if testem(i)>=.5
        count_face=count_face+1;
    else
        count_nonface=count_nonface+1;
        iterm(count_nonface)=i;
    end
end

count_face
count_nonface