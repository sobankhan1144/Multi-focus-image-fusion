clear all %#ok<CLALL>
clc


image1=imread('1.jpg');
image2=imread('2.jpg');
image3=imread('3.jpg');
image4=imread('4.jpg');
image5=imread('5.jpg');

im1 = rgb2gray(image1);
im2 = rgb2gray(image2);
im3 = rgb2gray(image3);
im4 = rgb2gray(image4);
im5 = rgb2gray(image5);

im1=imresize(im1,0.2);
im2=imresize(im2,0.2);
im3=imresize(im3,0.2);
im4=imresize(im4,0.2);
im5=imresize(im5,0.2);


x=1:8;
y=[1.69,1.78,1.57,1.59,1.65,1.68,1.70,1.71];
p1=polyfit(x,y,7);
x1=linspace(1,5,100);
f1=polyval(p1,x1);
p2=diff(p1);
p3=diff(p1,2);
p4=diff(p1,3);

%{
subplot(3,1,1),plot(x1,f1);
f2=polyval(p2,x1);
subplot(4,1,2),plot(x1,f2);
f3=polyval(p3,x1);
subplot(4,1,3),plot(x1,f3);
f4=polyval(p4,x1);
subplot(4,1,4),plot(x1,f4);

f1=polyval(p1,x1);
plot(x1,f1);





subplot(2,3,1), imshow(im1)
subplot(2,3,2), imshow(im2)
subplot(2,3,3), imshow(im3)
subplot(2,3,4), imshow(im4)
subplot(2,3,5), imshow(im5)


imf=cat(3,im1,im2,im3,im4,im5);



for row=106:116
    for col=405:415
        for deapth=1:5
            y(deapth)=imf(row,col,deapth)/10;
        end
        p=polyfit(x,y,4);
        f1=polyval(p,x1);
        subplot(10,10,num),plot(x1,f1);
        num=num+1;
    end
end
