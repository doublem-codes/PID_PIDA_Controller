function varargout = UserInterfacedist(varargin)
% USERINTERFACEDIST MATLAB code for UserInterfacedist.fig
%      USERINTERFACEDIST, by itself, creates a new USERINTERFACEDIST or raises the existing
%      singleton*.
%
%      H = USERINTERFACEDIST returns the handle to a new USERINTERFACEDIST or the handle to
%      the existing singleton*.
%
%      USERINTERFACEDIST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in USERINTERFACEDIST.M with the given input arguments.
%
%      USERINTERFACEDIST('Property','Value',...) creates a new USERINTERFACEDIST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UserInterfacedist_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UserInterfacedist_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES



% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UserInterfacedist_OpeningFcn, ...
                   'gui_OutputFcn',  @UserInterfacedist_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before UserInterfacedist is made visible.
function UserInterfacedist_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UserInterfacedist (see VARARGIN)

% Choose default command line output for UserInterfacedist
handles.output = hObject;
global variable ;
global multi_pole; 
global alpha_fos; 
global alpha_hpz;
global time_dl;
global time_ddl;
global omegazero;
variable = -1;     
multi_pole = [1 2 3 4 8];
alpha_fos = [0.1 0.2 0.5 1];
alpha_hpz = [0.1 0.2 0.5 1 2 5];
time_dl=[0 0.1 0.2 0.5 2 5 10];
time_ddl=[0 0.1 0.2 0.5 2 5 10];
omegazero = [1 2 5 10];
        

% Update handles structure
guidata(hObject, handles);

function varargout = UserInterfacedist_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

% multipole
function radiobutton2_Callback(hObject, eventdata, handles)
global multi_pole;
global variable;
prompt={'select order multiple poles 1 2 3 4 8'};
title='inserimento sistema';
input = inputdlg(prompt, title);
sizeinput = size(input);
if (sizeinput == 0) 
    return
end
in = str2num(cell2mat(input));
check = 0;
for element = multi_pole
       if  element == in
         check = 1;
         msgbox('Operation Correct');
       end
end
if check == 0
    msgbox('Error costant, please recreate system', 'Errore!', 'error');
    variable = -1;  
    return;
end


variable = in;

% four order system
function radiobutton3_Callback(hObject, eventdata, handles)
global variable;
global alpha_fos;
prompt={'select param alfa 0.1 0.2 0.5 1'};
title='inserimento sistema';
input = inputdlg(prompt, title);
sizeinput = size(input);
if (sizeinput == 0) 
    return
end
in = str2num(cell2mat(input(1,1)));
check = 0;
for element = alpha_fos
       if  element == in
         check = 1;
         msgbox('Operation Correct');
       end
end
if check == 0
    msgbox('Error costant, please recreate system', 'Errore!', 'error');
    variable = -1;  
    return;
end

variable = in;

% half plane zero
function radiobutton4_Callback(hObject, eventdata, handles)
global variable;
global alpha_hpz;
prompt={'select param alfa 0.1 0.2 0.5 1 2 5'};
title='inserimento sistema';
input = inputdlg(prompt, title);
sizeinput = size(input);
if (sizeinput == 0) 
    return
end
in = str2num(cell2mat(input(1,1)));
check = 0;
for element = alpha_hpz
       if  element == in
         check = 1;
         msgbox('Operation Correct');
       end
end
if check == 0
    msgbox('Error costant, please recreate system', 'Errore!', 'error');
    variable = -1;  
    return;
end
variable = in;

%time delay and lagh
function radiobutton5_Callback(hObject, eventdata, handles)
global variable;
global time_dl;
prompt={'select param time 0 0.1 0.2 0.5 2 5 10'};
title='inserimento sistema';
input = inputdlg(prompt, title);
sizeinput = size(input);
if (sizeinput == 0) 
    return
end
in = str2num(cell2mat(input(1,1)));
check = 0;
for element = time_dl
       if  element == in
         check = 1;
         msgbox('Operation Correct');
       end
