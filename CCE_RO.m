function varargout = CCE_RO(varargin)
% CCE_RO MATLAB code for CCE_RO.fig
%      CCE_RO, by itself, creates a new CCE_RO or raises the existing
%      singleton*.
%
%      H = CCE_RO returns the handle to a new CCE_RO or the handle to
%      the existing singleton*.
%
%      CCE_RO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CCE_RO.M with the given input arguments.
%
%      CCE_RO('Property','Value',...) creates a new CCE_RO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CCE_RO_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CCE_RO_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CCE_RO

% Last Modified by GUIDE v2.5 12-Jul-2016 15:36:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CCE_RO_OpeningFcn, ...
                   'gui_OutputFcn',  @CCE_RO_OutputFcn, ...
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


% --- Executes just before CCE_RO is made visible.
function CCE_RO_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CCE_RO (see VARARGIN)

% Choose default command line output for CCE_RO
handles.output = hObject;
% set(handles.output, 'units','normalized','outerposition',[0 0 1 1]);
% set(handles.output,'Position',[0,0,3000,2000]);
%set(handles.output, 'units','normalized','outerposition',[0 0 1 1]);
% Update handles structure
guidata(hObject, handles);
set(hObject, 'units','normalized','outerposition',[0 0 1 1]);
set(hObject, 'color', [0.5, 0.5, 0.5]);
config_Envir(handles)
global FilesList;
global status;
global IFolder;
IFolder.IO_Folder=varargin{1};
IFolder.I1_Folder=varargin{2};
IFolder.I2_Folder=varargin{3};
IFolder.I3_Folder=varargin{4};
cd(IFolder.IO_Folder);
FilesList.FILELISTO=dir('*png');
cd(IFolder.I1_Folder);
FilesList.FILELIST1=dir('*png');
cd(IFolder.I2_Folder);
FilesList.FILELIST2=dir('*png');
cd(IFolder.I3_Folder);
FilesList.FILELIST3=dir('*png');
[M,~] = size(FilesList.FILELISTO);
R = randperm(M)';
status.order=R;
status.current=0;
cd ..
im0=imread('im0.png');
im1=imread('im2.png');
im2=imread('im3.png');
im3=imread('im4.png');
global DIspOrd;

%Order=[1 2 3 4];
DIspOrd = struct('flag',1,'Order',[1 2 3 4]);

set(handles.next_Img,'String','START');
dispaly_images(handles,im0,im1,im2,im3)



% axis image
%feval(handles.FirstImg);

function dispaly_images(handles,im1,im2,im3,im4)
% first image
[w,h,~]=size(im1);
pos=getpixelposition(handles.FirstImg);
x0shift=(pos(3)-w)/2;
y0shift=(pos(4)-h)/2;
axes(handles.FirstImg);
imshow(im1);
set(handles.FirstImg,'position', [pos(1)+x0shift,pos(2)+y0shift  w h]) 
truesize;
%second image
[w,h,~]=size(im2);
pos=getpixelposition(handles.SecondImg);
x0shift=(pos(3)-w)/2;
y0shift=(pos(4)-h)/2;
axes(handles.SecondImg);
imshow(im2);
set(handles.SecondImg,'position', [pos(1)+x0shift,pos(2)+y0shift  w h]) 
truesize;
%Third Image
[w,h,~]=size(im3);
pos=getpixelposition(handles.ThirdImg);
x0shift=(pos(3)-w)/2;
y0shift=(pos(4)-h)/2;
axes(handles.ThirdImg);
imshow(im3);
set(handles.ThirdImg,'position', [pos(1)+x0shift,pos(2)+y0shift  w h]) 
truesize;
% Fourth Image
[w,h,~]=size(im4);
pos=getpixelposition(handles.FourthImg);
x0shift=(pos(3)-w)/2;
y0shift=(pos(4)-h)/2;
axes(handles.FourthImg);
imshow(im4);
set(handles.FourthImg,'position', [pos(1)+x0shift,pos(2)+y0shift  w h]) 
truesize;

drawnow;

