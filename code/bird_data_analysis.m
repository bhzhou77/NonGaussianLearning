% In this file, the original bird data from Sam's lab will be analyzed.

% General information:
% 1. There are adult bird data, also young adult bird data.
%
% 2. For adult bird data:
%    20 constant shift experiments (20 files in total):
%    in folder '/Users/bhzhou01/Desktop/ownCloud/IWorkHere/bird_data_adult_constant_shift'
%                   50 cents shift (3 files),
%                   100 cents shift (8 files),
%                   150 cents shift (6 files),
%                   300 cents shift (3 files);
%    3 staircase shift experiments (3 files in total)
%    in folder '/Users/bhzhou01/Desktop/ownCloud/IWorkHere/bird_data_adult_staircase_shift'
%
% 3. For young adult bird data:
%    7 constant shift experiments (7 files in total):
%    in folder '/Users/bhzhou01/Desktop/ownCloud/IWorkHere/bird_data_young_adult_constant_shift'
%                   100 cents shift (6 files)
%                   300 cents shift (1 file)

% Warning: 
% 1. There are missing days for some birds.
% 2. The start days of the washout period are different for different
% birds.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% First, adult bird, constant shift
%
% Here, before the washout point, all the data are grouped according to the
% day number after the shift being implemented. 
%
% However, since the washout points are different for different birds, 
% e.g., for some birds, the washout starts at day 14 (day 1 is the first 
% day of shift period), and for some birds, the washout starts at day 15 
% or day 17. Thus, I align the first day of washout for all the birds, and
% treat it as the day 15.
%
% Therefore,
% day 0----baseline
% day 1 to day 14----shift period
% day 15 to day 30----washout period (the start day aligned)
%
% Creat a 20 by 15 cell variable. For the 20 rows:
%                          1-3, 50 cents shift
%                          4-11, 100 cents shift
%                          12-17, 150 cents shift
%                          18-19, 300 cents shift
% Each element of the cell variable or each cell contains a vector of
% songs converted to have the unit of cent, and having their direction
% corrected to adapt to the positive direction. For example, if the shift
% is negative, then the adaptation is supposed to be positive, and in this
% case, the direction does not need to be changed. However, if the shift is
% positive, the data during shift days need to be put a minus sign when the
% unit is in cents.

% baseline and shift period
pitch_as_fraction_combined_adult_constantshift = cell(20,15);
pitch_in_cent_combined_adult_constantshift = cell(20,15);

myFolder = '/Users/bhzhou01/Desktop/ownCloud/IWorkHere/bird_data_adult_constant_shift';
filePattern = fullfile(myFolder,'*.mat');
sylFiles = dir(filePattern);

i = 0;
% 50 cents
for k = 1:length(sylFiles)
    baseFileName = sylFiles(k).name;
    matched = regexp(baseFileName,'(?<=_).+(?=shift)','match');
    matched = str2double(matched);
    if abs(matched) == 50
        i = i+1;
        fullFileName = fullfile(myFolder,baseFileName);
        load(fullFileName);
        tem_variable = pitch_as_fraction_combined_baseline;
        pitch_as_fraction_combined_adult_constantshift{i,1}...
            = tem_variable.^(-sign(matched));
        pitch_in_cent_combined_adult_constantshift{i,1}...
            = -sign(matched)*1200*log2(tem_variable);
        for t=2:15
            if sum(shift_days==t-1)==1
                tem_variable = pitch_as_fraction_combined_shift{1,shift_days==t-1};
                pitch_as_fraction_combined_adult_constantshift{i,t}...
                    = tem_variable.^(-sign(matched));
                pitch_in_cent_combined_adult_constantshift{i,t}...
                    = -sign(matched)*1200*log2(tem_variable);
            else
                pitch_in_cent_combined_adult_constantshift{i,t}=[];
            end
        end
    end
end
% 100 cents
for k = 1:length(sylFiles)
    baseFileName = sylFiles(k).name;
    matched = regexp(baseFileName,'(?<=_).+(?=shift)','match');
    matched = str2double(matched);
    if abs(matched) == 100
        i = i+1;
        fullFileName = fullfile(myFolder,baseFileName);
        load(fullFileName);
        tem_variable = pitch_as_fraction_combined_baseline;
        pitch_as_fraction_combined_adult_constantshift{i,1}...
            = tem_variable.^(-sign(matched));
        pitch_in_cent_combined_adult_constantshift{i,1}...
            = -sign(matched)*1200*log2(tem_variable);
        for t=2:15
            if sum(shift_days==t-1)==1
                tem_variable = pitch_as_fraction_combined_shift{1,shift_days==t-1};
                pitch_as_fraction_combined_adult_constantshift{i,t}...
                    = tem_variable.^(-sign(matched));
                pitch_in_cent_combined_adult_constantshift{i,t}...
                    = -sign(matched)*1200*log2(tem_variable);
            else
                pitch_in_cent_combined_adult_constantshift{i,t}=[];
            end
        end
    end
