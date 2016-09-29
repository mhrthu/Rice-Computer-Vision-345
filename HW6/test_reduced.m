%function result = test_reduced(describ,histo)
  testing_dir = './midterm_data_reduced/TestDataset_';
  ReducedResult = zeros(length(histo));
  for n = 1:length(histo)
    imgs = dir(strcat(testing_dir,num2str(n)));
    imgs = imgs(3:end);
    for i = 1:length(imgs)
      I = rgb2gray(imread(strcat(testing_dir,num2str(n),'/',imgs(i).name)));
      [~, d] = vl_sift(single(I)); % find the SIFT feature descriptors
      [idx,D] = knnsearch(cell2mat(cluster(1,:))',single(d)','distance','cityblock'); % identify nearest clustered features from individual features
      % threshholding
      thresh = median(D)*1.7;
      idx(D>thresh) = [];  % idx entails 
      Hist1 = zeros(1,1000);
      % construct the test img's histogram
      for i = 1:length(idx)
        Hist1(idx(i)) = Hist1(idx(i)) + 1;
      end
      Hist1 = Hist1./length(idx);% normalizing img
      pred = knnsearch(cell2mat(vertcat(histo)),Hist1);
      ReducedResult(n,pred)=ReducedResult(n,pred)+1;
    end
  end
  ReducedResult= ReducedResult./repmat(sum(ReducedResult,2),1,length(histo))
 
  %end