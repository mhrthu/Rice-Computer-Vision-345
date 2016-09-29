  N = 1000;
  K=5;
  describ = cell(2,1); % clustered features
  k = matlab.lang.makeValidName(train_classes(1).name);
  % concatenate all features within one class
  X = cell2mat(horzcat(train_imgs.d.(k)'));
  for n = 2:length(train_classes)
    k = matlab.lang.makeValidName(train_classes(n).name);
    % concatenate all features within one class
    X = [X cell2mat(horzcat(train_imgs.d.(k)'))];
    
  end
  fprintf('\nstarting');
  % clustering all training imgs using k-means
  [tree, A] = vl_hikmeans(uint8(X),K,N);
  describ(:,1) = {tree, A};
  fprintf('\ncompleted...\n');
  