end
if check == 0
    msgbox('Error costant, please recreate system', 'Errore!', 'error');
    variable = -1;  
    return;
end
variable = in;

%time delay and double Lag
function radiobutton6_Callback(hObject, eventdata, handles)
global variable;
global time_ddl;
prompt={'select param time 0 0.1 0.2 0.5 2 5 10'};
title='inserimento sistema';
input = inputdlg(prompt, title);
sizeinput = size(input);
if (sizeinput == 0) 
    return
end
in = str2num(cell2mat(input(1,1)));
check = 0;
for element = time_ddl
       if  element == in
         check = 1;
         msgbox('Operation Correct');
       end
end
if check == 0
    msgbox('Error costant, please recreate system', 'Errore!', 'error');
    variable = -1;  
    return;
end
variable = in;

%fast and slow modes
function radiobutton7_Callback(hObject, eventdata, handles)
global variable ;
variable = 1; 

% oscillatory sistem.
function radiobutton8_Callback(hObject, eventdata, handles)
global variable;
global omegazero;
prompt={'select param time 1 2 5 10'};
title='inserimento sistema';
input = inputdlg(prompt, title);
sizeinput = size(input);
if (sizeinput == 0) 
    return
end
in = str2num(cell2mat(input(1,1)));
check = 0;
for element = omegazero
       if  element == in
         check = 1;
         msgbox('Operation Correct');
       end
end
if check == 0
    msgbox('Error costant, please recreate system', 'Errore!', 'error');
    variable = -1;  
    return;
end
variable = in;

%unstable pole
function radiobutton9_Callback(hObject, eventdata, handles)
global variable ;
variable = 1;  

% multi poles integral
function radiobutton10_Callback(hObject, eventdata, handles)
global multi_pole;
global variable;
prompt={'select order multiple poles 1 2 3 4 8'};
title='inserimento sistema';
input = inputdlg(prompt, title);
sizeinput = size(input);
if (sizeinput == 0) 
    return
end
in = str2num(cell2mat(input));
check = 0;
for element = multi_pole
       if  element == in
         check = 1;
         msgbox('Operation Correct');
       end
end
if check == 0
    msgbox('Error costant, please recreate system', 'Errore!', 'error');
    variable = -1;  
    return;
end
variable = in;

% four order system integral
function radiobutton11_Callback(hObject, eventdata, handles)
global variable;
global alpha_fos;
prompt={'select param alfa 0.1 0.2 0.5 1'};
title='inserimento sistema';
input = inputdlg(prompt, title);
sizeinput = size(input);
if (sizeinput == 0) 
    return
end
in = str2num(cell2mat(input(1,1)));
check = 0;
for element = alpha_fos
       if  element == in
         check = 1;
         msgbox('Operation Correct');
       end
end
if check == 0
    msgbox('Error costant, please recreate system', 'Errore!', 'error');
    variable = -1;  
    return;
end
variable = in;

% half plane zero integral
function radiobutton12_Callback(hObject, eventdata, handles)
global variable;
global alpha_hpz;
prompt={'select param alfa 0.1 0.2 0.5 1 2 5'};
title='inserimento sistema';
input = inputdlg(prompt, title);
sizeinput = size(input);
if (sizeinput == 0) 
    return
end
in = str2num(cell2mat(input(1,1)));
check = 0;
for element = alpha_hpz
       if  element == in
         check = 1;
         msgbox('Operation Correct');
       end
end
if check == 0
    msgbox('Error costant, please recreate system', 'Errore!', 'error');
    variable = -1;  
    return;
end
variable = in;

% time delay and Lag integral
function radiobutton13_Callback(hObject, eventdata, handles)
global variable;
global time_dl;
prompt={'select param time 0 0.1 0.2 0.5 2 5 10'};
title='inserimento sistema';
input = inputdlg(prompt, title);
sizeinput = size(input);
if (sizeinput == 0) 
    return
end
in = str2num(cell2mat(input(1,1)));
check = 0;
for element = time_dl
       if  element == in
         check = 1;
         msgbox('Operation Correct');
       end