end
% 150 cents
for k = 1:length(sylFiles)
    baseFileName = sylFiles(k).name;
    matched = regexp(baseFileName,'(?<=_).+(?=shift)','match');
    matched = str2double(matched);
    if abs(matched) == 150
        i = i+1;
        fullFileName = fullfile(myFolder,baseFileName);
        load(fullFileName);
        tem_variable = pitch_as_fraction_combined_baseline;
        pitch_as_fraction_combined_adult_constantshift{i,1}...
            = tem_variable.^(-sign(matched));
        pitch_in_cent_combined_adult_constantshift{i,1}...
            = -sign(matched)*1200*log2(tem_variable);
        for t=2:15
            if sum(shift_days==t-1)==1
                tem_variable = pitch_as_fraction_combined_shift{1,shift_days==t-1};
                pitch_as_fraction_combined_adult_constantshift{i,t}...
                    = tem_variable.^(-sign(matched));
                pitch_in_cent_combined_adult_constantshift{i,t}...
                    = -sign(matched)*1200*log2(tem_variable);
            else
                pitch_in_cent_combined_adult_constantshift{i,t}=[];
            end
        end
    end
end
% 300 cents
for k = 1:length(sylFiles)
    baseFileName = sylFiles(k).name;
    matched = regexp(baseFileName,'(?<=_).+(?=shift)','match');
    matched = str2double(matched);
    if abs(matched) == 300
        i = i+1;
        fullFileName = fullfile(myFolder,baseFileName);
        load(fullFileName);
        tem_variable = pitch_as_fraction_combined_baseline;
        pitch_as_fraction_combined_adult_constantshift{i,1}...
            = tem_variable.^(-sign(matched));
        pitch_in_cent_combined_adult_constantshift{i,1}...
            = -sign(matched)*1200*log2(tem_variable);
        for t=2:15
            if sum(shift_days==t-1)==1
                tem_variable = pitch_as_fraction_combined_shift{1,shift_days==t-1};
                pitch_as_fraction_combined_adult_constantshift{i,t}...
                    = tem_variable.^(-sign(matched));
                pitch_in_cent_combined_adult_constantshift{i,t}...
                    = -sign(matched)*1200*log2(tem_variable);
            else
                pitch_in_cent_combined_adult_constantshift{i,t}=[];
            end
        end
    end
end

save pitch_as_fraction_combined_adult_constantshift pitch_as_fraction_combined_adult_constantshift
save pitch_in_cent_combined_adult_constantshift pitch_in_cent_combined_adult_constantshift

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Then group things together.
pitch_in_cent_combined_adult_constantshift_4group = cell(4,15);

% 50 cent shift
for t = 1:15
    for i = 1:3
        pitch_in_cent_combined_adult_constantshift_4group{1,t} = [pitch_in_cent_combined_adult_constantshift_4group{1,t};pitch_in_cent_combined_adult_constantshift{i,t}];
    end
end
% 100 cent shift
for t = 1:15
    for i = 4:11
        pitch_in_cent_combined_adult_constantshift_4group{2,t} = [pitch_in_cent_combined_adult_constantshift_4group{2,t};pitch_in_cent_combined_adult_constantshift{i,t}];
    end
end
% 150 cent shift
for t = 1:15
    for i = 12:17
        pitch_in_cent_combined_adult_constantshift_4group{3,t} = [pitch_in_cent_combined_adult_constantshift_4group{3,t};pitch_in_cent_combined_adult_constantshift{i,t}];
    end
end
% 300 cent shift
for t = 1:15
    for i = 18:20
        pitch_in_cent_combined_adult_constantshift_4group{4,t} = [pitch_in_cent_combined_adult_constantshift_4group{4,t};pitch_in_cent_combined_adult_constantshift{i,t}];
    end
end

save pitch_in_cent_combined_adult_constantshift_4group pitch_in_cent_combined_adult_constantshift_4group


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Staircase
pitch_as_fraction_combined_adult_staircase = cell(3,48);
pitch_in_cent_combined_adult_staircase = cell(3,48);

