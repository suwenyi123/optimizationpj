function x_record=dngt(max_k,c,b,aj)
    n=10
    p=3
    mi=10
    
     R=[0.5,0,0,0,0,0,0,0.5,0,0;
        0.5,0.5,0,0,0,0,0,0,0,0;
        0,0.5,0.5,0,0,0,0,0,0,0;
        0,0,1/3,1/3,0,0,1/3,0,0,0;
        1/3,0,0,0,1/3,1/3,0,0,0,0;
       0,0,0,0,1/3,1/3,1/3,0,0,0;
       0,0,0,1/3,0,1/3,1/3,0,0,0;
       0,0,0,0,0,0,0,0.5,0.5,0;
       0,0,0,0,0,0,0,0,0.5,0.5;
       0,0,0,0.5,0,0,0,0,0,0.5]
     R = aj
    S=eye(n)
    S_0=eye(n)
    %rng(42)
    x=rand([n,p])
    x_0=zeros([n,p])
    x_1=x
    y_0=rand([n,p])
    y=y_0
    D_beta=eye(n)*0.006
    D_af=eye(n)*0.002
    z=g_v(c,b,y_0)
    x_record=zeros([max_k,n,p])
    for k =1:max_k
        x=R*y+D_beta*(x_1-x_0)-D_af*z
        y=x+D_beta*(x-x_1)
        S=R*S
        z=R*z+inv(diag(diag(S)))*g_v(c,b,y)-inv(diag(diag(S_0)))*g_v(c,b,y_0)
        S_0=S
        y_0=y
        x_0=x_1
        x_1=x
        x_record(k,:,:)=x
    end
end