end
if check == 0
    msgbox('Error costant, please recreate system', 'Errore!', 'error');
    variable = -1;  
    return;
end
variable = in;

% time delay and double Lag integral
function radiobutton14_Callback(hObject, eventdata, handles)
global variable;
global time_ddl;
prompt={'select param time 0 0.1 0.2 0.5 2 5 10'};
title='inserimento sistema';
input = inputdlg(prompt, title);
sizeinput = size(input);
if (sizeinput == 0) 
    return
end
in = str2num(cell2mat(input(1,1)));
check = 0;
for element = time_ddl
       if  element == in
         check = 1;
         msgbox('Operation Correct');
       end
end
if check == 0
    msgbox('Error costant, please recreate system', 'Errore!', 'error');
    variable = -1;  
    return;
end
variable = in;

%% custom system
function radiobutton20_Callback(hObject, eventdata, handles)
global variable ;
global system;

prompt={'zero', 'poles', 'k' ,'time delay'};
title='inserimento sistema';
u_dati = inputdlg(prompt, title);

dim_m_u_dati = size(u_dati);
dim_u_dati = dim_m_u_dati(1,1);

if (dim_u_dati == 0) 
    return
end
a = eval(cell2mat(u_dati(1,1)));
b = eval(cell2mat(u_dati(2,1)));
c = eval(cell2mat(u_dati(3,1)));
t = eval(cell2mat(u_dati(4,1)));
s = tf('s');
try
    sys = zpk(a, b, c);
catch
    msgbox('Errore nella creazione del sistema inserito..', 'Errore!', 'error');
    variable = -1;  
    return;
end
create = 1;
for in = a
    create = create * (s+in + 1);
end
for in = b
    create = create / (s+in + 1);
end
    system = create *exp(-s*t);
    save 'system' ; 
variable = -1;

%% Start Simulation
function pushbutton1_Callback(hObject, eventdata, handles)
        global variable ;
        global system;
        s = tf('s');
        elementSelection = get(handles.uibuttongroup,'SelectedObject');
        global strSelection
        strSelection = get(elementSelection,'String');
        
        if variable == -1
            msgbox('Please select a system', 'Errore!', 'error');
            return;
        end     
        

%% System Transfer Function Selection
        switch strSelection
            case 'Select a System'
                msgbox('Error costant, please recreate system', 'Errore!', 'error');
            case 'Multiple Equal Poles'
                G = 1/(s+1)^variable
            case 'Fourth Order System'
                G = 1/(s+1)/(1+variable*s)/(1+variable^2*s)/(1+variable^3*s)
            case 'Right Half Plane Zero'
                G = (1-variable*s)/(s+1)^3 
            case 'Time Delay and Lag'
                G = (1/(1+variable*s))*exp(-s)
            case 'Time Delay and Double Lag'
                G = (1/(1+variable*s)^2)*exp(-s)
            case 'Fast and Slow Modes'
                G = (100/(s+10)^2)*((1/s+1)+(0.5/s+0.05))
            case 'Oscillatory System'
                G = (variable*variable)/(s+1)/(s^2+(2*0.1*variable*s)+(variable*variable))
            case 'Unstable Pole'
                G = 1/(s^2-1)
            case 'Multiple Equal Poles Integral'
                G = 1/s/(s+1)^variable
            case 'Fourth Order System Integral'
                G = 1/s/(s+1)/(1+variable*s)/(1+variable^2*s)/(1+variable^3*s)
            case 'Right Half Plane Zero Integral'
                G = (1-variable*s)/s/(s+1)^3
            case 'Time Delay and Lag Integral'
                G = (1/s/(1+variable*s))*exp(-s)
            case 'Time Delay and Double Lag Integral'
                G = (1/s/(1+variable*s)^2)*exp(-s)
            case 'Custom'
                G = system; %leggere da una matrice come esempio del profe
            otherwise
                G = [];
        end
        
        analized = struct;
        analized.name = strSelection;
        analized.systemTransferFunction = G;
        dt = 0.0001;%time step
 
 %% Genetic Algorithm Paremeters
        %Population Size of each Iteration
        PopSize = 200;
        MaxGeneration = 1800;