% UIWAIT makes CCE_RO wait for user response (see UIRESUME)
% uiwait(handles.figure1);
function config_Envir(handles)
set(handles.choice_btn_Img1,'String',' ');
set(handles.Choice_btn_Img2,'String',' ');
set(handles.choice_btn_Img3,'String',' ');
set(handles.choice_btn_Img4,'String',' ');
set(handles.prog_txt,'String',' ');
% FOr Image one buttons
jButton = java(findjobj(handles.A_click_I1));
jButton.setBorderPainted(0);
jButton = java(findjobj(handles.B_btn_Img1));
jButton.setBorderPainted(0);
jButton = java(findjobj(handles.C_btn_Img1));
jButton.setBorderPainted(0);
jButton = java(findjobj(handles.D_btn_Img1));
jButton.setBorderPainted(0);
% For image Two buttons
jButton = java(findjobj(handles.A_click_I2));
jButton.setBorderPainted(0);
jButton = java(findjobj(handles.B_click_I2));
jButton.setBorderPainted(0);
jButton = java(findjobj(handles.C_click_I2));
jButton.setBorderPainted(0);
jButton = java(findjobj(handles.D_click_I2));
jButton.setBorderPainted(0);
%For image three buttons
jButton = java(findjobj(handles.A_btn_img3));
jButton.setBorderPainted(0);
jButton = java(findjobj(handles.B_btn_Img3));
jButton.setBorderPainted(0);
jButton = java(findjobj(handles.C_btn_Img3));
jButton.setBorderPainted(0);
jButton = java(findjobj(handles.D_btn_Img3));
jButton.setBorderPainted(0);
% For image four buttons
jButton = java(findjobj(handles.A_btn_Img4));
jButton.setBorderPainted(0);
jButton = java(findjobj(handles.B_btn_Img4));
jButton.setBorderPainted(0);
jButton = java(findjobj(handles.C_btn_img4));
jButton.setBorderPainted(0);
jButton = java(findjobj(handles.D_btn_Img4));
jButton.setBorderPainted(0);
jButton = java(findjobj(handles.next_Img));
jButton.setBorderPainted(0);



% --- Outputs from this function are returned to the command line.
function varargout = CCE_RO_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%set(handles.output,'Position',[0,0,3000,2000]);
%set(handles.output, 'units','normalized','outerposition',[0 0 1 1]);
% Get default command line output from handles structure

varargout{1} = handles.output;
set(handles.output, 'units','normalized','outerposition',[0 0 1 1]);
 set(handles.output,'Position',[0,0,3000,2000]);


% --- Executes on mouse press over axes background.
function FirstImg_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to FirstImg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function SecondImg_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to SecondImg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function ThirdImg_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to ThirdImg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function FourthImg_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to FourthImg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in A_click_I1.
function A_click_I1_Callback(hObject, eventdata, handles)
% hObject    handle to A_click_I1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.choice_btn_Img1,'String','A');

% --- Executes on button press in B_btn_Img1.
function B_btn_Img1_Callback(hObject, eventdata, handles)
% hObject    handle to B_btn_Img1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.choice_btn_Img1,'String','B');
% --- Executes on button press in C_btn_Img1.
function C_btn_Img1_Callback(hObject, eventdata, handles)
% hObject    handle to C_btn_Img1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.choice_btn_Img1,'String','C');

% --- Executes on button press in D_btn_Img1.
function D_btn_Img1_Callback(hObject, eventdata, handles)
% hObject    handle to D_btn_Img1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.choice_btn_Img1,'String','D');


% --- Executes on button press in A_click_I2.
function A_click_I2_Callback(hObject, eventdata, handles)
% hObject    handle to A_click_I2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.Choice_btn_Img2,'String','A');

% --- Executes on button press in B_click_I2.
function B_click_I2_Callback(hObject, eventdata, handles)
% hObject    handle to B_click_I2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.Choice_btn_Img2,'String','B');


% --- Executes on button press in C_click_I2.
function C_click_I2_Callback(hObject, eventdata, handles)
% hObject    handle to C_click_I2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.Choice_btn_Img2,'String','C');


% --- Executes on button press in D_click_I2.
function D_click_I2_Callback(hObject, eventdata, handles)
% hObject    handle to D_click_I2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.Choice_btn_Img2,'String','D');


% --- Executes on button press in A_btn_img3.
function A_btn_img3_Callback(hObject, eventdata, handles)
% hObject    handle to A_btn_img3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.choice_btn_Img3,'String','A');
% --- Executes on button press in B_btn_Img3.
function B_btn_Img3_Callback(hObject, eventdata, handles)
% hObject    handle to B_btn_Img3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.choice_btn_Img3,'String','B');

% --- Executes on button press in C_btn_Img3.
function C_btn_Img3_Callback(hObject, eventdata, handles)
% hObject    handle to C_btn_Img3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.choice_btn_Img3,'String','C');

% --- Executes on button press in D_btn_Img3.
function D_btn_Img3_Callback(hObject, eventdata, handles)
% hObject    handle to D_btn_Img3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.choice_btn_Img3,'String','D');

