load Rmat_fwd.mat
load ../vocvalppb.mat
d=vocvalppb;
A=Rmat_fwd;
gg=36;
slct=round(rand(1,gg)*36);
H=A(:,slct);
all(eig(H'*H)>0)
rand()

 
 
 
 
 
 
 