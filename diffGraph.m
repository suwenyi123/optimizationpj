rng(42)
n=10
mi=10
p=3
c = zeros(n,mi, p); % 初始化矩阵

for i = 1:n
    for j=1:mi
        c(i,j,:) = randn(1, p); % 将向量赋值给矩阵的相应位置
    end
end
b = randi([0,1],n,mi).*2-1   
max_k=1000

aj1=[1,1,0,0,0,0,0,0,0,0;
        1,1,1,0,0,0,0,0,0,0;
        0,0,1,0,0,0,1,0,0,0;
        1,0,0,1,1,0,0,1,0,0;
        0,0,0,1,1,0,0,0,0,0;
        0,0,0,0,1,1,1,0,0,0;
        0,0,1,0,0,1,1,0,0,1;
        0,0,0,1,0,0,0,1,0,0;
        0,0,0,0,0,0,0,1,1,1;
        0,0,0,0,0,0,0,0,1,1]
aj2=[1,1,0,0,1,0,0,0,0,0;
    1,1,1,0,1,1,0,0,0,0;
    0,0,1,0,0,0,1,0,0,0;
    1,0,0,1,1,0,0,1,0,0;
    1,0,0,1,1,0,0,1,1,0;
    0,1,1,0,1,1,1,0,0,1;
    0,0,1,0,0,1,1,0,0,1;
    0,0,0,1,0,0,0,1,0,0;
    0,0,0,0,1,1,0,1,1,1;
    0,0,0,0,0,1,0,0,1,1]
aj3=[1,1,0,0,1,0,0,1,0,0;
    1,1,1,0,1,1,0,0,0,0;
    0,0,1,0,1,0,1,0,0,1;
    1,0,0,1,1,0,0,1,0,0;
    1,0,0,1,1,0,0,1,1,1;
    1,1,1,0,1,1,1,0,0,1;
    0,0,1,0,0,1,1,0,0,1;
    1,0,0,1,0,1,0,1,0,0;
    0,0,0,0,1,1,0,1,1,1;
    0,0,1,0,0,1,0,0,1,1]
%R1=Trow(aj1)
%R2=Trow(aj2)
%R3=Trow(aj3)

x_record_AB_R1=AB(max_k,c,b,aj1)
Residual_AB_R1=residual(x_record_AB_R1)
x_record_AB_R2=AB(max_k,c,b,aj2)
Residual_AB_R2=residual(x_record_AB_R2)
x_record_AB_R3=AB(max_k,c,b,aj3)
Residual_AB_R3=residual(x_record_AB_R3)
maker_idx = 1:50:max_k-1;
figure(1); clf
L1=plot(1:max_k-1,Residual_AB_R1,'Marker',"+",'MarkerSize',8,'Color',"b",'LineWidth',1.5,'MarkerIndices',maker_idx);hold on;
L2=plot(1:max_k-1,Residual_AB_R2,'Marker','^','MarkerSize',8,'Color',"r",'LineWidth',1.5,'MarkerIndices',maker_idx);hold on;
L3=plot(1:max_k-1,Residual_AB_R3,'Marker',"square",'MarkerSize',8,"Color",[0,0.5,0],'LineWidth',1.5,'MarkerIndices',maker_idx);hold on;
legend([L1,L2,L3],"G1","G2","G3")
xlabel("Iterations,k")
ylabel("AB")
ngraph_matrix=[Residual_AB_R1,Residual_AB_R2,Residual_AB_R3] 
waitforbuttonpress; 

