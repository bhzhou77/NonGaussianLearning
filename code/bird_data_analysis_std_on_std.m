% This file generates the mean and standard deviations of standard 
% deviations.

load('pitch_in_cent_combined_adult_constantshift.mat');
load('pitch_in_cent_combined_adult_staircase');
% There are 23 birds. 
% In variable pitch_in_cent_individual_adult_4shift,
% 1-3: 50-cent shift. 
% 4-11: 100-cent shift. 
% 12-17: 150-cent shift. 
% 18-20: 300-cent shift. 
% In variable pitch_in_cent_individual_adult_staircase,
% 1-3: staircase.

fourshift = pitch_in_cent_combined_adult_constantshift;
stair = pitch_in_cent_combined_adult_staircase;

N = 1000;

std_std_50_3 = zeros(N,1);
std_std_50 = zeros(N,15);
std_std_100 = zeros(N,15);
std_std_150 = zeros(N,15);
std_std_300_5 = zeros(N,1);
std_std_300 = zeros(N,15);
std_std_stair_9 = zeros(N,15);
std_std_stair_16 = zeros(N,1);
std_std_stair_38_39_41_42_43 = zeros(N,5);
std_std_stair = zeros(N,48);

f = 1.; % sample size of bootstrapping within a single bird

for bs = 1:N
    
    % day 3 for 50 cent shift
    for day = 3
        bird = datasample(2:3,2,'Replace',true);
        pitch1 = datasample(fourshift{bird(1),day},round(length(fourshift{bird(1),day})*f),'Replace',true);
        pitch2 = datasample(fourshift{bird(2),day},round(length(fourshift{bird(2),day})*f),'Replace',true);
        std_std_50_3(bs,1) = std([pitch1;pitch2]);
    end

    % the rest days for 50 cent shift
    for day = [1:2,4:15]
        bird = datasample(1:3,3,'Replace',true);
        pitch1 = datasample(fourshift{bird(1),day},round(length(fourshift{bird(1),day})*f),'Replace',true);
        pitch2 = datasample(fourshift{bird(2),day},round(length(fourshift{bird(2),day})*f),'Replace',true);
        pitch3 = datasample(fourshift{bird(3),day},round(length(fourshift{bird(3),day})*f),'Replace',true);
        std_std_50(bs,day) = std([pitch1;pitch2;pitch3]);
    end

    % for 100 cent shift
    for day = [1:3,6,7,10:13,15]
        bird = datasample(4:11,8,'Replace',true);
        pitch1 = datasample(fourshift{bird(1),day},round(length(fourshift{bird(1),day})*f),'Replace',true);
        pitch2 = datasample(fourshift{bird(2),day},round(length(fourshift{bird(2),day})*f),'Replace',true);
        pitch3 = datasample(fourshift{bird(3),day},round(length(fourshift{bird(3),day})*f),'Replace',true);
        pitch4 = datasample(fourshift{bird(4),day},round(length(fourshift{bird(4),day})*f),'Replace',true);
        pitch5 = datasample(fourshift{bird(5),day},round(length(fourshift{bird(5),day})*f),'Replace',true);
        pitch6 = datasample(fourshift{bird(6),day},round(length(fourshift{bird(6),day})*f),'Replace',true);
        pitch7 = datasample(fourshift{bird(7),day},round(length(fourshift{bird(7),day})*f),'Replace',true);
        pitch8 = datasample(fourshift{bird(8),day},round(length(fourshift{bird(8),day})*f),'Replace',true);
        std_std_100(bs,day) = std([pitch1;pitch2;pitch3;pitch4;pitch5;pitch6;pitch7;pitch8]);
    end
    for day = [4 5 8 14]
        bird = datasample(5:11,7,'Replace',true);
        pitch1 = datasample(fourshift{bird(1),day},round(length(fourshift{bird(1),day})*f),'Replace',true);
        pitch2 = datasample(fourshift{bird(2),day},round(length(fourshift{bird(2),day})*f),'Replace',true);
        pitch3 = datasample(fourshift{bird(3),day},round(length(fourshift{bird(3),day})*f),'Replace',true);
        pitch4 = datasample(fourshift{bird(4),day},round(length(fourshift{bird(4),day})*f),'Replace',true);
        pitch5 = datasample(fourshift{bird(5),day},round(length(fourshift{bird(5),day})*f),'Replace',true);
        pitch6 = datasample(fourshift{bird(6),day},round(length(fourshift{bird(6),day})*f),'Replace',true);
        pitch7 = datasample(fourshift{bird(7),day},round(length(fourshift{bird(7),day})*f),'Replace',true);
        std_std_100(bs,day) = std([pitch1;pitch2;pitch3;pitch4;pitch5;pitch6;pitch7]);
    end
    for day = 9
        bird = datasample(4:10,7,'Replace',true);
        pitch1 = datasample(fourshift{bird(1),day},round(length(fourshift{bird(1),day})*f),'Replace',true);
        pitch2 = datasample(fourshift{bird(2),day},round(length(fourshift{bird(2),day})*f),'Replace',true);
        pitch3 = datasample(fourshift{bird(3),day},round(length(fourshift{bird(3),day})*f),'Replace',true);
        pitch4 = datasample(fourshift{bird(4),day},round(length(fourshift{bird(4),day})*f),'Replace',true);
        pitch5 = datasample(fourshift{bird(5),day},round(length(fourshift{bird(5),day})*f),'Replace',true);
        pitch6 = datasample(fourshift{bird(6),day},round(length(fourshift{bird(6),day})*f),'Replace',true);
        pitch7 = datasample(fourshift{bird(7),day},round(length(fourshift{bird(7),day})*f),'Replace',true);
        std_std_100(bs,day) = std([pitch1;pitch2;pitch3;pitch4;pitch5;pitch6;pitch7]);
    end

    % for 150 cent shift
    for day = [1:12,14,15]
        bird = datasample(12:17,6,'Replace',true);
        pitch1 = datasample(fourshift{bird(1),day},round(length(fourshift{bird(1),day})*f),'Replace',true);
        pitch2 = datasample(fourshift{bird(2),day},round(length(fourshift{bird(2),day})*f),'Replace',true);
        pitch3 = datasample(fourshift{bird(3),day},round(length(fourshift{bird(3),day})*f),'Replace',true);
        pitch4 = datasample(fourshift{bird(4),day},round(length(fourshift{bird(4),day})*f),'Replace',true);
        pitch5 = datasample(fourshift{bird(5),day},round(length(fourshift{bird(5),day})*f),'Replace',true);
        pitch6 = datasample(fourshift{bird(6),day},round(length(fourshift{bird(6),day})*f),'Replace',true);
        std_std_150(bs,day) = std([pitch1;pitch2;pitch3;pitch4;pitch5;pitch6]);
    end
    for day = 13
        bird = datasample([12:14,16,17],5,'Replace',true);
        pitch1 = datasample(fourshift{bird(1),day},round(length(fourshift{bird(1),day})*f),'Replace',true);
        pitch2 = datasample(fourshift{bird(2),day},round(length(fourshift{bird(2),day})*f),'Replace',true);
        pitch3 = datasample(fourshift{bird(3),day},round(length(fourshift{bird(3),day})*f),'Replace',true);
        pitch4 = datasample(fourshift{bird(4),day},round(length(fourshift{bird(4),day})*f),'Replace',true);
        pitch5 = datasample(fourshift{bird(5),day},round(length(fourshift{bird(5),day})*f),'Replace',true);
        std_std_150(bs,day) = std([pitch1;pitch2;pitch3;pitch4;pitch5;pitch6;pitch7]);
    end

    % day 5 for 300 cent shift
    for day = 5
        bird = datasample([18,19],2,'Replace',true);
        pitch1 = datasample(fourshift{bird(1),day},round(length(fourshift{bird(1),day})*f),'Replace',true);
        pitch2 = datasample(fourshift{bird(2),day},round(length(fourshift{bird(2),day})*f),'Replace',true);
        std_std_300_5(bs,1) = std([pitch1;pitch2]);
    end

    % the rest days for 300 cent shift
    for day = [1:4,6:8,10:15]
        bird = datasample(18:20,3,'Replace',true);
        pitch1 = datasample(fourshift{bird(1),day},round(length(fourshift{bird(1),day})*f),'Replace',true);
        pitch2 = datasample(fourshift{bird(2),day},round(length(fourshift{bird(2),day})*f),'Replace',true);
        pitch3 = datasample(fourshift{bird(3),day},round(length(fourshift{bird(3),day})*f),'Replace',true);
        std_std_300(bs,day) = std([pitch1;pitch2;pitch3]);
    end

    % day 9 for stair
    for day = 9
        bird = datasample(2:3,2,'Replace',true);
        pitch1 = datasample(stair{bird(1),day},round(length(stair{bird(1),day})*f),'Replace',true);
        pitch2 = datasample(stair{bird(2),day},round(length(stair{bird(2),day})*f),'Replace',true);
        std_std_stair_9(bs,1) = std([pitch1;pitch2]);
    end

    % day 16 for stair
    for day = 16
        bird = datasample(1:2,2,'Replace',true);
        pitch1 = datasample(stair{bird(1),day},round(length(stair{bird(1),day})*f),'Replace',true);
        pitch2 = datasample(stair{bird(2),day},round(length(stair{bird(2),day})*f),'Replace',true);
        std_std_stair_16(bs,1) = std([pitch1;pitch2]);
    end

    % day 38, 39, 41, 42, 43 for stair
    i = 0;
    for day = [38,39,41,42,43]
        i = i+1;
        bird = datasample([1 3],2,'Replace',true);
        pitch1 = datasample(stair{bird(1),day},round(length(stair{bird(1),day})*f),'Replace',true);
        pitch2 = datasample(stair{bird(2),day},round(length(stair{bird(2),day})*f),'Replace',true);
        std_std_stair_38_39_41_42_43(bs,i) = std([pitch1;pitch2]);
    end

    % the rest days for stair
    for day = [1:8,10:15,17:37]
        bird = datasample(1:3,3,'Replace',true);
        pitch1 = datasample(stair{bird(1),day},round(length(stair{bird(1),day})*f),'Replace',true);
        pitch2 = datasample(stair{bird(2),day},round(length(stair{bird(2),day})*f),'Replace',true);
        pitch3 = datasample(stair{bird(3),day},round(length(stair{bird(3),day})*f),'Replace',true);
        std_std_stair(bs,day) = std([pitch1;pitch2;pitch3]);
    end
    
