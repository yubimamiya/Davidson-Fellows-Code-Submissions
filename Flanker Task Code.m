function [ ] = flanker( num,OutFile )
%Run Franker test.
%   Preliminary version. Should run OK, but not sure how fast it will
%   display everything correctly. NofTest is the total number of tests to
%   be run. OutFile is the file name.


Arrow{1}='\rightarrow';
Arrow{2}='\leftarrow';
KEYS = 'cmzf';




%for now we have structure here.
lang.correct = {'correct'};
lang.incorrect = {'incorrect'};
lang.words = {'red', 'green', 'blue', 'magenta'};
lang.colors = lang.words;
lang.keys = 'sd';
lang.label_agree = 'Agreeing stimulus';
lang.label_differ = 'Differing stimulus';
lang.xlabel = 'Reaction time (s)';
lang.ylabel = 'Normalized frequency';
lang.current_results = 'Current results';
lang.overall_results = 'Overall results of %d experiments';
Instruction={['Say SAME if the middle arrow points to the same direction,'],...
['DIFFERENT if different']};


StiPos=[0.5,0.5];
NoiPos=[0.1,0.5;0.3,0.5;0.7,0.5;0.9,0.5];


% Create Interface window
h = figure;
set(h, 'NumberTitle', 'off', ...
'Name', 'Flanker Test', ...
'Color', 'black', ...
'MenuBar','none', ...
'ToolBar', 'none');
% Display instruction
ht = text(0.5,0.5,Instruction,'FontSize', 20,'Color','w','HorizontalAlignment','Center'); set(gca,'Color','k');set(gcf,'Color','k');
waitforspace(h);
delete(ht);


% Session variables
ntrials = 0; % Number of trials already preformed
nmixed = 0; % Number of mixed trials
nerrors = 0; % Number of incorrect replies
trials = cell(0,4);
% Start test
while ntrials < num
% Chose between normal or mixed
mixed = rand > (nmixed/(ntrials - nmixed))/2;
% Create trial
perm = randperm(2);
iStimul = perm(1);
if mixed
    iNoise=perm(2);
else
    iNoise=perm(1);
end


% Pause for 1 + (0-2) s and display
pause(0.5 + rand*2);


%Show the stimuli
ht=text(StiPos(1),StiPos(2),Arrow{iStimul},'FontSize',54,'Color','w','HorizontalAlignment','Center'); set(gca,'Color','k');set(gcf,'Color','k')
ht1=text(NoiPos(:,1),NoiPos(:,2),Arrow{iNoise},'FontSize',54,'Color','w','HorizontalAlignment','Center'); set(gca,'Color','k');set(gcf,'Color','k')
tic;
% Wait for user input
waitforbuttonpress;
rtime = toc;
ch = get(h, 'CurrentCharacter');
delete(ht);
delete(ht1);


if mixed
    Answer=2;
else
    Answer=1;
end


if ch == lang.keys(Answer)
ntrials = ntrials + 1;
if mixed, nmixed = nmixed + 1; end;
ht=text(StiPos(1),StiPos(2),'Correct','FontSize',54,'Color','w','HorizontalAlignment','Center'); set(gca,'Color','k');set(gcf,'Color','k')
else
% Check for unknown characters
nerrors = nerrors + 1;
ht=text(StiPos(1),StiPos(2),'Wrong','FontSize',54,'Color','w','HorizontalAlignment','Center'); set(gca,'Color','k');set(gcf,'Color','k')
end
% Store result
trials{end+1, 1} = iStimul;
trials{end, 2} = iNoise;
if length(find(lang.keys == ch)) > 0
trials{end, 3} = find(lang.keys == ch);
else
trials{end, 3} = 0;
end
trials{end, 4} = rtime;
% Show result for 0.5 s and continue
pause(0.5);
delete(ht);
end
% Some stats
fprintf('# correct trials: %d\n', ntrials);
fprintf('# mixed trials: %d\n', nmixed);
fprintf('ratio mixed/normal: %0.3f\n', nmixed/(ntrials-nmixed));
fprintf('# all trials: %d\n', size(trials, 1));
fprintf('# incorrect trials: %d\n', nerrors);


%Save the trial data with a specified file name.
save(OutFile,'trials');




end


function waitforspace(h)
waitforbuttonpress;
key = get(h, 'CurrentKey');
while ~strcmp(key, 'space')
waitforbuttonpress;
key = get(h, 'CurrentKey');
end
end