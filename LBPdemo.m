close all

%Leer imagen preprocesada
img = imread('mujer (27).bmp');
figure, imshow(img), title('Pre-processed face');

%%
%Numero de divisiones por dimension
n_partition  = 4; %habran n_partition^2 celdas.

%%
%Aplicar LBP no uniforme
[LBPImgNotU, featsNotU] = lbpFeatureExtractor(img, n_partition, 0, 1);

%Mostrar resultados
figure, imshow(LBPImgNotU), title('LBP image');
imwrite(LBPImgNotU, 'LBP image.bmp');
titleName = sprintf('LBP Histogram with %d partitions',n_partition);
figure, bar(featsNotU), title(titleName);
saveas(gcf,titleName,'bmp');

%%
%Aplicar LBP uniforme
[LBPImgU, featsU] = lbpFeatureExtractor(img, n_partition, 1, 0);

%Mostrar resultados
figure, imshow(LBPImgU,'DisplayRange',[0,58]), title('Uniform LBP image');
imwrite(LBPImgNotU, 'Uniform LBP image.bmp');
titleName = sprintf('Uniform LBP Histogram with %d partitions',n_partition);
figure, bar(featsU), title(titleName);
saveas(gcf,titleName,'bmp');

%%
%Aplicar LBP uniforme truncado
%[LBPImgU, featsU] = lbpFeatureExtractor(img, n_partition, 1, 1);

%Mostrar resultados
%figure, imshow(LBPImgU,'DisplayRange',[0,57]), title('Uniform LBP image');
%figure, bar(featsU), title(sprintf('Truncated uniform LBP Histogram with %d partitions',n_partition));