end

std_50_mean_std = zeros(2,15);
std_100_mean_std = zeros(2,15);
std_150_mean_std = zeros(2,15);
std_300_mean_std = zeros(2,15);

std_stair_mean_std = zeros(2,48);

for day = 1:15
    std_50_mean_std(1,day) = mean(std_std_50(:,day));
    std_50_mean_std(2,day) = std(std_std_50(:,day));
    std_100_mean_std(1,day) = mean(std_std_100(:,day));
    std_100_mean_std(2,day) = std(std_std_100(:,day));
    std_150_mean_std(1,day) = mean(std_std_150(:,day));
    std_150_mean_std(2,day) = std(std_std_150(:,day));
    std_300_mean_std(1,day) = mean(std_std_300(:,day));
    std_300_mean_std(2,day) = std(std_std_300(:,day));
end

std_50_mean_std(1,3) = mean(std_std_50_3(:,1));
std_50_mean_std(2,3) = std(std_std_50_3(:,1));
std_300_mean_std(1,5) = mean(std_std_300_5(:,1));
std_300_mean_std(2,5) = std(std_std_300_5(:,1));
std_300_mean_std(1,9) = std(fourshift{18,9});
std_300_mean_std(2,9) = 0;

for day = 1:48
    std_stair_mean_std(1,day) = mean(std_std_stair(:,day));
    std_stair_mean_std(2,day) = std(std_std_stair(:,day));
