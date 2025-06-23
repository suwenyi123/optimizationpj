function x_record=add_opt(max_k,c,b,R)
    p=3
    mi=10
    n=10
    arf=0.1
    I_p=eye(p)
    A_=[1/3,1/2,0,0,0,0,0,0,0,0;
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
    %行随机矩阵 收敛到同一点 列随机 非收敛到同一点
    A=kron(A_,I_p)
    x=rand([n*p,1])
    z=rand([n*p,1])
    w=g(c,b,z)
    y=ones([n,1])
    c=rand([n,mi,p]) 
    b = randi([0,1],n,mi).*2-1   

    %l_record=zeros([max_k,1])
    x_record=zeros([max_k,n,p])
    for k=1:max_k
        z0=z
        x=A*x-arf*w
        y=A_*y
        Y=kron(diag(y),I_p)
        z=inv(Y)*x
        w=A*w+g(c,b,z)-g(c,b,z0)
        %l_record(k,:)=add_opt_lo(c,b,x)
        x_record(k,:,:)=reshape(z,p,n)'
    end
end

