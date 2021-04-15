% data = load('ex2data1.txt');
% X = data(:, [1, 2]); y = categorical(data(:, 3));
% 
% mdl = fitcnb(X, y);
% showCNB(mdl, X, y, 0.1);

load fisheriris;
species = categorical(species);

mdl = fitcnb(meas(:,1:2), species);
showCNB(mdl, meas(:,1:2), species, 0.01);

% mdl = fitcnb(meas(:,3:4), species);
% showCNB(mdl, meas(:,3:4), species);


