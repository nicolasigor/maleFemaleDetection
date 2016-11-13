%LBP
%ENTRADA
%grayImage: imagen de entrada.
%partition: entero que indica el numero de divisiones por dimension.
%uniform: boolean que indica si es que se quiere uniform LBP
%truncate: en caso uniforme, boolean que indica ignorar los no uniformes.
%SALIDA
%LBPImage: imagen LBP
%feats: vector con los histogramas concatenados.
function [LBPImage, feats] = lbpFeatureExtractor(grayImage, partition, uniform, truncate)

%LUT para los patrones uniformes.
LUT = [0,1,2,3,4,58,5,6,7,58,58,58,8,58,9,10,11,58,58,58,58,58,58,58,12,58,58,58,13,58,...
        14,15,16,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,17,58,58,58,58,58,58,58,18,...
        58,58,58,19,58,20,21,22,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,...
        58,58,58,58,58,58,58,58,58,58,58,58,23,58,58,58,58,58,58,58,58,58,58,58,58,58,...
        58,58,24,58,58,58,58,58,58,58,25,58,58,58,26,58,27,28,29,30,58,31,58,58,58,32,58,...
        58,58,58,58,58,58,33,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,34,58,58,58,58,...
        58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,...
        58,35,36,37,58,38,58,58,58,39,58,58,58,58,58,58,58,40,58,58,58,58,58,58,58,58,58,...
        58,58,58,58,58,58,41,42,43,58,44,58,58,58,45,58,58,58,58,58,58,58,46,47,48,58,49,...
        58,58,58,50,51,52,58,53,54,55,56,57];

%Calcular imagen LBP
[rows, columns, ~] = size(grayImage);
LBPImage = uint8(zeros(rows-2, columns-2));
for row = 2 : rows - 1   
    for col = 2 : columns - 1
        %pixel central como umbral
        centerPixel = grayImage(row, col);
        %pasar umbrales
        pixel7=grayImage(row-1, col-1) >= centerPixel;  
        pixel6=grayImage(row-1, col  ) >= centerPixel;   
        pixel5=grayImage(row-1, col+1) >= centerPixel;  
        pixel4=grayImage(row,   col+1) >= centerPixel;     
        pixel3=grayImage(row+1, col+1) >= centerPixel;    
        pixel2=grayImage(row+1, col  ) >= centerPixel;      
        pixel1=grayImage(row+1, col-1) >= centerPixel;     
        pixel0=grayImage(row,   col-1) >= centerPixel;
        %calcular valor binario
        auxLBP = pixel7 * 2^7 + pixel6 * 2^6 + ...
            pixel5 * 2^5 + pixel4 * 2^4 + ...
            pixel3 * 2^3 + pixel2 * 2^2 + ...
            pixel1 * 2 + pixel0;
        if (uniform)
            LBPImage(row-1, col-1) = uint8(LUT(auxLBP+1));
        else
            LBPImage(row-1, col-1) = uint8(auxLBP);
        end
    end  
end 

%divisiones de la imagen
stepCellV = floor((rows-2)/partition);
stepCellH = floor((columns-2)/partition);

%armar histogramas
if (uniform)
    %nbins = 59;
    vEdges = (-0.5):1:58.5;
else
    %nbins = 256;
    vEdges = (-0.5):1:255.5;
end
feats = [];
for i = 1:partition
    for j = 1:partition
        intervalRows = i:(i+stepCellV-1);
        intervalColumns = j:(j+stepCellH-1);
        auxCell = LBPImage( intervalRows, intervalColumns);
        [N,~] = histcounts(auxCell, vEdges);
        %Eliminar patrones no uniformes
        if (truncate && uniform)
            N = N(1:(end-1));
        end
        %Normalizar histogramas
        N = N/sum(N);
        %Concatenar histogramas
        feats = [feats, N];
    end
end

