% Instantiate the class (it automatically maps out the 99,999 images)
exporter = ExportIMG();

% Check the total number of linked images
totalImages = exporter.GetTotalCount();
fprintf('Class linked successfully to %d images.\n', totalImages);

% Preview the 1st image using the class method
exporter.Preview(1);

% Or manually grab the raw image pixel data to pass into a model
myImage = exporter.LoadImage(5);


BW = im2gray(myImage);
imshow(BW);
[edges,thresh] = edge(BW, "canny");
imshow(edges);

mainimg = edge(BW , "canny" , [thresh(1) thresh(2)]);
imshow(mainimg);
%[defaultEdges,thresh] = edge(gs)
%circles = im2gray(circles);
%[defaultEdges,thresh] = edge(circles);

%circEdge = edge(circles,thresh/2);
%[adjEdge,thresh] = edge(circles,"log");
%imshow(adjEdge)