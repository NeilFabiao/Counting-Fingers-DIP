image =imread('../Data/Medium/color.jpg');

%% Part 1 Thresholding with the hsv color band
imgHSV = rgb2hsv(image); %convert rgb image to hsv

%code avaliable during July 👍🏾

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