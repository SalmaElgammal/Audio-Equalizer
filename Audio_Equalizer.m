function varargout = Audio_Equalizer(varargin)
% AUDIO_EQUALIZER MATLAB code for Audio_Equalizer.fig
%      AUDIO_EQUALIZER, by itself, creates a new AUDIO_EQUALIZER or raises the existing
%      singleton*.
%
%      H = AUDIO_EQUALIZER returns the handle to a new AUDIO_EQUALIZER or the handle to
%      the existing singleton*.
%
%      AUDIO_EQUALIZER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AUDIO_EQUALIZER.M with the given input arguments.
%
%      AUDIO_EQUALIZER('Property','Value',...) creates a new AUDIO_EQUALIZER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Audio_Equalizer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Audio_Equalizer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Audio_Equalizer

% Last Modified by GUIDE v2.5 23-Dec-2018 03:57:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Audio_Equalizer_OpeningFcn, ...
                   'gui_OutputFcn',  @Audio_Equalizer_OutputFcn, ...
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


% --- Executes just before Audio_Equalizer is made visible.
function Audio_Equalizer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output_before args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Audio_Equalizer (see VARARGIN)

% Choose default command line output_before for Audio_Equalizer
handles.output_before = hObject;
global gains;
global b1 b2 b3 b4 b5 b6 b7 b8 b9;
global fil_type;
global rate ;
global playing;
rate = 1;
gains = zeros(9,1);


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Audio_Equalizer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Audio_Equalizer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output_before args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output_before from handles structure
varargout{1} = handles.output_before;


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname] = uigetfile({'*.wav'}, 'File Selector');
handles.fullpathname = strcat(pathname, filename);
[filepath,name,ext] = fileparts(handles.fullpathname);

set(handles.address, 'String', strcat(name,ext));
set(handles.play,'Enable','on');
set(handles.stop,'Enable','on');
set(handles.band_1,'Enable','on');
set(handles.band_2,'Enable','on');
set(handles.band_3,'Enable','on');
set(handles.band_4,'Enable','on');
set(handles.band_5,'Enable','on');
set(handles.band_6,'Enable','on');
set(handles.band_7,'Enable','on');
set(handles.band_8,'Enable','on');
set(handles.band_9,'Enable','on');

set(handles.t1,'Enable','on');
set(handles.t2,'Enable','on');
set(handles.t3,'Enable','on');
set(handles.t4,'Enable','on');
set(handles.t5,'Enable','on');
set(handles.t6,'Enable','on');
set(handles.t7,'Enable','on');
set(handles.t8,'Enable','on');
set(handles.t9,'Enable','on');

set(handles.filter_type,'Enable','on');
set(handles.rate_value,'Enable','on');
set(handles.rate_drop,'Enable','on');



set(handles.input,'Enable','on');
set(handles.output,'Enable','on');
set(handles.bands,'Enable','on');

set(handles.save,'Enable','on');


set(handles.t1,'String','0');
set(handles.t2,'String','0');
set(handles.t3,'String','0');
set(handles.t4,'String','0');
set(handles.t5,'String','0');
set(handles.t6,'String','0');
set(handles.t7,'String','0');
set(handles.t8,'String','0');
set(handles.t9,'String','0');

play_equalizer(hObject, handles);
guidata(hObject, handles)



function play_equalizer(hObject, handles)
global Y Fs;
[Y, Fs] = audioread(handles.fullpathname);
global gains;
global play;
gains(1) = get(handles.band_1,'value');
gains(2) = get(handles.band_2,'value');
gains(3) = get(handles.band_3,'value');
gains(4) = get(handles.band_4,'value');
gains(5) = get(handles.band_5,'value');
gains(6) = get(handles.band_6,'value');
gains(7) = get(handles.band_7,'value');
gains(8) = get(handles.band_8,'value');
gains(9) = get(handles.band_9,'value');

contents = cellstr(get(handles.filter_type,'String')) ;
fil_type = contents{get(handles.filter_type,'Value')} ;

order = 20;
global b1 b2 b3 b4 b5 b6 b7 b8 b9;

switch fil_type
    case 'FIR Equir'
        [b1, b2, b3, b4, b5, b6 ,b7, b8, b9, play] = FIR(Y, Fs, order, 1, gains);
    case 'FIR LeastSq'
        [b1, b2, b3, b4, b5, b6, b7, b8, b9, play] = FIR(Y, Fs, order, 2, gains);
    case 'IIR Butter'
        [b1, b2, b3, b4, b5, b6, b7, b8, b9, play] = iir(Y, Fs, order, 1, gains);
    case 'IIR Cheby'
        [b1, b2, b3, b4, b5, b6, b7, b8, b9, play] = iir(Y, Fs, order, 2, gains);
 
end






% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global play Fs rate;
global player;
play_equalizer(hObject, handles);
%sound(play, Fs*rate);
soundsc(play, Fs*rate);
guidata(hObject, handles)



% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 clear sound ;

