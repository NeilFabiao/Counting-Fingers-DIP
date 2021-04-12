image =imread('../Data/Medium/color.jpg');

%% Part 1 Thresholding with the hsv color band
imgHSV = rgb2hsv(image); %convert rgb image to hsv
BW = imgHSV(:,:,1) < 0.055 | imgHSV(:,:,1) > .20; %threshold image using color map values

%% Part 2 Restoring binarised image
holes=imfill(BW,'holes');%fill holes of image
se = strel('disk',30);  %Structuring element
erosion = imerode(holes,se);%eroding image erase unwanted noise in the image
se = strel('disk',60);  %Structuring element
close=imclose(erosion,se);%closing image to separate two regions of the image

%% Part 3 Extracting and counting fingers on image 
s1=strel('disk',104);%Structuring element
palm=imopen(close,s1);%opening image to achieve hand of image

fingers=close-palm;% Achieving fingers by subtracting closed image and the palm
s=strel('disk',30);%Structuring element
img=imerode(fingers,s);%eroding image to not undesired elements on finger image
[labeledImage, numberOf] = bwlabel(img);% connected component labeling
colores = label2rgb (labeledImage, 'hsv', 'k', 'shuffle'); % Using the label of the image so we can assign each finger a random color
Total = sprintf('This image has %d fingers.', numberOf); % Printing the number of coins presented in the image

%%
subplot(5,2,1), imshow(image),title('Read image')
subplot(5,2,2), imshow(imgHSV(:,:,1)) ,title('HSV image')
colormap('hsv')
colorbar;
subplot(5,2,3), imshow(BW),title('Thresholded image')
subplot(5,2,4), imshow(holes),title('Holes filled')
subplot(5,2,5), imshow(erosion),title('Eroded image')
subplot(5,2,6), imshow(close),title('Close')
subplot(5,2,7), imshow(palm),title('Palm')
subplot(5,2,8), imshow(fingers),title('Fingers')
subplot(5,2,9), imshow(colores),title(Total)
subplot(5,2,10), imshow(image),title(Total)
saveas(gcf,sprintf('../output/Implementation2.png'));