% bird 1
load '/Users/bhzhou01/Desktop/ownCloud/IWorkHere/bird_data_adult_staircase_shift/pu4bk11_SHIFT_EXPERIMENT_COMBINED_TEST';
for t=1:48
    if sum(day_num_vector==t)==1
        pitch_as_fraction_combined_tem=[];
        for i=1:length(syl_name)
            pitch_as_fraction_combined_tem=[pitch_as_fraction_combined_tem;data_by_block_and_syl{day_num_vector==t,i}/mean(data_by_block_and_syl{1,i})];
        end
        pitch_as_fraction_combined_adult_staircase{1,t}=pitch_as_fraction_combined_tem;
        pitch_in_cent_combined_adult_staircase{1,t} = 1200*log2(pitch_as_fraction_combined_adult_staircase{1,t});
    else
        pitch_as_fraction_combined_adult_staircase{1,t} = [];
        pitch_in_cent_combined_adult_staircase{1,t} = [];
    end
end

% bird 2
load '/Users/bhzhou01/Desktop/ownCloud/IWorkHere/bird_data_adult_staircase_shift/pu41br476_SHIFT_EXPERIMENT_COMBINED_TEST';
for t=1:48
    if sum(day_num_vector==t)==1
        pitch_as_fraction_combined_tem=[];
        for i=1:length(syl_name)
            pitch_as_fraction_combined_tem=[pitch_as_fraction_combined_tem;mean(data_by_block_and_syl{1,i})./data_by_block_and_syl{day_num_vector==t,i}];
        end
        pitch_as_fraction_combined_adult_staircase{2,t}=pitch_as_fraction_combined_tem;
        pitch_in_cent_combined_adult_staircase{2,t} = 1200*log2(pitch_as_fraction_combined_adult_staircase{2,t});
    else
        pitch_as_fraction_combined_adult_staircase{2,t}=[];
        pitch_in_cent_combined_adult_staircase{2,t} = [];
    end
end


% bird 3
load '/Users/bhzhou01/Desktop/ownCloud/IWorkHere/bird_data_adult_staircase_shift/pu98bk46_SHIFT_EXPERIMENT_COMBINED_TEST';
for t=1:48
    if sum(day_num_vector==t)==1
        pitch_as_fraction_combined_tem=[];
        for i=1:length(syl_name)
            pitch_as_fraction_combined_tem=[pitch_as_fraction_combined_tem;mean(data_by_block_and_syl{1,i})./data_by_block_and_syl{day_num_vector==t,i}];
        end
        pitch_as_fraction_combined_adult_staircase{3,t}=pitch_as_fraction_combined_tem;
        pitch_in_cent_combined_adult_staircase{3,t} = 1200*log2(pitch_as_fraction_combined_adult_staircase{3,t});
    else
        pitch_as_fraction_combined_adult_staircase{3,t}=[];
        pitch_in_cent_combined_adult_staircase{3,t} = [];
    end
end

save pitch_as_fraction_combined_adult_staircase pitch_as_fraction_combined_adult_staircase;
save pitch_in_cent_combined_adult_staircase pitch_in_cent_combined_adult_staircase;


% Then group things together.
pitch_in_cent_combined_adult_staircase_1group = cell(1,48);

for t = 1:48
    for i = 1:3
        pitch_in_cent_combined_adult_staircase_1group{1,t} = [pitch_in_cent_combined_adult_staircase_1group{1,t};pitch_in_cent_combined_adult_staircase{i,t}];
    end
end

save pitch_in_cent_combined_adult_staircase_1group pitch_in_cent_combined_adult_staircase_1group


% put all baseline data together
baseline_adult = [];
for g = 1:4
    baseline_adult = [baseline_adult;pitch_in_cent_combined_adult_constantshift_4group{g,1}];
end
baseline_adult = [baseline_adult;pitch_in_cent_combined_adult_staircase_1group{1,1}];

save baseline_adult baseline_adult

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% washout period, assuming the first day documented is the real first day
% of washout period.
pitch_in_cent_combined_adult_constantshift_washout = cell(20,14);

myFolder = '/Users/bhzhou01/Desktop/ownCloud/IWorkHere/bird_data_adult_constant_shift';
filePattern = fullfile(myFolder,'*.mat');
sylFiles = dir(filePattern);

