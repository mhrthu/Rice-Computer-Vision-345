  % constructing histogram
  histo = cell(length(train_classes),1);
  figure;
  for n = 1:length(train_classes)
    Hist1 = zeros(1,N);
    k = matlab.lang.makeValidName(train_classes(n).name);
    % concatenate all features within one class
    X1 = single(cell2mat(horzcat(train_imgs.d.(k)')));
    % find the nearest neighbors with respect to all clustered features in
    % a set
    [idx,D] = knnsearch(cluster{1,1}',X1','distance','cityblock');
    % threshholding
    thresh = median(D)*1.7;
    idx(D>thresh) = [];
    % calculate historgram based on the thresholded features
    for i = 1:length(idx)
      Hist1(idx(i)) = Hist1(idx(i)) + 1;
    end
    Hist1 = Hist1./length(idx);% normalizing img
    
    % plotting
    subplot(length(train_classes),1,n);
    plot(Hist1);
    title(strcat('Histogram of ',num2str(N),' bins for class: ',train_classes(n).name));
    histo(n) = {Hist1};
  end