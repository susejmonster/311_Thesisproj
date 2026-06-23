coins = imread("looseChange.png");
imshow(coins)

[c,r] = imfindcircles(coins,[6 20], ...
    ObjectPolarity="dark", ...
    Sensitivity=0.9)

imshow(coins)
viscircles(c,r);

idxDimes = r < 13;
imshow(coins);
viscircles(c(idxDimes,:),r(idxDimes));

nDimes = nnz(idxDimes);
valueDimes = nDimes*0.1;