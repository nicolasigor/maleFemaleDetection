function DataBaseCreator(direction)
faceDetector = vision.CascadeObjectDetector('ClassificationModel','FrontalFaceLBP');
strh = strcat(direction,'/Hombres/*.bmp');
strm = strcat(direction,'/Mujeres/*.bmp');
imagefilesH = dir(strh);
imagefilesM = dir(strm);
nfilesH = length(imagefilesH);
nfilesM = length(imagefilesM);
mkdir('BaseDeDatos','CarasHombres');
mkdir('BaseDeDatos','CarasMujeres');
for h=1:nfilesH   
 currentfilename = strcat(direction,'/Hombres/',imagefilesH(h).name);
 currentimage = imread(currentfilename);
 I = histeq(currentimage);
   bboxes = step(faceDetector, I);
   IFaces = insertObjectAnnotation(I, 'rectangle', bboxes, 'Face');
   if(size(bboxes,1)>0)
       if (size(bboxes,1)>1)
           [M,index] = max(bboxes(:,3));
           bboxes=bboxes(index,:);
       end        
        IfaceDetected = I((bboxes(1,2):(bboxes(1,2)+bboxes(1,4)-1)),(bboxes(1,1):(bboxes(1,1)+bboxes(1,3)-1)));
        %segunda ecualizacion debido a fondos muy contrastados(claros u
        %oscuros)
        Prueba = histeq(IfaceDetected);
        filename2=['BaseDeDatos/CarasHombres/hombre (' num2str(h) ').bmp'];
        imwrite(Prueba, filename2);
   end
end
for m=1:nfilesM
 currentfilename = strcat(direction,'/Mujeres/',imagefilesM(m).name);
 currentimage = imread(currentfilename);
 I = histeq(currentimage);
   bboxes = step(faceDetector, I);
   IFaces = insertObjectAnnotation(I, 'rectangle', bboxes, 'Face');
   if(size(bboxes,1)>0)
       if (size(bboxes,1)>1)
           [M,index] = max(bboxes(:,3));
           bboxes=bboxes(index,:);
       end        
        IfaceDetected = I((bboxes(1,2):(bboxes(1,2)+bboxes(1,4)-1)),(bboxes(1,1):(bboxes(1,1)+bboxes(1,3)-1)));
        %segunda ecualizacion debido a fondos muy contrastados(claros u
        %oscuros)
        Prueba = histeq(IfaceDetected);
        filename2=['BaseDeDatos/CarasMujeres/mujer (' num2str(m) ').bmp'];
        imwrite(Prueba, filename2);
   end
end