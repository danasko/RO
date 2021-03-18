% casti kodu si za/odkomentujte podla potreby, ak mate moc vela okien zavolajte prikaz:
% close all

% nacitame a zobrazime data (prezentacia strana 7/14)
load data.mat
figure;
plot(data(:,1), data(:,2),'r*');


% uloha na PC (prezentacia strana 8/14)
% centrujeme
data_centered = data - mean(data);
% spocitame W
[W, vals] = eig(cov(data_centered));
% transformujeme
newdata = data_centered * W';
% vykreslime
figure;
plot(newdata(:,1), newdata(:,2),'r*')
xlim([-2, 2])
ylim([-2, 2])

% zobrazime podiely jednotlivych smerov
v = diag(vals);
v_podiel = v./sum(v)

% uloha na funkciu PCA (z 9/14)
[coeff,score,~,~,explained,mu] = pca(data);
disp(explained)
figure;
plot(score(:,1), score(:,2),'r*')
xlim([-2, 2])
ylim([-2, 2])

% uloha (z 10/14)
% nacitanie datasetu
load ovariancancer
% zobrazime prve dva stlpce dat
figure;
gscatter(obs(:,1), obs(:,2), grp)
% aplikujeme pca
[coeff,score,~,~,explained,mu] = pca(obs);
% zistime pocet priznakov na 95 percentnu variabilitu
cs = cumsum(explained);
pocet_priz = sum(cs < 95) + 1

% zobrazime dva prve smery
figure;
gscatter(score(:,1), score(:,2),grp)


% prva uloha s12/14
load data.mat
[coeff,score,~,~,explained,mu] = pca(data);

% pretransformujeme si konce jednotkových vektorov novej sústavy do tej
% pôvodnej
dir1 = [1, 0] * coeff' + mu;
dir2 = [0, 1] * coeff' + mu;

% nakreslime povodne data
figure;
plot(data(:,1), data(:,2), 'r*')
hold on

% dokreslime smery zaciname v strede, teda v mu a koncime v transformovanom
% smere
line([mu(1), dir1(1)], [mu(2), dir1(2)])
line([mu(1), dir2(1)], [mu(2), dir2(2)])
hold off

% 2. uloha s. 12/14
% nacitema obrazok a zavolame funkciu v samostatnom m-file pozrite si ho
I = imread('leopard.jpg');
figure;
pca_color(I, 0)
I2 = imread('colorfulstreets.png');
figure;
pca_color(I2, 0)

% 3. uloha s. 12/14
% rovnako samostatny mfile
figure;
pca_color_scale(I, 0)
figure;
pca_color_scale(I2, 0)


% uloha s. 13/14
% nacitanie datasetu
load fisheriris

% aplikujeme pca
[coeff,score,~,~,explained,mu] = pca(meas);
figure;
gscatter(score(:,1), score(:,2), species)

% aplikujeme lda
[Y, W, lambdas] = LDA(meas, categorical(species));
figure;
gscatter(Y(:,1), Y(:,2), species)

% pri LDA nas zaujima najma prvy smer preto spocitame len ten
dir = W(:,1)'

% vyberieme dva stlpce napr 4. a 3.
figure;
line([-10*dir(4), 10*dir(4)], [-10*dir(3), 10*dir(3)])
hold on
gscatter(meas(:,4), meas(:,3), species)
hold off




















