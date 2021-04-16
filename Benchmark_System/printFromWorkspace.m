function printFromWorkspace(dataStep, dataDist)
figure('NumberTitle', 'off', 'Name', dataDist.name);

%% set point plote
        t_sim = 0:0.001:2*dataStep.time;
        subplot(2,3,1);
        plot(t_sim,step(dataStep.ClosedLoop.pid,t_sim),'r-',t_sim,step(dataStep.ClosedLoop.ipd,t_sim),'b-',t_sim,step(dataStep.ClosedLoop.dpi,t_sim),'k-',t_sim,step(dataStep.ClosedLoop.pida,t_sim),'m-');
        legend('PID','I-PD','PI-D','PIDA');
        title('reference traking');
        xlabel('time');
        ylabel('amplitude');
        grid on;
                

%% disturbance rejection plote
        t_sim = 0:0.001:2*dataStep.time;
        subplot(2,3,4);
        plot(t_sim,step(dataDist.Disturb.pid,t_sim),'r-',t_sim,step(dataDist.Disturb.pida,t_sim),'m-');
        legend('PID','PIDA');
        title('disturbance rejection');
        xlabel('time');
        ylabel('amplitude');
        grid on;
        
        
%% histograph set point
    subplot(2,3,3);
    Y = [dataStep.pid.IAE dataStep.ipd.IAE dataStep.dpi.IAE dataStep.pida.IAE];
    % The bar function uses a sorted list of the categories, so the bars might display in a different order than you expect. 
    % To preserve the order, call the reordercats function.
    
    X = categorical({'PID','I-PD','PI-D','PIDA'});
    X = reordercats(X,{'PID','I-PD','PI-D','PIDA'});
    
    bar(X,Y);
    title('IAE Trend reference traking');
    
%% histograph disturbance rejection
    subplot(2,3,6);
    Y_dist = [dataDist.pid_dist.IAE dataDist.pida_dist.IAE];
    % The bar function uses a sorted list of the categories, so the bars might display in a different order than you expect. 
    % To preserve the order, call the reordercats function.
    
    X_dist = categorical({'PID','PIDA'});
    X_dist = reordercats(X_dist,{'PID','PIDA'});
    
    
    bar(X_dist,Y_dist);    
    title('IAE Trend disturbance rejection');
    
    
%% Step control variable
    G = dataStep.systemTransferFunction;
    K_pid = dataStep.Controller.pid;
    K_pida = dataStep.Controller.pida;
    K1 = dataStep.Controller.ipd.K1;
    K2 = dataStep.Controller.ipd.K2;
    c1 = dataStep.Controller.dpi.K1;
    c2 = dataStep.Controller.dpi.K2;
    c3 = dataStep.Controller.dpi.K3;
    
    u_dpi = (c1+c2)/(1+G*c1*c2 +G*c3);
    u_ipd = (K1)/(1+G*(K1+K2));

    subplot(2,3,2);
    plot(t_sim,step(K_pid/(1+K_pid*G),t_sim),'r-',t_sim,step(u_ipd,t_sim),'b-',t_sim,step(u_dpi,t_sim),'k-',t_sim,step(K_pida/(1+K_pida*G),t_sim),'m-');
    legend('PID','I-PD','PI-D','PIDA');
    title('Control variable');
    xlabel('time');
    ylabel('amplitude');
    grid on;

%% Disturbance Control variable
   
    subplot(2,3,5);
    plot(t_sim,step(t_sim,-feedback(dataDist.Loop.pid ,1)),'r-',t_sim,step(t_sim,-feedback(dataDist.Loop.pida ,1)),'m-');
    legend('PID','PIDA');
    title('Control variable');
    xlabel('time');
    ylabel('amplitude');
    grid on;
    
 %% Save figure

    savefig(dataDist.name);
end

