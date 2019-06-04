clear
n = input('Enter array size: ');

for i = 1:input('Enter run times: ')
E = randi(10, n);
tic
[~,~,~] = BestPath(E); %Change name to the pathing function you want to test
Time(i) = toc;
end
AvgTime = mean(Time);
disp(['Average run time was ' num2str(AvgTime, 2) ' Seconds'])