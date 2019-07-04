%Image by Randala Nyhof
im = double(imread('tractor.jpeg'))/255.0;
[imx,imy] = gradients(im);
adim = mean(abs(imx).^2+abs(imy).^2,3);

L = 2e-2;
[u,ux,uy] = l0_grad_minimization(im,L);
adu = mean(abs(ux).^2+abs(uy).^2,3);

figure;
subplot(2,2,1);
imshow(im);
subplot(2,2,2);
imshow(adim);

subplot(2,2,3);
imshow(u);
subplot(2,2,4);
imshow(adu);
colormap(jet);

imwrite(u,'result.jpg')