end

std_stair_mean_std(1,9) = mean(std_std_stair_9(:,1));
std_stair_mean_std(2,9) = std(std_std_stair_9(:,1));
std_stair_mean_std(1,16) = mean(std_std_stair_16(:,1));
std_stair_mean_std(2,16) = std(std_std_stair_16(:,1));
std_stair_mean_std(1,40) = std(stair{1,40});
std_stair_mean_std(2,40) = 0;
std_stair_mean_std(1,44) = std(stair{3,44});
std_stair_mean_std(2,44) = 0;
std_stair_mean_std(1,45) = std(stair{3,45});
std_stair_mean_std(2,45) = 0;
std_stair_mean_std(1,46) = std(stair{3,46});
std_stair_mean_std(2,46) = 0;
std_stair_mean_std(1,47) = std(stair{3,47});
std_stair_mean_std(2,47) = 0;
std_stair_mean_std(1,48) = std(stair{3,48});
std_stair_mean_std(2,48) = 0;

i = 0;
for day = [38 39 41 42 43]
    i = i+1;
    std_stair_mean_std(1,day) = mean(std_std_stair_38_39_41_42_43(:,i));
    std_stair_mean_std(2,day) = std(std_std_stair_38_39_41_42_43(:,i));
end

% save std_std2...
%     std_std_50_3...
%     std_std_50...
%     std_std_100...
%     std_std_150...
%     std_std_300_5...
%     std_std_300...
%     std_std_stair_9...
%     std_std_stair_16...
%     std_std_stair_38_39_41_42_43...
%     std_std_stair... 
%     std_50_mean_std... 
%     std_100_mean_std... 
%     std_150_mean_std... 
%     std_300_mean_std... 
%     std_stair_mean_std;

save learning_data_for_plot_std...
    std_50_mean_std... 
    std_100_mean_std... 
    std_150_mean_std... 
    std_300_mean_std... 
    std_stair_mean_std;
