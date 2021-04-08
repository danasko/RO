load patients;

Gender = categorical(Gender);
SAHS = categorical(SelfAssessedHealthStatus);

g = dummyvar(Gender);
s = dummyvar(SAHS);

X = [Age Diastolic g Height s Systolic Weight];
y = Smoker;

% split data to train/[val]/test

rng(25)
p = randperm(length(y));
X = X(p,:);
y = y(p,:);
split1 = floor(length(y)/100 * 80);
% split2 = floor(length(y)/100 * 90);

trainX = X(1:split1,:);
trainY = y(1:split1);
% valX = X(split1+1:split2,:);
% valY = y(split1+1:split2);
% testX = X(split2+1:end,:);
% testY = y(split2+1:end);
testX = X(split1+1:end,:);
testY = y(split1+1:end);

disp('# Train/Test samples')
disp(size(trainX,1))
% disp(size(valX,1))
disp(size(testX,1))

Mdl = fitcsvm(trainX, trainY);

test_pred = Mdl.predict(testX);
test_acc = sum(test_pred == testY)/length(testY);
disp('test_acc')
disp(test_acc)