% --- Executes on button press in A_btn_Img4.
function A_btn_Img4_Callback(hObject, eventdata, handles)
% hObject    handle to A_btn_Img4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.choice_btn_Img4,'String','A');

% --- Executes on button press in B_btn_Img4.
function B_btn_Img4_Callback(hObject, eventdata, handles)
% hObject    handle to B_btn_Img4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.choice_btn_Img4,'String','B');

% --- Executes on button press in C_btn_img4.
function C_btn_img4_Callback(hObject, eventdata, handles)
% hObject    handle to C_btn_img4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.choice_btn_Img4,'String','C');

% --- Executes on button press in D_btn_Img4.
function D_btn_Img4_Callback(hObject, eventdata, handles)
% hObject    handle to D_btn_Img4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.choice_btn_Img4,'String','D');


% --- Executes on button press in next_Img.
function next_Img_Callback(hObject, eventdata, handles)
% hObject    handle to next_Img (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global FilesList;
global status;
global IFolder;
global DIspOrd;
global timer;

if status.current==0
    status.current=status.current+1;
    set(handles.next_Img,'String','CONTINUE');
    set(handles.choice_btn_Img1,'String',' ');
    set(handles.Choice_btn_Img2,'String',' ');
    set(handles.choice_btn_Img3,'String',' ');
    set(handles.choice_btn_Img4,'String',' ');
    
    return;
end
if strcmp (get(handles.next_Img,'String'),'CONTINUE')
    set(handles.choice_btn_Img1,'String',' ');
    set(handles.Choice_btn_Img2,'String',' ');
    set(handles.choice_btn_Img3,'String',' ');
    set(handles.choice_btn_Img4,'String',' ');
end
 
if status.current==size(status.order,1)
        set(handles.next_Img,'String','FINISH');
else
        set(handles.next_Img,'String','NEXT');
end
IM_Name=FilesList.FILELISTO(status.order(status.current)).name;
cd(IFolder.IO_Folder);
im{1}=imread(IM_Name);
IM_Name=FilesList.FILELIST1(status.order(status.current)).name;
cd(IFolder.I1_Folder);
im{2}=imread(IM_Name);
IM_Name=FilesList.FILELIST2(status.order(status.current)).name;
cd(IFolder.I2_Folder);
im{3}=imread(IM_Name);
IM_Name=FilesList.FILELIST3(status.order(status.current)).name;
cd(IFolder.I3_Folder);
im{4}=imread(IM_Name);
cd ../.
if(status.current==1&& DIspOrd.flag==1)
DIspOrd.Order=randperm(4);
DIspOrd.flag=0;
timer = tic; 
end

dispaly_images(handles,im{DIspOrd.Order(1)},im{DIspOrd.Order(2)},im{DIspOrd.Order(3)},im{DIspOrd.Order(4)});
str=strcat(num2str(status.current),'/',num2str(size(status.order,1)));
set(handles.prog_txt,'String',str);
bool = CCE_ValidSave( handles,status,IFolder,DIspOrd.Order,FilesList,timer);

if bool==1
    status.current=status.current+1;
    DIspOrd.flag=0;
    set(handles.choice_btn_Img1,'String',' ');
    set(handles.Choice_btn_Img2,'String',' ');
    set(handles.choice_btn_Img3,'String',' ');
    set(handles.choice_btn_Img4,'String',' ');
    timer = tic; 
    if status.current==size(status.order,1)
            set(handles.next_Img,'String','FINISH');
    else
            set(handles.next_Img,'String','NEXT');
    end
    if status.current>size(status.order,1)
        close(handles.figure1)
         return;
    end
   
    IM_Name=FilesList.FILELISTO(status.order(status.current)).name;
    cd(IFolder.IO_Folder);
    im{1}=imread(IM_Name);
    IM_Name=FilesList.FILELIST1(status.order(status.current)).name;
    cd(IFolder.I1_Folder);
    im{2}=imread(IM_Name);
    IM_Name=FilesList.FILELIST2(status.order(status.current)).name;
    cd(IFolder.I2_Folder);
    im{3}=imread(IM_Name);
    IM_Name=FilesList.FILELIST3(status.order(status.current)).name;
    cd(IFolder.I3_Folder);
    im{4}=imread(IM_Name);
    cd ../.

    DIspOrd.Order=randperm(4);

    dispaly_images(handles,im{DIspOrd.Order(1)},im{DIspOrd.Order(2)},im{DIspOrd.Order(3)},im{DIspOrd.Order(4)});  
    str=strcat(num2str(status.current),'/',num2str(size(status.order,1)));
    set(handles.prog_txt,'String',str);
end
