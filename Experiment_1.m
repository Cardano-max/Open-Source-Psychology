% Define variables 
prompt = {'Enter your name:', 'Enter your age:'};
dlg_title = 'Input';
num_lines = 1;
defaultans = {'Name', 'Age'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
name = answer(1);
age = answer(2);
 
% Initialize the experiment
disp('Welcome to the choice response experiment with time, please press any key to begin the experiment');
pause;
 
% Begin experiment
disp('You will now be presented with four white boxes on the screen');
disp('One box will randomly turn black, and you will be required to press the corresponding key on the keyboard');
disp('The corresponding keys for four boxes is:');
disp('Block 1 has trigger key as ''z'' on keyboard');
disp('Block 2 has trigger key as ''x'' on keyboard');
disp('Block 3 has trigger key as ''n'' on keyboard');
disp('Block 4 has trigger key as ''m'' on keyboard');
 
% Generate random blocks
numTrials = 20;
blocks = randi([1 4], 1, numTrials);
 
% Create a figure window
figure('Name','Choice Response Experiment with Time', 'NumberTitle', 'off');
set(gcf, 'Position', [500,500,500,500]);
 
% Loop through each trial
for i = 1:numTrials
    % Present the stimulus
    switch blocks(i)
        case 1
            disp('Block 1 is presented');
            block1 = uicontrol('Style', 'text', 'String', 'Block 1', 'Position', [175,200,150,50]);
            pause(2);
            delete(block1);
        case 2
            disp('Block 2 is presented');
            block2 = uicontrol('Style', 'text', 'String', 'Block 2', 'Position', [175,200,150,50]);
            pause(2);
            delete(block2);
        case 3
            disp('Block 3 is presented');
            block3 = uicontrol('Style', 'text', 'String', 'Block 3', 'Position', [175,200,150,50]);
            pause(2);
            delete(block3);
        case 4
            disp('Block 4 is presented');
            block4 = uicontrol('Style', 'text', 'String', 'Block 4', 'Position', [175,200,150,50]);
            pause(2);
            delete(block4);
    end
    
    % Collect response
    disp('Press the corresponding key on the keyboard');
    tic
    keyPressed = waitforbuttonpress;
    if keyPressed == 0
        disp('Key was not pressed');
        responseTime(i) = NaN;
    else
        responseTime(i) = toc;
        % Check if the key pressed is correct
        switch blocks(i)
            case 1
                if strcmp(get(gcf,'CurrentCharacter'),'z')
                    disp('Correct!');
                else
                    disp('Incorrect!');
                end
            case 2
                if strcmp(get(gcf,'CurrentCharacter'),'x')
                    disp('Correct!');
                else
                    disp('Incorrect!');
                end
            case 3
                if strcmp(get(gcf,'CurrentCharacter'),'n')
                    disp('Correct!');
                else
                    disp('Incorrect!');
                end
            case 4
                if strcmp(get(gcf,'CurrentCharacter'),'m')
                    disp('Correct!');
                else
                    disp('Incorrect!');
                end
        end
    end
end
 
% Visualise the data
figure('Name', 'Experiment Results', 'NumberTitle', 'off');
set(gcf, 'Position', [500,500,500,500]);
bar(responseTime);
title('Response Time of Participants for Different Choices');
xlabel('Trial Number');
ylabel('Response Time (s)');
   
% Analyse the data
disp('Analysing data using t-test...');
[h,p] = ttest(responseTime);
if h == 1
    disp('The results show a statistically significant difference in the response time of participants (p < 0.05)');
else
    disp('The results do not show a statistically significant difference in the response time of participants (p > 0.05)');
end
disp('Experiment complete!'); 
