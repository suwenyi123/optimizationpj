function x_record=AB(max_k,c,b,R)
    n=10
    p=3
    mi=10
    aj=[1,1,0,0,0,0,0,0,0,0;
        1,1,1,0,0,0,0,0,0,0;
        0,0,1,0,0,0,1,0,0,0;
        1,0,0,1,1,0,0,1,0,0;
        0,0,0,1,1,0,0,0,0,0;
        0,0,0,0,1,1,1,0,0,0;
        0,0,1,0,0,1,1,0,0,1;
        0,0,0,1,0,0,0,1,0,0;
        0,0,0,0,0,0,0,1,1,1;
        0,0,0,0,0,0,0,0,1,1]
    aj=R
    A_=Trow(aj)
    B_=Tcol(aj)

    I_p=eye(p)
    A=kron(A_,I_p)
    B=kron(B_,I_p)
    x=rand([n*p,1])
    y=g(c,b,x)
    yita=0.02
    x_record=zeros([max_k,n,p])
    for k = 1:max_k
        x_0=x
        x=A*x-yita*y
        y=B*(y+g(c,b,x)-g(c,b,x_0))
        x_record(k,:,:)=reshape(x,p,n)'
    end
end
