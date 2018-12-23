%function[]= embed(infor, key,u);
close all
clear all
img_org=imread('QR1.png');
%image=rgb2gray(img_org);
image=img_org
msg_origin = unicode2native('hahahahayouaremymoney1234564878998987:1176.71', 'UTF-8');  % UTF-8 encode, 'EOT' is the end tag
msg_bin = dec2bin(msg_origin, 8);  % convert to binary
msg = strjoin(cellstr(msg_bin)','');
[width,high,alpha]=size(image);
reflect=[];
for i=1 : width
    for j=1 : high
        reflect(i+width*j)=image(i,j);
    end
end

N=size(msg,2);
position=[];
k=[];
k(1)=0.2;
u=4;
for i=1 : N-1    
    k(i+1)=u*k(i)*(1-k(i));
end
for i=1 : N
    position(i)=fix((width*width-1)*k(i))+width;
end
j=1;
for i=position
    msg_tmp=msg(j);
    reflect(i)=msg_tmp;
    disp(reflect(i));
    j=j+1;
end
for i=1 : width
    for j=1 : high
        image_end(i,j)=reflect(i+width*j);
    end
end
image_result = uint8(image_end);
imshow(image_result);
imwrite(image_result, 'result.png'); 
