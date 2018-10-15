% This file takes the output of 'bird_data_analysis' and generates means
% standard deviations, standard errors, and distributions on certain day.


load('baseline_adult.mat');
load('pitch_in_cent_combined_adult_constantshift.mat');
load('pitch_in_cent_combined_adult_constantshift_4group.mat');
load('pitch_in_cent_combined_adult_staircase.mat');
load('pitch_in_cent_combined_adult_staircase_1group.mat');

pitch_in_cent_individual_adult_constantshift = pitch_in_cent_combined_adult_constantshift;
pitch_in_cent_average_adult_constantshift = pitch_in_cent_combined_adult_constantshift_4group;
pitch_in_cent_individual_adult_staircase = pitch_in_cent_combined_adult_staircase;
pitch_in_cent_average_adult_staircase = pitch_in_cent_combined_adult_staircase_1group;

% calculate the mean and se for each bird from data.
mean_individual_adult_constantshift = zeros(20,15);
mean_individual_adult_staircase = zeros(3,48);
se_individual_adult_constantshift = zeros(20,15);
se_individual_adult_staircase = zeros(3,48);
% mean of each bird for constant shift.
for bird = 1:20
    for day = 1:15
        mean_individual_adult_constantshift(bird,day)...
            = mean(pitch_in_cent_individual_adult_constantshift{bird,day});
        L = length(pitch_in_cent_individual_adult_constantshift{bird,day});
        if L == 0
            se_individual_adult_constantshift(bird,day) = 0;
        else
            se_individual_adult_constantshift(bird,day)...
                = std(pitch_in_cent_individual_adult_constantshift{bird,day})/sqrt(max(L,2)-1);
        end
    end
end
% mean of each bird for staircase shift.
for bird = 1:3
    for day = 1:48
        mean_individual_adult_staircase(bird,day)...
            = mean(pitch_in_cent_individual_adult_staircase{bird,day});
        L = length(pitch_in_cent_individual_adult_staircase{bird,day});
        if L == 0
            se_individual_adult_staircase(bird,day) = 0;
        else
            se_individual_adult_staircase(bird,day)...
                = std(pitch_in_cent_individual_adult_staircase{bird,day})/sqrt(max(L,2)-1);
        end
    end
end

save mean_individual_adult...
    mean_individual_adult_constantshift...
    mean_individual_adult_staircase...
    se_individual_adult_constantshift...
    se_individual_adult_staircase;

% Now, calculate the mean and std for average bird.
mean_average_constantshift = zeros(4,15);
std_average_constantshift = zeros(4,15);
se_across_bird_constantshift = zeros(4,15);
se_total_constantshift = zeros(4,15);
mean_average_staircase = zeros(1,48);
std_average_staircase = zeros(1,48);
se_across_bird_staircase = zeros(1,48);
se_total_staircase = zeros(1,48);

for day = 1:15
    mean_average_constantshift(1,day) = mean(pitch_in_cent_average_adult_constantshift{1,day});
    mean_average_constantshift(2,day) = mean(pitch_in_cent_average_adult_constantshift{2,day});
    mean_average_constantshift(3,day) = mean(pitch_in_cent_average_adult_constantshift{3,day});
    mean_average_constantshift(4,day) = mean(pitch_in_cent_average_adult_constantshift{4,day});
    
    std_average_constantshift(1,day) = std(pitch_in_cent_average_adult_constantshift{1,day});
    std_average_constantshift(2,day) = std(pitch_in_cent_average_adult_constantshift{2,day});
    std_average_constantshift(3,day) = std(pitch_in_cent_average_adult_constantshift{3,day});
    std_average_constantshift(4,day) = std(pitch_in_cent_average_adult_constantshift{4,day});
    
    L = sum(~isnan(mean_individual_adult_constantshift(1:3,day)));
    se_across_bird_constantshift(1,day) = nanstd(mean_individual_adult_constantshift(1:3,day))/sqrt(max(2,L)-1);
    se_total_constantshift(1,day) = sqrt(se_across_bird_constantshift(1,day).^2+...
        sum(se_individual_adult_constantshift(1:3,day).^2)/L);
    
    L = sum(~isnan(mean_individual_adult_constantshift(4:11,day)));
    se_across_bird_constantshift(2,day) = nanstd(mean_individual_adult_constantshift(4:11,day))/sqrt(max(2,L)-1);
    se_total_constantshift(2,day) = sqrt(se_across_bird_constantshift(2,day).^2+...
        sum(se_individual_adult_constantshift(4:11,day).^2)/L);
    
    L = sum(~isnan(mean_individual_adult_constantshift(12:17,day)));
    se_across_bird_constantshift(3,day) = nanstd(mean_individual_adult_constantshift(12:17,day))/sqrt(max(2,L)-1);
    se_total_constantshift(3,day) = sqrt(se_across_bird_constantshift(3,day).^2+...
        sum(se_individual_adult_constantshift(12:17,day).^2)/L);
    
    L = sum(~isnan(mean_individual_adult_constantshift(18:20,day)));
    se_across_bird_constantshift(4,day) = nanstd(mean_individual_adult_constantshift(18:20,day))/sqrt(max(2,L)-1);
    se_total_constantshift(4,day) = sqrt(se_across_bird_constantshift(4,day).^2+...
        sum(se_individual_adult_constantshift(18:20,day).^2)/L);
end

for day = 1:48
    mean_average_staircase(1,day) = mean(pitch_in_cent_average_adult_staircase{1,day});
    
    std_average_staircase(1,day) = std(pitch_in_cent_average_adult_staircase{1,day});
    
    L = sum(~isnan(mean_individual_adult_staircase(1:3,day)));
    se_across_bird_staircase(1,day) = nanstd(mean_individual_adult_staircase(1:3,day))/sqrt(max(2,L)-1);
    se_total_staircase(1,day) = sqrt(se_across_bird_staircase(1,day).^2+...
        sum(se_individual_adult_staircase(1:3,day).^2)/L);
end

mean_average_constantshift = [mean_average_constantshift(1,1:15),mean_average_constantshift(2,1:15),...
    mean_average_constantshift(3,1:15),mean_average_constantshift(4,1:15)];
se_total_constantshift = [se_total_constantshift(1,1:15),se_total_constantshift(2,1:15),...
    se_total_constantshift(3,1:15),se_total_constantshift(4,1:15)];

mean_average_constantshift_r = [100*mean_average_constantshift(1:15)/50,100*mean_average_constantshift(16:30)/100,...
    100*mean_average_constantshift(31:45)/150,100*mean_average_constantshift(46:60)/300];
se_total_constantshift_r = [100*se_total_constantshift(1:15)/50,100*se_total_constantshift(16:30)/100,...
    100*se_total_constantshift(31:45)/150,100*se_total_constantshift(46:60)/300];
size(mean_average_constantshift_r)
square_se_total_constantshift_r = se_total_constantshift_r.^2;
square_se_total_staircase = se_total_staircase.^2;

d47_distribution = pitch_in_cent_average_adult_staircase{1,48};

save learning_data_for_plot...
    mean_average_constantshift_r...
    se_total_constantshift_r...
    square_se_total_constantshift_r...
    mean_average_staircase...
    se_total_staircase...
    square_se_total_staircase...
    std_average_constantshift...
    std_average_staircase...
    baseline_adult...
    d47_distribution;

save learning_data_for_fit...
    mean_average_constantshift_r...
    square_se_total_constantshift_r...
    mean_average_staircase...
    square_se_total_staircase...
    baseline_adult;