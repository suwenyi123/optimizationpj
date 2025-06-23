function colm=Tcol(A)
    format rat
    sum1=sum(A,1)
    colm=A
    for i=1:10
        colm(:,i)=A(:,i)/sum1(i)
    end
end