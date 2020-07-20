close 
close all
load('521282S_data_3.mat')
load('521282S_data_3.mat', 'Fs')
load('521282S_data_3.mat', 't')
load('521282S_data_3.mat', 'signal')
load('521282S_data_3.mat', 'channelNames')

%%
topoplot([],'channellocations.locs','style','blank','electrodes','labelpoint')

%%
total_power=[];
relative_delta_power=[];
relative_alpha_power=[]
for i=1:13
   [S,F,T,P] = spectrogram(signal(i,:),30*Fs,29*Fs,[0.1:0.1:32],Fs);
   total_power=[total_power sum(P)'];
   relative_delta_power=[relative_delta_power (sum(P(10:40))./sum(P)')];
   relative_alpha_power=[relative_alpha_power (sum(P(80:120))./sum(P)')];
end

T1=T(1);
T2=find(T==2*60);
T3=find(T==5*60);
T4=find(T==7*60);

figure()
subplot(2,2,1)
topoplot(log10(total_power(T1,:)),'channellocations.locs','electrodes','labels','style','map','maplimits','maxmin')
subplot(2,2,2)
topoplot(log10(total_power(T2,:)),'channellocations.locs','electrodes','labels','style','map','maplimits','maxmin')
subplot(2,2,3)
topoplot(log10(total_power(T3,:)),'channellocations.locs','electrodes','labels','style','map','maplimits','maxmin')
subplot(2,2,4)
topoplot(log10(total_power(T4,:)),'channellocations.locs','electrodes','labels','style','map','maplimits','maxmin')


frontal_elcrodes_sum=total_power(:,1)+total_power(:,3)+total_power(:,4)+total_power(:,10)

rear_elcrodes_sum=total_power(:,7)+total_power(:,9)+total_power(:,12)+total_power(:,13)

figure()
plot(T/60, log10(frontal_elcrodes_sum),'b')
hold on
plot(T/60, log10(rear_elcrodes_sum),'r')

%%
figure()
subplot(4,2,1)
topoplot(relative_delta_power(T1,:),'channellocations.locs','maplimits',[0,1])
subplot(4,2,2)
topoplot(relative_delta_power(T2,:),'channellocations.locs','electrodes','labels','style','map','maplimits',[0,1])
subplot(4,2,3)
topoplot(relative_delta_power(T3,:),'channellocations.locs','electrodes','labels','style','map','maplimits',[0,1])
subplot(4,2,4)
topoplot(relative_delta_power(T4,:),'channellocations.locs','electrodes','labels','style','map','maplimits',[0,1])

subplot(4,2,5)
topoplot(relative_alpha_power(T1,:),'channellocations.locs','electrodes','labels','style','map','maplimits',[0,1])
subplot(4,2,6)
topoplot(relative_alpha_power(T2,:),'channellocations.locs','electrodes','labels','style','map','maplimits',[0,1])
subplot(4,2,7)
topoplot(relative_alpha_power(T3,:),'channellocations.locs','electrodes','labels','style','map','maplimits',[0,1])
subplot(4,2,8)
topoplot(relative_alpha_power(T4,:),'channellocations.locs','electrodes','labels','style','map','maplimits',[0,1])


