function varargout = UserInterface(varargin)
% USERINTERFACE MATLAB code for UserInterface.fig
%      USERINTERFACE, by itself, creates a new USERINTERFACE or raises the existing
%      singleton*.
%
%      H = USERINTERFACE returns the handle to a new USERINTERFACE or the handle to
%      the existing singleton*.
%
%      USERINTERFACE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in USERINTERFACE.M with the given input arguments.
%
%      USERINTERFACE('Property','Value',...) creates a new USERINTERFACE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UserInterface_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UserInterface_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES



% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UserInterface_OpeningFcn, ...
                   'gui_OutputFcn',  @UserInterface_OutputFcn, ...
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

% --- Executes just before UserInterface is made visible.
function UserInterface_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UserInterface (see VARARGIN)

% Choose default command line output for UserInterface
handles.output = hObject;
global variable ;
global multi_pole; 
global alpha_fos; 
global alpha_hpz;
global time_dl;
global time_ddl;
global omegazero;

variable = 0;     
multi_pole = [1 2 3 4 8];
alpha_fos = [0.1 0.2 0.5 1];
alpha_hpz = [0.1 0.2 0.5 1 2 5];
time_dl=[0 0.1 0.2 0.5 2 5 10];
time_ddl=[0 0.1 0.2 0.5 2 5 10];
omegazero = [1 2 5 10];
        

% Update handles structure
guidata(hObject, handles);

function varargout = UserInterface_OutputFcn(hObject, eventdata, handles) 

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
    return;
end
variable = in;


