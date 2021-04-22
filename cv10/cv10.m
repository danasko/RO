load fisheriris;

species = categorical(species);
rng(25)
p = randperm(length(species));
meas = meas(p,:);
species = species(p,:);
split1 = floor(length(species)/100 * 70);

trainX = meas(1:split1,:);
trainY = species(1:split1);
testX = meas(split1+1:end,:);
testY = species(split1+1:end);

%% confusion matrix, precision and recall

% Mdl = fitcecoc(trainX, trainY);
% y_pred = Mdl.predict(testX);
% C = confusionchart(testY, y_pred);
% 
% cats = categories(species);
% for c=1:length(cats)
%    class = cats(c);
%    y = testY == class;
%    yp = y_pred == class;
%    tp = sum(y ==1 & yp ==1);
%    fp = sum(yp==1 & y==0);
%    fn = sum(yp==0 & y==1);
%    prec = tp/(tp+fp);
%    recall = tp/(tp+fn);
%    fprintf("precision for class %s: %0.3f\n", cell2mat(class), prec);
%    fprintf("recall for class %s: %0.3f\n", cell2mat(class), recall);
% end

%% decision tree

% MdlT = fitctree(trainX, trainY);
% MdlT.view('Mode','graph');

load census1994;

MdlT = fitctree(adultdata, 'salary');
% MdlT.view('Mode','graph');
preds = MdlT.predict(adulttest);
acc = sum(preds==adulttest.salary)/length(preds)*100;
fprintf("acc w/o pruning: %0.3f%%\n", acc);

MdlP = prune(MdlT,'Alpha',0.0001);
MdlP = prune(MdlT,'Level',120);
% MdlP = prune(MdlT,'Nodes',3000);
preds = MdlP.predict(adulttest);
acc = sum(preds==adulttest.salary)/length(preds)*100;
fprintf("acc with pruning: %0.3f%%\n", acc);
MdlP.view('Mode','graph');
