function J = ipdtest(G,dt,parms)

s = tf('s');
% parms(1)kp
% parms(2)ti
% parms(3)td
% parms(4) N
% formula presa da https://www.sciencedirect.com/science/article/pii/S2405896318304543

K1 = parms(1)/(s*parms(2));
K2 = parms(1)*(1+(s*parms(2)))/(1 + s*(parms(3)/parms(4)));
 
ClosedLoop1 = feedback(G,K2);
Loop = series(K1,ClosedLoop1);
ClosedLoop = feedback(Loop,1);

t = 0:dt:20;
[y,t] = step(ClosedLoop,t);

% CTRLtf = K/(1+K*G);
% u = lsim(K,1-y,t);

%  Q = 1;
%  R = .001;
%  J = dt*sum(Q*(1-y(:)).^2 + R*u(:).^2)

J=sum(abs(1-y)*dt);

