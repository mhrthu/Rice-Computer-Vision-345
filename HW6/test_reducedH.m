  testing_dir = './midterm_data_reduced/TestDataset_';
  %testing_dir = './midterm_data_expanded/TestDataset_';

  result = zeros(length(histo));
 
  for n = 1:length(histo)
      co=n;
    imgs = dir(strcat(testing_dir,num2str(n)));
    imgs = imgs(3:end);
    for i = 1:length(imgs)
      I = rgb2gray(imread(strcat(testing_dir,num2str(n),'/',imgs(i).name)));
      [~, d] = vl_sift(single(I)); % find the SIFT feature descriptors
   path = vl_hikmeanspush(tree,d) ;
    H = vl_hikmeanshist(tree,path)';
      % threshholding
%      thresh = mean(H)*2.5;
 %     idx=H>thresh;
 %     H(idx) = 0;  % idx entails 
      temp_x = H(400:end);
      % construct the test img's histogram
      %temp_x(idx)=1;
     % for ii = 1:length(idx)
      %  temp_x(idx(ii)) = temp_x(idx(ii)) + 1;
    %  end
      temp_x = temp_x/(mean(temp_x));% normalizing img
      pred = knnsearch(cell2mat(vertcat(histo)),temp_x);
      result(n,pred)=result(n,pred)+1;
    %  fprintf(strcat(imgs(i).name, ' is identified as: ', num2str(pred),'\n'));
    end
  end
  result= result./repmat(sum(result,2),1,length(histo))
 
  %end