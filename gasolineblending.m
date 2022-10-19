% OctRt Price $/B
Gas = [93 37.5;
85 28.5];
%Stock OctRt Price $/B Availability
Stock = [70 12.5 2000;
80 12.5 4000;
85 12.5 4000;
90 27.5 5000;
99 27.5 3000];
% Revenue
f = [zeros(10,1); Stock(:,3); Gas(:,2)];
% Equality constraint
G = [eye(5,5) eye(5,5) eye(5,5) zeros(5,2);
ones(1,5) zeros(1,5) zeros(1,5) -1 0;
zeros(1,5) ones(1,5) zeros(1,5) 0 -1];
h = [Stock(:,3); zeros(2,1)];
% Inequality (fuel quality) constraints
A = [-[Stock(:,1)' zeros(1,5) zeros(1,5);
zeros(1,5) Stock(:,1)' zeros(1,5)] diag(Gas(:,1))];
b = zeros(2,1);
% X=LINPROG(f,A,b,Aeq,beq,LB,UB)
x = linprog(-f,A,b,G,h,zeros(size(f)),[]);
Revenue = f'*x;
