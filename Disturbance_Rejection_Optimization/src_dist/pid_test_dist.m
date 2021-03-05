function J  = pid_test_dist(G,dt,parms)
s = tf('s');

K = parms(1)*(1 +1/(parms(2)*s) + (parms(3)*s)/(1 + s*(parms(3)/parms(4)))); 
ClosedLoop = minreal(feedback(G,K));

t = 0:dt:50;
[y,t] = step(ClosedLoop,t);
J=sum(abs(y)*dt);
end


