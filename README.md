# Davidson-Fellows-Code-Submissions

## Authors
Yubi Mamiya: yubimamiya@gmail.com
University of Washington Institute for Learning & Brain Sciences

## Statistical Analysis Pipeline

This is the analytic pipeline for processing and analyzing behavioral data. The source data comes from three experiemnts, including Stroop Task, Flanker taks, and Natural Language Processing (NLP) experiment. All study participants completed 100 trials in the Stroop and Flanker tasks. All study partiicpants viewed 18 images and spontaneoulsy generated 18 speeches. Their speech was subsequenlty analyzed by NLP algorithms. All data was joined together in an unified dataframe for the data analysis.

## Stroop Task

This MATLAB script contains all-inclusive codes that runs the color-version of the Stroop task. Four colors of English words: RED, YELLOW, GREEN, and BLUE will be dispalyed in a random order. To begin the task, simply type in: subject-ID, and # of trials. For example, subject101, 10. This wil result in 10 trials. 5 of them will be congruent trials and the remaining 5 trials are incongruent trials. The results will be saved in a file, named subject101_stroop.mat.

## Flanker Task

This MATLAB script contains all-inclusive codes that runs the arrow-version of the Flanker task. Five arrows will be generated. The center arrow either points in the same or the opposite direction as the flanking arrows. When all arrows point in the same direction, it is called the congruent trials. When the center arrow points in the opposite direction, it is called the incongruent trials. Participants will use the left or right key to respond. The correct answer should reflect the direction of the center arrow. The maximal time is 2-minutes for a single trials. If there is no input given in a trial, the script will automatically advance to the next trial. To begin the task, simply enter: subject_id, and the number of trials desired. For example, subject101, 10. This will result in 10 trials. Five of them will be congruent trials and the remaining five trials will be incongruent trials. The results will be saved in a file called subject101_flanker.mat.

## Natural Langauge Processing (NLTK)

The study implemented the NLTK Part-of-speech tagger provided by the open source NLTK package provided on GitHub. The package can be found at https://github.com/nltk/nltk/tree/develop/nltk/tag. Its citation is Bird, Steven, Edward Loper and Ewan Klein (2009). Natural Language Processing with Python. O'Reilly Media Inc..
