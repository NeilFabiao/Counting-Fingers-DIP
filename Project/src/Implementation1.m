number = randi(2);% random number generator to select random image
image = sprintf('../Data/Medium/%d.jpg', number);% string with location of random image
I = imread(image);% reading random image using string above

%code avaliable during July 👍🏾

subplot(6,2,1), imshow(I), title('Original Image');
subplot(6,2,2), imhist(I), title('Histogram of Image');

subplot(6,2,3), imshow(I1), title('Gray scaled image');
subplot(6,2,4), imshow(A), title('Thresholded image');

subplot(6,2,5), imshow(I2), title('Complement of Image');
subplot(6,2,6), imshow(holes), title('Filling holes of Image');

subplot(6,2,7), imshow(open), title('Opening Image');
subplot(6,2,8), imshow(palm), title('Eroding to get Palm of Image');

subplot(6,2,9), imshow(hand), title('Hand of Image restored Image');
subplot(6,2,10), imshow(fingers), title('Fingers');

subplot(6,2,11), imshow(colores), title(Total);
subplot(6,2,12), imshow(image), title(Total);

saveas(gcf,sprintf('../output/Implementation1.png'));