i = 0;
% 50 cents
for k = 1:length(sylFiles)
    baseFileName = sylFiles(k).name;
    matched = regexp(baseFileName,'(?<=_).+(?=shift)','match');
    matched = str2double(matched);
    if abs(matched) == 50
        i = i+1;
        fullFileName = fullfile(myFolder,baseFileName);
        load(fullFileName);
        for t=1:14
            diff_days = washout_days-washout_days(1)+1;
            if sum(diff_days==t)==1
                tem_variable = pitch_as_fraction_combined_washout{1,diff_days==t};
                pitch_in_cent_combined_adult_constantshift_washout{i,t}...
                    = -sign(matched)*1200*log2(tem_variable);
            else
                pitch_in_cent_combined_adult_constantshift_washout{i,t}=[];
            end
        end
    end
end
% 100 cents
for k = 1:length(sylFiles)
    baseFileName = sylFiles(k).name;
    matched = regexp(baseFileName,'(?<=_).+(?=shift)','match');
    matched = str2double(matched);
    if abs(matched) == 100
        i = i+1;
        fullFileName = fullfile(myFolder,baseFileName);
        load(fullFileName);
        for t=1:14
            diff_days = washout_days-washout_days(1)+1;
            if sum(diff_days==t)==1
                tem_variable = pitch_as_fraction_combined_washout{1,diff_days==t};
                pitch_in_cent_combined_adult_constantshift_washout{i,t}...
                    = -sign(matched)*1200*log2(tem_variable);
            else
                pitch_in_cent_combined_adult_constantshift_washout{i,t}=[];
            end
        end
    end
end
% 150 cents
for k = 1:length(sylFiles)
    baseFileName = sylFiles(k).name;
    matched = regexp(baseFileName,'(?<=_).+(?=shift)','match');
    matched = str2double(matched);
    if abs(matched) == 150
        i = i+1;
        fullFileName = fullfile(myFolder,baseFileName);
        load(fullFileName);
        for t=1:14
            diff_days = washout_days-washout_days(1)+1;
            if sum(diff_days==t)==1
                tem_variable = pitch_as_fraction_combined_washout{1,diff_days==t};
                pitch_in_cent_combined_adult_constantshift_washout{i,t}...
                    = -sign(matched)*1200*log2(tem_variable);
            else
                pitch_in_cent_combined_adult_constantshift_washout{i,t}=[];
            end
        end
    end
end
% 300 cents
for k = 1:length(sylFiles)
    baseFileName = sylFiles(k).name;
    matched = regexp(baseFileName,'(?<=_).+(?=shift)','match');
    matched = str2double(matched);
    if abs(matched) == 300
        i = i+1;
        fullFileName = fullfile(myFolder,baseFileName);
        load(fullFileName);
        for t=1:14
            diff_days = washout_days-washout_days(1)+1;
            if sum(diff_days==t)==1
                tem_variable = pitch_as_fraction_combined_washout{1,diff_days==t};
                pitch_in_cent_combined_adult_constantshift_washout{i,t}...
                    = -sign(matched)*1200*log2(tem_variable);
            else
                pitch_in_cent_combined_adult_constantshift_washout{i,t}=[];
            end
        end
    end
end

% Then group things together.
pitch_in_cent_combined_adult_constantshift_washout_4group = cell(4,14);

% 50 cent shift
for i = 1:3
    for t = 1:14
        pitch_in_cent_combined_adult_constantshift_washout_4group{1,t} = [pitch_in_cent_combined_adult_constantshift_washout_4group{1,t};pitch_in_cent_combined_adult_constantshift_washout{i,t}];
    end
end
% 100 cent shift
for i = 4:11
    for t = 1:14
        pitch_in_cent_combined_adult_constantshift_washout_4group{2,t} = [pitch_in_cent_combined_adult_constantshift_washout_4group{2,t};pitch_in_cent_combined_adult_constantshift_washout{i,t}];
    end
end
% 150 cent shift
for i = 12:17
    for t = 1:14
        pitch_in_cent_combined_adult_constantshift_washout_4group{3,t} = [pitch_in_cent_combined_adult_constantshift_washout_4group{3,t};pitch_in_cent_combined_adult_constantshift_washout{i,t}];
    end
end
% 300 cent shift
for i = 18:20
    for t = 1:14
        pitch_in_cent_combined_adult_constantshift_washout_4group{4,t} = [pitch_in_cent_combined_adult_constantshift_washout_4group{4,t};pitch_in_cent_combined_adult_constantshift_washout{i,t}];
    end
end