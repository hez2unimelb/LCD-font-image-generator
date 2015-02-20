load lcd_img_set_affine_all.mat


data=zeros(28,28,1,6400);
labels=zeros(1,6400);
count=1;
for i=1:size(charImgSet,1)
    for j=1:size(charImgSet{i},2)
        
        for k=1:size(charImgSet{i,1}{1,j},1)
            
            
            img=charImgSet{i,1}{1,j}{k,1};

            img = padarray(img,[10,10]);

            img = imresize(img,[28 28]);


            img(img<0)=0;


            img=mat2gray(img);

            img=img*255;

            img=floor(img);


            img=single(img);

            data(:,:,1,count)=img;
            
            labels(:,count)=i;
            
            
            count=count+1;
            
            
        end
        
    end
end

images.data=data;
images.labels=labels;

save('lcd_mnist_data','images');