function rowm=Trow(A)
    format rat
     sum1=sum(A,2)
    rowm=A
    for i=1:10
        rowm(i,:)=A(i,:)/sum1(i)
    end
end