guidata(hObject, handles)





% --- Executes on slider movement.
function band_1_Callback(hObject, eventdata, handles)
% hObject    handle to band_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.t1, 'String', get(handles.band_1,'value'));

play_equalizer(hObject, handles);




% --- Executes during object creation, after setting all properties.
function band_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to band_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function band_2_Callback(hObject, eventdata, handles)
% hObject    handle to band_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.t2, 'String', get(handles.band_2,'value'));

play_equalizer(hObject, handles);



% --- Executes during object creation, after setting all properties.
function band_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to band_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function band_6_Callback(hObject, eventdata, handles)
% hObject    handle to band_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.t6, 'String', get(handles.band_6,'value'));

play_equalizer(hObject, handles);



% --- Executes during object creation, after setting all properties.
function band_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to band_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function band_9_Callback(hObject, eventdata, handles)
% hObject    handle to band_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.t9, 'String', get(handles.band_9,'value'));

play_equalizer(hObject, handles);



% --- Executes during object creation, after setting all properties.
function band_9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to band_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function band_7_Callback(hObject, eventdata, handles)
% hObject    handle to band_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.t7, 'String', get(handles.band_7,'value'));

play_equalizer(hObject, handles);



% --- Executes during object creation, after setting all properties.
function band_7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to band_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function band_8_Callback(hObject, eventdata, handles)
% hObject    handle to band_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.t8, 'String', get(handles.band_8,'value'));

play_equalizer(hObject, handles);



% --- Executes during object creation, after setting all properties.
function band_8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to band_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
   
end


% --- Executes on slider movement.
function band_5_Callback(hObject, eventdata, handles)
% hObject    handle to band_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.t5, 'String', get(handles.band_5,'value'));

play_equalizer(hObject, handles);



% --- Executes during object creation, after setting all properties.
function band_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to band_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function band_4_Callback(hObject, eventdata, handles)
% hObject    handle to band_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.t4, 'String', get(handles.band_4,'value'));

play_equalizer(hObject, handles);



% --- Executes during object creation, after setting all properties.
function band_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to band_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function band_3_Callback(hObject, eventdata, handles)
% hObject    handle to band_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.t3, 'String', get(handles.band_3,'value'));
play_equalizer(hObject, handles);



% --- Executes during object creation, after setting all properties.
function band_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to band_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function t1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in input.
function input_Callback(hObject, eventdata, handles)
% hObject    handle to input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Y Fs ;
plot_input(Y, Fs);



% --- Executes on button press in output.
function output_Callback(hObject, eventdata, handles)
% hObject    handle to output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global play Fs rate;
plot_output(play,Fs*rate);





% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in filter_type.
function filter_type_Callback(hObject, eventdata, handles)
% hObject    handle to filter_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns filter_type contents as cell array
%        contents{get(hObject,'Value')} returns selected item from filter_type
play_equalizer(hObject, handles);




% --- Executes during object creation, after setting all properties.
function filter_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filter_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in rate_drop.
function rate_drop_Callback(hObject, eventdata, handles)
% hObject    handle to rate_drop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns rate_drop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from rate_drop
global rate;
contents = cellstr(get(hObject,'String'))  ;
value  = contents{get(hObject,'Value')} ;

if( strcmp(value,'normal'))
    rate = 1 ;
elseif( strcmp(value,'double'))
    rate = 2 ;
elseif( strcmp(value,'half'))
    rate = .5 ;
end



% --- Executes during object creation, after setting all properties.
function rate_drop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rate_drop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rate_value_Callback(hObject, eventdata, handles)
% hObject    handle to rate_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rate_value as text
%        str2double(get(hObject,'String')) returns contents of rate_value as a double
global rate;
rate = str2double(get(handles.rate_value,'String'))


% --- Executes during object creation, after setting all properties.
function rate_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rate_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in output_after.
function output_after_Callback(hObject, eventdata, handles)
% hObject    handle to output_after (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in bands.
function bands_Callback(hObject, eventdata, handles)
% hObject    handle to bands (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns bands contents as cell array
%        contents{get(hObject,'Value')} returns selected item from bands
contents = get(hObject,'String'); 
band = contents{get(hObject,'Value')};
global b1 b2 b3 b4 b5 b6 b7 b8 b9 Fs;
switch band
    case '1'
       plot_bands(b1, Fs,1 );
    case '2'
       plot_bands(b2, Fs,2 );
    case '3'
       plot_bands(b3, Fs,3 )
    case '4'
       plot_bands(b4, Fs,4 );
    case '5'
       plot_bands(b5, Fs,5 );
    case '6'
       plot_bands(b6, Fs,6 );
    case '7'
       plot_bands(b7, Fs,7 );
    case '8'
       plot_bands(b8, Fs,8 );
    case '9'
       plot_bands(b9, Fs,9 );
end


% --- Executes during object creation, after setting all properties.
function bands_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bands (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global play Fs; 
outfile = 'output.wav';
audiowrite(outfile,play,Fs);