%% PID genetic algorithm
        %{
        x(1) = Kp
        x(2) = Ti
        x(3)= Td 
        x(4)= N
        %} 

%         %lower bounds lb
%         lb_PID_dist = [30 0.1 0.001 150];
%         %upper bounds ub 
%         ub_PID_dist = [100 5 5 250];
%         optionsdist = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'OutputFcn',@myfundist);
%         [controldist,IAEdist] = ga(@(K)pid_test_dist(G,dt,K),4,-eye(4),zeros(4,1),[],[],lb_PID_dist,ub_PID_dist,[],optionsdist);
%         K_piddist = controldist(1)*(1 + 1/(controldist(2)*s) + (controldist(3)*s)/(1 + s*(controldist(3)/controldist(4))));

        rng(1,'twister') % for reproducibility
        population = rand(PopSize,3);
        optionsdist = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',population,'OutputFcn',@myfunpiddist);
        [controldist,IAEdist] = ga(@(K)pid_test_dist(G,dt,K),3,-eye(3),zeros(3,1),[],[],[],[],[],optionsdist);
        
        K_piddist = controldist(1)*(1 + 1/(controldist(2)*s) + (controldist(3)*s)/(1 + s*(0.0001)));
        
        global Disturb_PID;
        Disturb_PID = feedback(G,K_piddist);
        
        analized.Controller.pid = K_piddist;
        Loop_PID = series(G,K_piddist);
        analized.Loop.pid = Loop_PID;
        analized.Disturb.pid = Disturb_PID;
        
        infodist = stepinfo(Disturb_PID);
        analized.pid_dist = ga_info_to_struct(IAEdist,controldist,infodist,'pid');
        analized.time = infodist.SettlingTime;

