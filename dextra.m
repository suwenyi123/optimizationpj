function z_record=dextra(max_k,c,b,R)
    n = 10;
    p=3
    mi=10
    %graph
    A=[1/3,1/2,0,0,0,0,0,0,0,0;
        1/3,1/2 ,1/3,0,0,0,0,0,0,0;
        0,0,1/3,0,0,0,1/3,0,0,0;
        1/3,0,0,1/3,1/3,0,0,1/3,0,0;
        0,0,0,1/3,1/3,0,0,0,0,0;
        0,0,0,0,1/3,1/2,1/3,0,0,0;
        0,0,1/3,0,0,1/2,1/3,0,0,1/3;
        0,0,0,1/3,0,0,0,1/3,0,0;
        0,0,0,0,0,0,0,1/3,1/2,1/3;
        0,0,0,0,0,0,0,0,1/2,1/3]
    A = R
    A_=(A+eye(n))/2
    arf=0.02
    x=rand([n*p,1])
    x_0=zeros([n*p,1])
    y=ones(n)'
    diff_0=zeros([n*p,1])
    z_record=zeros([max_k,n,p])
    for k=1:max_k
        D=diag(diag(y))
        z=kron(inv(D),eye(p))*x
        diff_1=g(c,b,z)
        x=x+kron(A,eye(p))*x-kron(A_,eye(p))*x_0-arf*(diff_1-diff_0)
        y=A*y
        diff_0=diff_1
        x_0=x
        z_record(k,:,:)=reshape(z,p,n)'
    end
end