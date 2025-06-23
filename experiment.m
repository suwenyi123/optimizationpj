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
max_k=1200

x_record_ab=AB(max_k,c,b)
Residual_ab=residual(x_record_ab)

x_record_abm=ABm(max_k,c,b)
Residual_abm=residual(x_record_abm)

x_record_dngt=dngt(max_k,c,b)
Residual_dngt=residual(x_record_dngt)

x_record_extra=extra(max_k,c,b)
Residual_extra=residual(x_record_extra)

x_record_dextra=dextra(max_k,c,b)
Residual_dextra=residual(x_record_dextra)

x_record_add=add_opt(max_k,c,b)
Residual_add=residual(x_record_add)

x_record_frost=frost(max_k,c,b)
Residual_frost=residual(x_record_frost)

x_record_rowsto=rowsto(max_k,c,b)
Residual_rowsto=residual(x_record_rowsto)

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

x_record_abn_R1=ABN(max_k,c,b,aj1)
Residual_abn_R1=residual(x_record_abn_R1)
x_record_abn_R2=ABN(max_k,c,b,aj2)
Residual_abn_R2=residual(x_record_abn_R2)
x_record_abn_R3=ABN(max_k,c,b,aj3)
Residual_abn_R3=residual(x_record_abn_R3)
maker_idx = 1:50:max_k-1;
figure(1); clf
L1=plot(1:max_k-1,Residual_abn_R1,'Marker',"+",'MarkerSize',8,'Color',"b",'LineWidth',1.5,'MarkerIndices',maker_idx);hold on;
L2=plot(1:max_k-1,Residual_abn_R2,'Marker','^','MarkerSize',8,'Color',"r",'LineWidth',1.5,'MarkerIndices',maker_idx);hold on;
L3=plot(1:max_k-1,Residual_abn_R3,'Marker',"square",'MarkerSize',8,"Color",[0,0.5,0],'LineWidth',1.5,'MarkerIndices',maker_idx);hold on;
legend([L1,L2,L3],"G1","G2","G3")
xlabel("Iterations,k")
ngraph_matrix=[Residual_abn_R1,Residual_abn_R2,Residual_abn_R3] 
csvwrite("E:\OT\pj/ngraph_residual.csv",ngraph_matrix);
% x_record_tvAB=tvAB(max_k,c,b)
% Residual_tvAB=residual(x_record_tvAB)
% plot(1:max_k-1,Residual_tvAB,"g")
residual_matrix=[Residual_ab,Residual_abn_R1,Residual_abm,Residual_dextra, ...
    Residual_add,Residual_dngt,Residual_rowsto,Residual_frost] 
csvwrite("E:\OT\pj/algorithm_residual.csv",residual_matrix);
%plot
figure(2); clf
maker_idx = 1:200:max_k-1;
l1=plot(1:max_k-1,Residual_ab,'Marker',"h",'MarkerSize',6,"color",[1,0,0.9],'LineWidth',1.2,'MarkerIndices',1:170:max_k-1);hold on;
l2=plot(1:max_k-1,Residual_abn_R1,'Marker',">",'MarkerSize',4,"color", [0.65,0.79,0.89],'LineWidth',1.2,'MarkerIndices',maker_idx);hold on;
l3=plot(1:max_k-1,Residual_abm,'Marker',"^",'MarkerSize',4,"color",[0.97,0.60,0.58],'LineWidth',1.2,'MarkerIndices',maker_idx);hold on;
%l4=plot(1:max_k-1,Residual_extra,"r",'Marker','s','MarkerIndices',1:100:max_k-1);hold on;
l5=plot(1:max_k-1,Residual_dextra,'Marker',"o",'MarkerSize',6,"color",[0.98,0.74,0.44],'LineWidth',1.2,'MarkerIndices',maker_idx);hold on;
l6=plot(1:max_k-1,Residual_add,'Marker',"p",'MarkerSize',4,"color",[0.96,0.37,0.40],'LineWidth',1.2,'MarkerIndices',maker_idx);hold on;
l7=plot(1:max_k-1,Residual_dngt,'Marker',"v",'MarkerSize',4,"color", [0.18,0.62,0.17],'LineWidth',1.2,'MarkerIndices',maker_idx);hold on;
l8=plot(1:max_k-1,Residual_rowsto,'Marker',"d",'MarkerSize',4,"color", [0.21,0.21,0.67],'LineWidth',1.2,'MarkerIndices',maker_idx);hold on;
l9=plot(1:max_k-1,Residual_frost,'Marker',"s",'MarkerSize',6,"color", [0.35,0.90,0.89],'LineWidth',1.2,'MarkerIndices',maker_idx);hold on;
legend([l1,l2,l3,l5,l6,l7,l8,l9],"AB","ABN","ABm","DEXTRA","ADD-OPT","D-DNGT","ROW-STO","FROST")
xlabel("Iterations,k")
ylabel("Residual")