%  %% I-PD genetic algorithm      
%         %{
%         x(1) = Kp
%         x(2) = Ti
%         x(3) = Td
%         x(4) = N
%         %}         
% %         %lower bounds lb 
% %         lb_IPD_dist = [30 0.1 0.001 150];
% %         %upper bounds ub 
% %         ub_IPD_dist = [100 5 5 250];
% % 
% %         optionsdist1 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'OutputFcn',@myfundist);
% %         [controldist1,IAEdist1] = ga(@(K)ipd_test_dist(G,dt,K),4,-eye(4),zeros(4,1),[],[],lb_IPD_dist,ub_IPD_dist,[],optionsdist1);
% %         
%         
%         rng(1,'twister') % for reproducibility
%         population1 = rand(PopSize,3);
%         optionsdist1 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',population1,'OutputFcn',@myfunipddist);
%         [controldist1,IAEdist1] = ga(@(K)ipd_test_dist(G,dt,K),3,-eye(3),zeros(3,1),[],[],[],[],[],optionsdist1);
% 
%         K1_ipddist = controldist1(1)/(s*controldist1(2));
%         K2_ipddist = controldist1(1)*(1+(s*controldist1(3))/(1 + s*(0.0001)));
%         
%         global Disturb_IPD;
%         Disturb_IPD = feedback(G,(K1_ipddist+K2_ipddist));
%         
%         analized.Controller.ipd.K1 = K1_ipddist;
%         analized.Controller.ipd.K2 = K2_ipddist;
%         
%         ClosedLoop1_IPD = feedback(G,K2_ipddist);
%         
%         Loop_IPD = series(K1_ipddist,ClosedLoop1_IPD);
%         
%         analized.Loop.ipd = Loop_IPD;
%         
%         analized.Disturb.ipd = Disturb_IPD;
%         infodist1 = stepinfo(Disturb_IPD);
%         analized.ipd_dist =  ga_info_to_struct(IAEdist1,controldist1,infodist1,'i_pd');
%         
%         if analized.time < infodist1.SettlingTime
%             analized.time = infodist1.SettlingTime;
%         end
%     
%  %%   PI-D genetic algorithm 
%         %{
%         x(1) = Kp
%         x(2) = Ti
%         x(3) = Td
%         x(4) = N
%         %}
%  
%         %lower bounds lb 
% %         lb_DPI_dist = [30 0.1 0.001 150];
% %         %upper bounds ub 
% %         ub_DPI_dist = [100 5 5 250];
% %         
% %         optionsdist2 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'OutputFcn',@myfundist);
% %         [controldist2,IAEdist2] = ga(@(K)dpi_test_dist(G,dt,K),4,-eye(4),zeros(4,1),[],[],lb_DPI_dist,ub_DPI_dist,[],optionsdist2);
% 
%         rng(1,'twister') % for reproducibility
%         population2 = rand(PopSize,3);
%         optionsdist2 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',population2,'OutputFcn',@myfundpidist);
%         [controldist2,IAEdist2] = ga(@(K)dpi_test_dist(G,dt,K),3,-eye(3),zeros(3,1),[],[],[],[],[],optionsdist2);
% 
% 
%         K1_dpidist = controldist2(1);
%         K2_dpidist = controldist2(1)/(s*controldist2(2));
%         K3_dpidist = controldist2(1)*((s*controldist2(3))/(1+(0.0001*s)));
%              
%         global Disturb_DPI;
%         Disturb_DPI = feedback(G,K1_dpidist+K2_dpidist+K3_dpidist);
%         
%         analized.Controller.dpi.K1 = K1_dpidist;
%         analized.Controller.dpi.K2 = K2_dpidist;
%         analized.Controller.dpi.K3 = K3_dpidist;
%         
%         analized.Loop.dpi =(K1_dpidist+K2_dpidist)*(G/(1+(G*K3_dpidist)));
%         analized.Disturb.dpi = Disturb_DPI;
%         infodist2 = stepinfo(Disturb_DPI); 
%         analized.dpi_dist =  ga_info_to_struct(IAEdist2,controldist2,infodist2,'pi_d');
%         
%         if analized.time < infodist2.SettlingTime
%             analized.time = infodist2.SettlingTime;
%         end
%  
%% PIDA genetic algorithm
        %{
        x(1) = Kp
        x(2) = Ti
        x(3) = Td
        x(4) = N
        x(5) = Ta
        x(6) = alfa
        %}
                    
        %lower bounds lb 
%         lb_PIDA_dist = [20 0.1 0.01 150 0.00001 3];
%         %upper bounds ub 
%         ub_PIDA_dist = [100 10 30 250 100 33];
% 
%         optionsdist3 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'OutputFcn',@myfunpidadist);
%         [controldist3,IAEdist3] = ga(@(K)pida_test_dist(G,dt,K),6,-eye(6),zeros(6,1),[],[],lb_PIDA_dist,ub_PIDA_dist,[],optionsdist3);
        rng(1,'twister') % for reproducibility
        population3 = rand(PopSize,4);
        optionsdist3 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',population3,'OutputFcn',@myfunpidadist);
        [controldist3,IAEdist3] = ga(@(K)pida_test_dist(G,dt,K),4,-eye(4),zeros(4,1),[],[],[],[],[],optionsdist3);

        K_pidadist = controldist3(1)*(1 + 1/(controldist3(2)*s) + (controldist3(3)*s)/(1 + s*(0.0001)) + (controldist3(4)*s^2)/((1 + s*0.0001)^2)); 
      
        global Disturb_PIDA;
        Disturb_PIDA = feedback(G,K_pidadist);
                
        analized.Controller.pida = K_pidadist;
        Loop_PIDA = series(K_pidadist,G);
        analized.Loop.pida = Loop_PIDA;
        
        analized.Disturb.pida = Disturb_PIDA;
        infodist3 = stepinfo(Disturb_PIDA);
        analized.pida_dist = ga_info_to_struct(IAEdist3,controldist3,infodist3,'pida');
        if analized.time < infodist3.SettlingTime
            analized.time = infodist3.SettlingTime;
        end           
        
%% export to Excel
        print_exceldist(analized,strSelection,variable);
        msgbox('end simulation');
        clear all;
        