% custom system
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
variable = 1;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
        global variable ;
        global system;
        if variable ==  0
            msgbox('Please select a system', 'Errore!', 'error');
            return;
        end
        msgbox('start simulation --> wait end before start a new simulation'); 
        analized = struct;

        s = tf('s');
        elementSelection = get(handles.uibuttongroup,'SelectedObject');
        global strSelection
        strSelection = get(elementSelection,'String');
        
        %System Transfer Function Selection
        switch strSelection
            case 'Select a System'
                msgbox('Error costant, please recreate system', 'Errore!', 'error');
            case 'Multiple Equal Poles'
                G = 1/(s+1)^variable;
            case 'Fourth Order System'
                G = 1/(s+1)/(1+variable*s)/(1+variable^2*s)/(1+variable^3*s);
            case 'Right Half Plane Zero'
                G = (1-variable*s)/(s+1)^3; 
            case 'Time Delay and Lag'
                G = (1/(1+variable*s))*exp(-s);
            case 'Time Delay and Double Lag'
                G = (1/(1+variable*s)^2)*exp(-s);
            case 'Fast and Slow Modes'
                G = (100/(s+10)^2)*((1/s+1)+(0.5/s+0.05));
            case 'Oscillatory System'
                G = 1/(s+1)/(s^2+(2*0.1*variable*s)+(variable*variable));
            case 'Unstable Pole'
                G = 1/(s^2-1);
            case 'Multiple Equal Poles Integral'
                G = 1/s/(s+1)^variable;
            case 'Fourth Order System Integral'
                G = 1/s/(s+1)/(1+variable*s)/(1+variable^2*s)/(1+variable^3*s);
            case 'Right Half Plane Zero Integral'
                G = (1-variable*s)/s/(s+1)^3; 
            case 'Time Delay and Lag Integral'
                G = (1/s/(1+variable*s))*exp(-s);
            case 'Time Delay and Double Lag Integral'
                G = (1/s/(1+variable*s)^2)*exp(-s);
            case 'Custom'
                G = system; %leggere da una matrice come esempio del profe
            otherwise
                G = [];
        end
        analized.systemTransferFunction = G;

        %time step
        dt = 0.001;
        %Genetic Algorithm Paremeters
        %Population Size of each Iteration
        PopSize = 100;
        MaxGeneration = 1500;
        options = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'OutputFcn',@myfun);
        %{
        PID genetic algorithm
        x(1) = Kp
        x(2) = Ti
        x(3)= Td
        x(4)= N
        %}         
        %lower bounds lb
        lb_PID = [0.001 0.1 0.1 5];
        %upper bounds ub 
        ub_PID = [10 500 50 20];
        
        [control,IAE] = ga(@(K)pidtest(G,dt,K),4,-eye(4),zeros(4,1),[],[],lb_PID,ub_PID,[],options);
        
        K = control(1) + control(2)/s + (control(3)*s)/(1 + s*(control(3)/control(4)));
        
        Loop_PID = series(K,G);
        global ClosedLoop_PID;
        ClosedLoop_PID = feedback(Loop_PID,1);
        analized.ClosedLoop.pid = ClosedLoop_PID;
        info = stepinfo(ClosedLoop_PID);
        analized.pid = ga_info_to_struct(IAE,control,info,'pid');
        analized.time = info.SettlingTime;
        
        global Disturb_PID;
        Disturb_PID = feedback(G,K);
        analized.Disturb.pid = Disturb_PID;
        info = stepinfo(Disturb_PID);
        
        analized.pid_dist =  ga_info_to_struct(IAE,control,info,'pid');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end
        
        
        %{
        I-PD genetic algorithm
        x(1) = Kp
        x(2) = Ti
        x(3) = Td
        x(4) = N
        %}         
        %lower bounds lb 
        lb_IPD = [0.001 0.1 0.1 5];
        %upper bounds ub 
        ub_IPD = [10 500 50 20];
        options1 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'OutputFcn',@myfun);
        [control1,IAE1] = ga(@(K)ipdtest(G,dt,K),4,-eye(4),zeros(4,1),[],[],lb_IPD,ub_IPD,[],options1);
        

        K1 = control1(1)/(s*control1(2));
        K2 = control1(1)*(1+(s*control1(2)))/(1 + s*(control1(3)/control1(4)));
        
        ClosedLoop1_IPD = feedback(G,K2);
        Loop_IPD = series(K1,ClosedLoop1_IPD);
        global ClosedLoop_IPD;
        ClosedLoop_IPD = feedback(Loop_IPD,1);
        analized.ClosedLoop.ipd = ClosedLoop_IPD;
        info = stepinfo(ClosedLoop_IPD); 
        analized.ipd = ga_info_to_struct(IAE1,control1,info,'i_pd');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end
        global Disturb_IPD;
        Disturb_IPD = feedback(G,(K1+K2));
        analized.Disturb.ipd = Disturb_IPD;
        info = stepinfo(Disturb_IPD);
        analized.ipd_dist =  ga_info_to_struct(IAE1,control,info,'i_pd');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end
    
        
        %{
        PI-D genetic algorithm
        x(1) = Kp
        x(2) = Ti
        x(3) = Td
        x(4) = N
        %}         
        %lower bounds lb 
        lb_DPI = [0.001 0.1 0.1 5];
        %upper bounds ub 
        ub_DPI = [10 500 50 20];
        options2 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'OutputFcn',@myfun);
        [control2,IAE2] = ga(@(K)dpitest(G,dt,K),4,-eye(4),zeros(4,1),[],[],lb_DPI,ub_DPI,[],options2);

        K1 = control2(1);
        K2 = control2(1)/(s*control2(2));
        K3 = control2(1)*((s*control2(3))/(1+(control2(3)*s/control2(4))));
                
        global ClosedLoop_DPI;
        ClosedLoop_DPI = minreal((G*(K1+K2))/(1+(G*K3)+(G*(K1+K2))));
        analized.ClosedLoop.dpi = ClosedLoop_DPI;
        info = stepinfo(ClosedLoop_DPI); 
        analized.dpi = ga_info_to_struct(IAE2,control2,info,'pi_d');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end
        %__________________________________________________________________________________________________________________________________________________
        
        global Disturb_DPI;
        Disturb_DPI = feedback(G,K2+K3);
        analized.Disturb.dpi = Disturb_DPI;
        info = stepinfo(Disturb_DPI); 
        analized.dpi_dist =  ga_info_to_struct(IAE2,control2,info,'pi_d');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end
        
        %{
        PIDA genetic algorithm
        x(1) = Kp
        x(2) = Ti
        x(3) = Td
        x(4) = N
        x(5) = Ta
        x(6) = alfa
        %}
                    
        %lower bounds lb 
        lb_PIDA = [0.001 0.1 0.1 5 0.1 5];
        %upper bounds ub 
        ub_PIDA = [10 500 50 20 50 20];
        options3 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'OutputFcn',@myfunpida);
        [control3,IAE3] = ga(@(K)pidatest(G,dt,K),6,-eye(6),zeros(6,1),[],[],lb_PIDA,ub_PIDA,[],options3);
        
        K = control3(1) + control3(2)/s + (control3(3)*s)/(1 + s*(control3(3)/control3(4))) + (control3(5)*s^2)/((1 + s*control3(5)/control3(6))^2); 
       
        Loop_PIDA = series(K,G);
        global ClosedLoop_PIDA;
        ClosedLoop_PIDA = feedback(Loop_PIDA,1);
        analized.ClosedLoop.pida = ClosedLoop_PIDA;
        info = stepinfo(ClosedLoop_PIDA);     
        analized.pida = ga_info_to_struct(IAE3,control3,info,'pida');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end       
        
        global Disturb_PIDA;
        Disturb_PIDA = feedback(G,K);
        analized.Disturb.pida = Disturb_PIDA;
        info = stepinfo(Disturb_PIDA);
        analized.pida_dist = ga_info_to_struct(IAE3,control3,info,'pida');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end           
                  
        %export to Excel
        print_excel(analized,strSelection,variable);
        msgbox('end simulation');
        clear all;
