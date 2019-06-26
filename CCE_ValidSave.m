function bool = CCE_ValidSave( handles,status,IFolder,dispOrder,FilesList,timer)
%CCE_VALIDSAVE Summary of this function goes here
%   Detailed explanation goes here
bool=0;
score(1)=get(handles.choice_btn_Img1,'String');
score(2)=get(handles.Choice_btn_Img2,'String');
score(3)=get(handles.choice_btn_Img3,'String');
score(4)=get(handles.choice_btn_Img4,'String');

global NAME;
global EMAIL;
if size(unique(score),2)~=4
    return;
end
tElapsed = toc(timer);
format shortg
currTime = clock;
currTime = sprintf('%.0f.' , currTime);
currTime = currTime(1:end-1);
for k=1:4 
    if (dispOrder(k)==1)
%         folder_name=IFolder.IO_Folder;
%         IM_Name=FilesList.FILELISTO(status.order(status.current)).name;
%         Marks=score(k);
%         RandDispOrder=k;
%         randlist=status.current;
%         Origsort=status.order(status.current);
        [~, deepestFolder] = fileparts(IFolder.IO_Folder);
        T1{1}=deepestFolder;
        T1{2}=FilesList.FILELISTO(status.order(status.current)).name;
        T1{3}=convscore(score(k));
        T1{4}=k;
        T1{5}=status.current;
        T1{6}=status.order(status.current);
        T1{7}=tElapsed;
        T1{8}=currTime;
        T1{9}=NAME;
        T1{10}=EMAIL;
    end
    if (dispOrder(k)==2)
         [~, deepestFolder] = fileparts(IFolder.I1_Folder);
        T2{1}=deepestFolder;
        T2{2}=FilesList.FILELIST1(status.order(status.current)).name;
        T2{3}=convscore(score(k));
        T2{4}=k;
        T2{5}=status.current;
        T2{6}=status.order(status.current);
        T2{7}=tElapsed;
        T2{8}=currTime;
        T2{9}=NAME;
        T2{10}=EMAIL;
%         T2 = table(folder_name,IM_Name,Marks,RandDispOrder,randlist,Origsort,tElapsed,'RowNames',randlist);
    end
    if (dispOrder(k)==3)
        [~, deepestFolder] = fileparts(IFolder.I2_Folder);
         T3{1}=deepestFolder;
         T3{2}=FilesList.FILELIST2(status.order(status.current)).name;
         T3{3}=convscore(score(k));
         T3{4}=k;
         T3{5}=status.current;
         T3{6}=status.order(status.current);
         T3{7}=tElapsed;
         T3{8}=currTime;
         T3{9}=NAME;
         T3{10}=EMAIL;
%         T3 = table(folder_name,IM_Name,Marks,RandDispOrder,randlist,Origsort,tElapsed,'RowNames',randlist);
    end
    if (dispOrder(k)==4)
        [~, deepestFolder] = fileparts(IFolder.I3_Folder);
         T4{1}=deepestFolder;
         T4{2}=FilesList.FILELIST3(status.order(status.current)).name;
         T4{3}=convscore(score(k));
         T4{4}=k;
         T4{5}=status.current;
         T4{6}=status.order(status.current);
         T4{7}=tElapsed;
         T4{8}=currTime;
         T4{9}=NAME;
         T4{10}=EMAIL;
%         T4 = table(folder_name,IM_Name,Marks,RandDispOrder,randlist,Origsort,tElapsed,'RowNames',randlist);

    end
end

bool=1;

Prev = readtable('Data.txt', 'Delimiter',' ','ReadVariableNames',true);

headers = {'Folder','Image','Score','RandDispOrder','randlist','Origsort','tElapsed','Clock','Name','Email'};
T = [T1; T2; T3;T4];
res=cell2table(T);
res.Properties.VariableNames = headers;
if (size(Prev,1)==0)
    MERGERESULT=res;
else
    MERGERESULT=[Prev;res];
end

writetable(MERGERESULT,'Data.txt','Delimiter',' ')
end

function Numscore = convscore(score)
if score=='A'
    Numscore=4;

elseif score=='B'
    Numscore=3;

elseif score=='C'
    Numscore=2;
else
    Numscore=1;
end

end