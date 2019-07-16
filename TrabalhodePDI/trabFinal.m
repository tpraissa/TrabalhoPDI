pkg load image

P = imread('placa3.png');

%%%Escala cinza
Pgray = rgb2gray(P);

%%%%Binariza imagem
PB = im2bw (Pgray);


%%%%Sobel Gradient
kx = [1 ,0 ,-1; 2,0,-2; 1, 0 ,-1];
ky = [1,2,1; 0,0, 0; -1, -2 ,-1];

H = conv2(im2double(PB),kx,'same');
V = conv2(im2double(PB),ky,'same');
E = sqrt(H.*H + V.*V);

%%%%Dilatação
se1 = strel([1 1 1])
PD = imdilate(E, se1);

%%%%%Filtro
PH =  imfill(PD, 'holes'); 

%%%%Limpar as bordas
PBR = imclearborder(PH, 8);

imshow(PBR);