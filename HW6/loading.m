  run ('./vlfeat-0.9.20/toolbox/vl_setup');
  % find features in all of the training set images
  % first, we need to automatically load the pics from training folders
  train_dir = './midterm_data_reduced/TrainingDataset/';
  train_classes_o = dir(train_dir);
  train_classes = train_classes_o(3:end); % getting the real subfolders
  train_imgs = struct;
  
for n = 1:length(train_classes),
    % load all images
    class_img = dir(strcat(train_dir,train_classes(n).name,'/*.jpg'));
    img_f = cell(length(class_img),1);
    img_d = cell(length(class_img),1);
   
    for i = 1:length(class_img),
      Img = imread(strcat(train_dir,train_classes(n).name,'/',class_img(i).name));
      if length(size(Img)) == 3,
        I = single(rgb2gray(Img));
      else
        I = single(Img);
      end
      % extracting SIFT features
      fprintf(strcat('current img: ', class_img(i).name,'\n'));
      [f, d] = vl_sift(I);
      img_f(i) = {f};
      img_d(i) = {d};
    end
    
    % add a class to the global feature structs
    train_imgs.f.(matlab.lang.makeValidName(train_classes(n).name)) = img_f;
    train_imgs.d.(matlab.lang.makeValidName(train_classes(n).name)) = img_d;
end