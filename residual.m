function residual=residual(x_record)
    [max_k,n,p]=size(x_record)
    x_final=squeeze(x_record(max_k,:,:))
    x_start=squeeze(x_record(1,:,:))
    residual=zeros([max_k-1,1])
    %norm_x = vecnorm(x_final-x_start, 2, 2);

    for k = 1:max_k-1
        x_k = squeeze(x_record(k, :, :));
        residual(k)=sum(vecnorm((x_k-x_final)')./vecnorm((x_start-x_final)'))
    end
end


    