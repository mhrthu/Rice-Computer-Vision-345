  % constructing histogram
  histo = cell(length(train_classes),1);
  figure;
  for n = 1:length(train_classes)
    Hist1 = zeros(1,N);  %#ok<PREALL>
    k = matlab.lang.makeValidName(train_classes(n).name);
    % concatenate all features within one class
    X1 = uint8(cell2mat(horzcat(train_imgs.d.(k)')));
    % find the nearest neighbors with respect to all clustered features in
    % a set
   path = vl_hikmeanspush(tree,X1) ;
    H = vl_hikmeanshist(tree,path)';

%    Hist1 = H;



      Hist1 = H(160:end);
%        thresh = mean(Hist1)*5;
%        idx=Hist1>thresh;
%       Hist1(idx) = 0;  % idx entails 
    Hist1 = Hist1/mean(Hist1);% normalizing img

    % plotting
%    subplot(length(train_classes),1,n);
        subplot(3,1,n);

    plot(Hist1);
    title(strcat('Histogram of ',num2str(N),' bins for class: ',train_classes(n).name));
    histo(n) = {Hist1};
  end