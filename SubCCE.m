warning('off');
prompt = {'Name:', 'Email:'};
dlg_title = 'Observer Details';
num_lines = 1;
global NAME;
global EMAIL;
defaultans = {'Fred','fred@gmail.com'};
answer = inputdlg(prompt,dlg_title, num_lines,defaultans);
IO_Folder = uigetdir('Select the Original Image folder');
I1_Folder = uigetdir('Select the Method 1 Image folder');
I2_Folder = uigetdir('Select the Method 2 Image folder');
I3_Folder = uigetdir('Select the Method 3 Image folder');

NAME = answer{1}; EMAIL = answer{2};
CCE_RO(IO_Folder,I1_Folder,I2_Folder,I3_Folder)
