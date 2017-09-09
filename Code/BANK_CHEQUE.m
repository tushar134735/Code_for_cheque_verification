function varargout = BANK_CHEQUE(varargin)
% BANK_CHEQUE MATLAB code for BANK_CHEQUE.fig
%      BANK_CHEQUE, by itself, creates a new BANK_CHEQUE or raises the existing
%      singleton*.
%
%      H = BANK_CHEQUE returns the handle to a new BANK_CHEQUE or the handle to
%      the existing singleton*.
%
%      BANK_CHEQUE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BANK_CHEQUE.M with the given input arguments.
%
%      BANK_CHEQUE('Property','Value',...) creates a new BANK_CHEQUE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BANK_CHEQUE_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BANK_CHEQUE_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BANK_CHEQUE

% Last Modified by GUIDE v2.5 16-May-2017 10:59:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BANK_CHEQUE_OpeningFcn, ...
                   'gui_OutputFcn',  @BANK_CHEQUE_OutputFcn, ...
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


% --- Executes just before BANK_CHEQUE is made visible.
function BANK_CHEQUE_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BANK_CHEQUE (see VARARGIN)

% Choose default command line output for BANK_CHEQUE
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BANK_CHEQUE wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BANK_CHEQUE_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.output = hObject;
[fn pn] = uigetfile('*.jpg','select a jpg image');
complete = strcat(pn,fn);
set(handles.edit1,'string',complete);
I = imread(complete);
imshow(I,[]);
guidata(hObject,handles);
%test2222(I);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.output = hObject;
h = get(handles.edit1,'string');
I = imread(h);
%imshow(I,[]);
%guidata(hObject,handles);
test2222(I);