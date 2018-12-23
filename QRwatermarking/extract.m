close all;
clear all;
image=imread('result.png');
[width,high,alpha]=size(image);
position=[];
key=0.2;
u=4;
lenth=360;
reflect=[];
    for i=1 : width
        for j=1:high
             reflect(i+width*j)=image(i,j);
        end
    end
    k(1)=key;
    for i=1:lenth-1
        k(i+1)=u*k(i)*(1-k(i));
    end
    for i=1 : lenth
        position(i)=fix((width*width-1)*k(i))+width;
    end
    watermarking=[];
    index=1;
    for i=position
        %msg_num=reflect(i);
        msg_num=reflect(i)-'0';
        disp(reflect(i));
        watermarking(index)=msg_num;
        index=index+1;
    end
    msg=blanks(104);
    len=size(watermarking,2);
    msg=num2str(watermarking);
    msg_bin=strrep(msg,' ','');
    index=1;
    msg_origin='';
    for i=1:8:size(watermarking,2)-7
        rgb(index) = bin2dec(msg_bin(i : i+7));
        msg_origin =native2unicode(rgb, 'UTF-8');
        index=index+1;
    end
    disp(msg_origin);
        