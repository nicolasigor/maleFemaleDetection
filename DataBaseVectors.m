close all
clear all
%filename = ['CarasHombres/hombre (5).bmp'];
%J = imread(filename);
%[LBPImage, feats] = lbpFeatureExtractor(J, 7, 1, 0);%% hacer matriz con 1
%figure, imshow(LBPImage, 'DisplayRange',[0,59]);
%figure, bar(feats);
%DataBaseCreator('BaseDeDatos');

%ejecutable para hombres

partition = 1;

strh = strcat('BaseDeDatos/CarasHombres/*.bmp');
strm = strcat('BaseDeDatos/CarasMujeres/*.bmp');
imagefilesH = dir(strh);
imagefilesM = dir(strm);
nfilesH = length(imagefilesH);
nfilesM = length(imagefilesM);
%mkdir('BaseDeDatos','CarasHombres');
%mkdir('BaseDeDatos','CarasMujeres');
currentfilename = ['BaseDeDatos/CarasHombres/hombre (1).bmp'];
 currentimage = imread(currentfilename);
 [~, feats] = lbpFeatureExtractor(currentimage, partition, 1,0);
 Raw=zeros(nfilesH+nfilesM,length(feats)+1);
 %R(:,1)=1;
 Raw(1,2:end)=feats(1:end);
for h=2:nfilesH   
 currentfilename = ['BaseDeDatos/CarasHombres/hombre (' num2str(h) ').bmp'];
 currentimage = imread(currentfilename);
[~, feats] = lbpFeatureExtractor(currentimage, partition, 1,0);
 Raw(h,2:end)=feats(1:end);
 
end
 %%
  Raw(nfilesH+1:end,1)=1;  
for m=1:nfilesM
 currentfilename = ['BaseDeDatos/CarasMujeres/mujer (' num2str(m) ').bmp'];
 currentimage = imread(currentfilename);
 [~, feats] = lbpFeatureExtractor(currentimage, partition, 1,0);
 Raw(h+m,2:end)=feats(1:end);
end

%%

csvwrite('LBPsinTruncarRaw1.csv',Raw);

%%

currentfilename = ['BaseDeDatos/CarasHombres/hombre (1).bmp'];
 currentimage = imread(currentfilename);
 
 [~, feats] = lbpFeatureExtractor(currentimage, partition, 1,1);
 R=zeros(nfilesH+nfilesM,length(feats)+1);
 %R(:,1)=1;
 R(1,2:end)=feats(1:end);
 
for h=2:nfilesH   
 currentfilename = ['BaseDeDatos/CarasHombres/hombre (' num2str(h) ').bmp'];
 currentimage = imread(currentfilename);
 [~, feats] = lbpFeatureExtractor(currentimage, partition, 1,1);
 R(h,2:end)=feats(1:end);
 
end
 %%
 R(nfilesH+1:end,1)=1; 
for m=1:nfilesM
 currentfilename = ['BaseDeDatos/CarasMujeres/mujer (' num2str(m) ').bmp'];
 currentimage = imread(currentfilename);
 [~, feats] = lbpFeatureExtractor(currentimage, partition, 1,1);
 R(h+m,2:end)=feats(1:end);
end

%%

csvwrite('LBPTruncadoRaw1.csv',R);

