//���J�b�`�������i���U���Ԍn�j
A=[0 1;1 0]; b=[0;1]; r=1; Q=diag([1 1]);
B=b; R=r; G=B*inv(R)*B';
P=ricc(A,G,Q,'disc'), spec(P)
k=-inv(r+b'*P*b)*b'*P*A, spec(A+b*k)

