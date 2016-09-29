  N = 1000;
  cluster = cell(2,1); % clustered features
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
  [C, A] = vl_kmeans(single(X),N,'distance', 'l1', 'algorithm', 'elkan');
  cluster(:,1) = {C, A};
  fprintf('\ncompleted...\n');
  

