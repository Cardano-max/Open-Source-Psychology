% Diary liewald Experiment 
 
% Creating the figure window
f = figure;
 
% To store the reaction times for the different conditions
reaction_times = [];
 
% For loop to present stimuli over several trials
for i = 1:10
    % Generate a random number between 1 and 4 to select the box 
    box_number = round(rand()*3 + 1);
    
    % Initialize the array of the 4 white boxes
    boxes = zeros(2,2);
    
    % Make the randomly selected box black
    boxes(box_number) = 1;
    
    % Plot the figure
    subplot(1,2,1);
    image(boxes);
    set(gca,'xtick',[]);
    set(gca,'ytick',[]);
    
    % Get the current time
    start_time = tic;
    
    % Ask the user to press the corresponding key
    if box_number == 1
        disp('Press z');
        pause;
    elseif box_number == 2
        disp('Press x');
        pause;
    elseif box_number == 3
        disp('Press n');
        pause;
    else
        disp('Press m');
        pause;
    end
    
    % Calculate the reaction time
    reaction_time = toc(start_time);
    
    % Store the reaction time
    reaction_times = [reaction_times; reaction_time];
    
    % Show the reaction time
    subplot(1,2,2);
    image(boxes);
    set(gca,'xtick',[]);
    set(gca,'ytick',[]);
    title(['Reaction time: ' num2str(reaction_time)]);
    pause(2);
end
 
% Calculate the mean reaction time
mean_reaction_time = mean(reaction_times);
 
% Calculate the standard deviation of the reaction time
std_reaction_time = std(reaction_times);
 
% Plot the bar chart
subplot(1,2,2);
bar(1, mean_reaction_time);
hold on;
errorbar(1, mean_reaction_time, std_reaction_time, 'r');
title('Average Reaction Time');
xlabel('Participant');
ylabel('Reaction Time (s)');
 
% Analyse the responses using t-test
[h,p] = ttest(reaction_times);
 
% Print the result
if h == 0
    disp('Null Hypothesis is accepted. No significant difference');
else
    disp('Alternative Hypothesis is accepted. Significant difference');
end
