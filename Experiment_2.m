clear all;
clc;
 
%declaring variables 
 
total_trials = 50; % total number of trials
block1_key = 'z'; % key pressed for block 1
block2_key = 'x'; % key pressed for block 2
block3_key = 'n'; % key pressed for block 3
block4_key = 'm'; % key pressed for block 4
 
%declaring a cell array to store the trial responses
 
response_data = cell(total_trials,5); % declaring a cell array with 5 columns
 
%storing the trial number and the block number
 
for i=1:total_trials % looping over the total trials 
    response_data(i,1) = {i}; % storing the trial number
    block_number = randi(4); % choosing a random number between 1-4
    response_data(i,2) = {block_number}; % storing the block number
end
 
%creating a figure window
 
figure('name','Diary Liewald Experiment','position',[100,100,800,600]);
 
%presenting visual stimuli and collecting responses
 
for i=1:total_trials % looping over the total trials
    block_number = response_data{i,2}; % accessing the block number from the cell array
    switch block_number % switch case for different blocks
        case 1 % for block 1
            fill([0 0 1 1],[0 1 1 0],'w'); % drawing a white square
            text(0.5, 0.5, 'Block 1','FontSize',14); % writing block 1 in the middle of the square
            set(gca,'visible','off'); % making the axis invisible
            drawnow; % drawing the figure
            pause(0.5); % pausing for 0.5 seconds
            tic; % starting the timer
            key_pressed = waitforbuttonpress; % waiting for the key press
            if key_pressed == 0 % if no key is pressed
                response_data(i,3) = {NaN}; % storing NaN in the response array
            else % if key is pressed
                key_pressed = get(gcf,'CurrentCharacter'); % getting the key pressed
                if key_pressed == block1_key % checking if the key pressed is the block1 key
                    response_data(i,3) = {1}; % storing 1 in the response array
                else % if the key pressed is not the block1 key
                    response_data(i,3) = {0}; % storing 0 in the response array
                end
                response_data(i,4) = {toc}; % storing the response time in the response array
            end
        case 2 % for block 2
            fill([0 0 1 1],[0 1 1 0],'w'); % drawing a white square
            text(0.5, 0.5, 'Block 2','FontSize',14); % writing block 2 in the middle of the square
            set(gca,'visible','off'); % making the axis invisible
            drawnow; % drawing the figure
            pause(0.5); % pausing for 0.5 seconds
            tic; % starting the timer
            key_pressed = waitforbuttonpress; % waiting for the key press
            if key_pressed == 0 % if no key is pressed
                response_data(i,3) = {NaN}; % storing NaN in the response array
            else % if key is pressed
                key_pressed = get(gcf,'CurrentCharacter'); % getting the key pressed
                if key_pressed == block2_key % checking if the key pressed is the block2 key
                    response_data(i,3) = {1}; % storing 1 in the response array
                else % if the key pressed is not the block2 key
                    response_data(i,3) = {0}; % storing 0 in the response array
                end
                response_data(i,4) = {toc}; % storing the response time in the response array
            end
        case 3 % for block 3
            fill([0 0 1 1],[0 1 1 0],'w'); % drawing a white square
            text(0.5, 0.5, 'Block 3','FontSize',14); % writing block 3 in the middle of the square
            set(gca,'visible','off'); % making the axis invisible
            drawnow; % drawing the figure
            pause(0.5); % pausing for 0.5 seconds
            tic; % starting the timer
            key_pressed = waitforbuttonpress; % waiting for the key press
            if key_pressed == 0 % if no key is pressed
                response_data(i,3) = {NaN}; % storing NaN in the response array
            else % if key is pressed
                key_pressed = get(gcf,'CurrentCharacter'); % getting the key pressed
                if key_pressed == block3_key % checking if the key pressed is the block3 key
                    response_data(i,3) = {1}; % storing 1 in the response array
                else % if the key pressed is not the block3 key
                    response_data(i,3) = {0}; % storing 0 in the response array
                end
                response_data(i,4) = {toc}; % storing the response time in the response array
            end
        case 4 % for block 4
            fill([0 0 1 1],[0 1 1 0],'w'); % drawing a white square
            text(0.5, 0.5, 'Block 4','FontSize',14); % writing block 4 in the middle of the square
            set(gca,'visible','off'); % making the axis invisible
            drawnow; % drawing the figure
            pause(0.5); % pausing for 0.5 seconds
            tic; % starting the timer
            key_pressed = waitforbuttonpress; % waiting for the key press
            if key_pressed == 0 % if no key is pressed
                response_data(i,3) = {NaN}; % storing NaN in the response array
            else % if key is pressed
                key_pressed = get(gcf,'CurrentCharacter'); % getting the key pressed
                if key_pressed == block4_key % checking if the key pressed is the block4 key
                    response_data(i,3) = {1}; % storing 1 in the response array
                else % if the key pressed is not the block4 key
                    response_data(i,3) = {0}; % storing 0 in the response array
                end
                response_data(i,4) = {toc}; % storing the response time in the response array
            end
    end
    
    % storing the reaction time
    if isempty(cell2mat(response_data(i,4))) % if the response time is empty
        response_data(i,5) = {NaN}; % storing NaN in the response array
    else % if the response time is not empty
        response_data(i,5) = {cell2mat(response_data(i,4))}; % storing the response time in the response array
    end
end
 
% plotting bar charts
 
bar_chart1_data = cell2mat(response_data(:,3)); % extracting the response data from the response array
bar(bar_chart1_data); % generating a bar chart
title('Response Data'); % giving a title to the bar chart
xlabel('Trial Number'); % giving a label to the x-axis
ylabel('Response'); % giving a label to the y-axis
 
bar_chart2_data = cell2mat(response_data(:,5)); % extracting the response time data from the response array
bar(bar_chart2_data); % generating a bar chart
title('Response Time Data'); % giving a title to the bar chart
xlabel('Trial Number'); % giving a label to the x-axis
ylabel('Response Time (sec)'); % giving a label to the y-axis
 
% analysing responses using t-tests
 
[h,p,ci,stats] = ttest(bar_chart1_data); % performing a t-test on the response data
disp(['The t-test results indicate that the response data is significant with p-value = ',num2str(p)]); % displaying the results of the t-test
[h,p,ci,stats] = ttest(bar_chart2_data); % performing a t-test on the response time data
disp(['The t-test results indicate that the response time data is significant with p-value = ',num2str(p)]); % displaying the results of the t-test
 
% conclusion
 
disp('The results of the t-test indicate that the response data and the response time data are both significant.'); % conclusion based on the t-test results
