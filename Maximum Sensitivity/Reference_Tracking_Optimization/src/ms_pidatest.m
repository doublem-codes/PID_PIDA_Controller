function J = ms_pidatest(G,dt,parms)
global minimum_IAE;
s = tf('s');

K = parms(1)*(1 + 1/(parms(2)*s) + (parms(3)*s)/(1 + s*(parms(3)/parms(6))) + (parms(4)*s^2)/((1 + s*(parms(4)/parms(5))))^2); 
Loop = series(K,G);
ClosedLoop = minreal(feedback(Loop,1));
stable = allmargin(Loop).Stable;
t = 0:dt:100;
[y,t] = step(ClosedLoop,t);
J1=sum(abs(1-y)*dt);
        
switch stable
    case 1
        S = feedback(1,Loop);
        peakGain = getPeakGain(S);
        if peakGain > 2.0
            if peakGain > 2.05
           J1 = J1 + 100*peakGain;
            else
           J1 = J1 + 10*peakGain;
            end
        end
        
        if J1< minimum_IAE
            minimum_IAE=J1;
        end
        
    otherwise
        if J1< minimum_IAE
            costFunction = ms_costFunctionAddition(Loop);
            J1 = J1+0.1*costFunction;
        end
end

J=J1;

end


