function x_record=extra(max_k,c,b,R)
    n = 10;
    p=3
    %graph
    aj=[1,0,0,0,1,1,1,0,0,1;
        0,1,1,1,1,0,1,0,1,0;
        0,1,1,1,1,0,0,0,0,1;
        0,1,1,1,0,0,1,1,1,0;
        1,1,1,0,1,1,1,1,1,1;
        1,0,0,0,1,1,1,1,0,0;
        1,1,0,1,1,1,1,0,1,0;
        0,0,0,1,1,1,0,1,0,0;
        0,1,0,1,1,0,1,0,1,0;
        1,0,1,0,1,0,0,0,0,1]
    aj = R
    a=0.1
    w=zeros([n,n])
    for i=1:n
        for j=1:n
            if aj(i,j)==1 && i~=j
                w(i,j)=a
            end
        end
    end
    for i =1:n
        w(i,i)=1-sum(w(i,:),2)
    end
    arf=0.12
    w_=(w+eye(n))/2
    x=rand([n*p,1])
    x_0=zeros([n*p,1])
    diff_1=add_opt_g(c,b,x)
    diff_0=add_opt_g(c,b,x_0)
    x_record=zeros([max_k,n,p])
    for k=1:max_k
        x=kron(eye(n)+w,eye(p))*x-kron(w_,eye(p))*x_0-arf*(diff_1-diff_0)
        diff_0=diff_1
        diff_1=add_opt_g(c,b,x)
        x_0=x
        x_record(k,:,:)=reshape(x,p,n)'
    end
end
