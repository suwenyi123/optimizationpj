function x_record=ABN(max_k,c,b,R)
    p=3
    mi=10
    n=10
    aj=R
%     aj=[1,1,0,0,0,0,0,0,0,0;
%         1,1,1,0,0,0,0,0,0,0;
%         0,0,1,0,0,0,1,0,0,0;
%         1,0,0,1,1,0,0,1,0,0;
%         0,0,0,1,1,0,0,0,0,0;
%         0,0,0,0,1,1,1,0,0,0;
%         0,0,1,0,0,1,1,0,0,1;
%         0,0,0,1,0,0,0,1,0,0;
%         0,0,0,0,0,0,0,1,1,1;
%         0,0,0,0,0,0,0,0,1,1]
    A_=Trow(aj)
    B_=Tcol(aj)
    I_p=eye(p)
    A=kron(A_,I_p)
    B=kron(B_,I_p)
    [vs,d]=eig(B_)
    v=vs(:,1)
    V=kron(diag(v),I_p)
    arf=0.04
    beta=0.08
    x=rand([n*p,1])
    y=x
    s=g(c,b,x)
    diff_1=g(c,b,x)
    x_record=zeros([max_k,n,p])
   
    for k = 1:max_k
        %beta=k/(k+3)
        y_0=y
        diff_0=diff_1
        y=A*x-arf*V*s
        x=y+beta*(y-y_0)
        diff_1=g(c,b,x)
        s=inv(V)*B*V*s+inv(V)*(diff_1-diff_0)
        
        x_record(k,:,:)=reshape(x,p,n)'
    end
end