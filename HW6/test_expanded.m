  testing_dir = './midterm_data_expanded/TestDataset/TestDataset_';
  ExpandedResult = zeros(length(histo));
  for n = 1:length(histo)
      co=n;
    imgs = dir(strcat(testing_dir,num2str(n)));
    imgs = imgs(3:end);
    for i = 1:length(imgs)
      Img = imread(strcat(testing_dir,num2str(n),'/',imgs(i).name));
      if length(size(Img)) == 3,
        I = single(rgb2gray(Img));
      else
        I = single(Img);
      end
      %I = rgb2gray(imread(strcat(testing_dir,num2str(n),'/',imgs(i).name)));
      [~, d] = vl_sift(single(I)); % find the SIFT feature descriptors
   path = vl_hikmeanspush(tree,d) ;
    H = vl_hikmeanshist(tree,path)';
      % sort of threshholding

      Hist1 = H(160:end);

% normalizing histogram
      Hist1 = Hist1/(mean(Hist1));
      pred = knnsearch(cell2mat(vertcat(histo)),Hist1);
      ExpandedResult(n,pred)=ExpandedResult(n,pred)+1;
    end
  end
  ExpandedResult= ExpandedResult./repmat(sum(ExpandedResult,2),1,length(histo))
 
  %end