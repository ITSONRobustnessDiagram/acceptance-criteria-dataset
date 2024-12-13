clear; close all;

format long g

%% NO EXP
Error_without_criteria_no_exp = [
    10; 9; 7; 11; 8; 10; 6; 9; 8; 12; 7; 11; 8; 10; 7
];
Time_without_criteria_no_exp = [
    463; 482; 453; 507; 433; 496;
    431; 512; 383; 503; 398; 438;
    372; 481; 411
];

% 3 Criteria
Error_with_3_criteria_no_exp = [
    6; 5; 4; 7; 7; 8; 6; 7; 9; 8; 6; 9; 6; 9; 6
];
Time_with_3_criteria_no_exp = [
    467; 438; 408; 473; 482; 472;
    393; 403; 398; 398; 402; 508;
    507; 383; 413
];

% 7 Criteria
Error_with_7_criteria_no_exp = [
    3; 5; 2; 3; 4; 5; 1; 4; 4; 6; 3; 5; 3; 5; 1
];
Time_with_7_criteria_no_exp = [
    443; 392; 312; 438; 426; 338;
    363; 385; 368; 503; 333; 417;
    377; 407; 348
];

%% WITH EXP
Error_without_criteria_exp = [
    5; 3; 7; 4; 6; 3; 5; 6; 4; 2; 5; 7; 3; 6; 4
];
Time_without_criteria_exp = [
    432; 408; 495; 422; 465; 385;
    470; 450; 405; 370; 455; 485;
    395; 460; 415
];

% 3 Criteria
Error_with_3_criteria_exp = [
    2; 1; 4; 3; 3; 1; 2; 4; 3; 2; 3; 5; 2; 4; 2
];
Time_with_3_criteria_exp = [
    390; 355; 465; 380; 400; 335;
    415; 430; 380; 350; 425; 450;
    360; 410; 382
];

% 7 Criteria
Error_with_7_criteria_exp = [
    1; 1; 2; 1; 2; 1; 2; 1; 1; 0; 2; 2; 1; 2; 1
];
Time_with_7_criteria_exp = [
    323; 290; 390; 316; 344; 290;
    367; 335; 312; 295; 352; 380;
    307; 341; 314
];

%%
stats = @(x) struct('mean', mean(x), 'std_dev', std(x));

stats_without_criteria = stats(Error_without_criteria_no_exp);
stats_with_3_criteria = stats(Error_with_3_criteria_no_exp);
stats_with_7_criteria = stats(Error_with_7_criteria_no_exp);
stats_exp_without_criteria = stats(Error_without_criteria_exp);
stats_exp_with_3_criteria = stats(Error_with_3_criteria_exp);
stats_exp_with_7_criteria = stats(Error_with_7_criteria_exp);

T_error_without_exp = table( ...
    [stats_without_criteria.mean; stats_with_3_criteria.mean; stats_with_7_criteria.mean], ...
    [stats_without_criteria.std_dev; stats_with_3_criteria.std_dev; stats_with_7_criteria.std_dev], ...
    'VariableNames', {'Mean', 'StandardDeviation'}, ...
    'RowNames', {'Without Criteria', 'With 3 Criteria', 'With 7 Criteria'} ...
);

T_error_exp = table( ...
    [stats_exp_without_criteria.mean; stats_exp_with_3_criteria.mean; stats_exp_with_7_criteria.mean], ...
    [stats_exp_without_criteria.std_dev; stats_exp_with_3_criteria.std_dev; stats_exp_with_7_criteria.std_dev], ...
    'VariableNames', {'Mean', 'StandardDeviation'}, ...
    'RowNames', {'Without Criteria', 'With 3 Criteria', 'With 7 Criteria'} ...
);

T_time_without_exp = table( ...
    [mean(Time_without_criteria_no_exp); mean(Time_with_3_criteria_no_exp); mean(Time_with_7_criteria_no_exp)], ...
    [std(Time_without_criteria_no_exp); std(Time_with_3_criteria_no_exp); std(Time_with_7_criteria_no_exp)], ...
    'VariableNames', {'Mean', 'StandardDeviation'}, ...
    'RowNames', {'Without Criteria', 'With 3 Criteria', 'With 7 Criteria'} ...
);

T_time_exp = table( ...
    [mean(Time_without_criteria_exp); mean(Time_with_3_criteria_exp); mean(Time_with_7_criteria_exp)], ...
    [std(Time_without_criteria_exp); std(Time_with_3_criteria_exp); std(Time_with_7_criteria_exp)], ...
    'VariableNames', {'Mean', 'StandardDeviation'}, ...
    'RowNames', {'Without Criteria', 'With 3 Criteria', 'With 7 Criteria'} ...
);

disp('Error Table Without Experience:');
disp(T_error_without_exp);

disp('Error Table With Experience:');
disp(T_error_exp);

disp('Time Table Without Experience:');
disp(T_time_without_exp);

disp('Time Table With Experience:');
disp(T_time_exp);

disp('Statistics - Errors Without Criteria (no experience):');
disp(stats_without_criteria);

disp('Statistics - Errors With 3 Criteria (no experience):');
disp(stats_with_3_criteria);

disp('Statistics - Errors With 7 Criteria (no experience):');
disp(stats_with_7_criteria);

disp('Statistics - Errors Without Criteria (with experience):');
disp(stats_exp_without_criteria);

disp('Statistics - Errors With 3 Criteria (with experience):');
disp(stats_exp_with_3_criteria);

disp('Statistics - Errors With 7 Criteria (with experience):');
disp(stats_exp_with_7_criteria);



%% Graphs
% Plot 1: Errors and Completion Times for Newbies
figure;

subplot(2,1,1);
boxplot([Error_without_criteria_no_exp, Error_with_3_criteria_no_exp, Error_with_7_criteria_no_exp], ...
    'Labels', {'With no Criteria','With 3 Criteria', 'With 7 Criteria'});
title('Errors in Stories (Newbie) - H1');
ylabel('Number of Errors');
grid on;

subplot(2,1,2);
boxplot([Time_without_criteria_no_exp, Time_with_3_criteria_no_exp, Time_with_7_criteria_no_exp], ...
    'Labels', {'With no Criteria','With 3 Criteria', 'With 7 Criteria'});
title('Completion Time (Newbie) - H3');
ylabel('Time (seconds)');
grid on;

% Plot 2: Errors and Completion Times for Advanced Users
figure;

subplot(2,1,1);
boxplot([Error_without_criteria_exp,Error_with_3_criteria_exp, Error_with_7_criteria_exp], ...
    'Labels', {'No Criteria','With 3 Criteria', 'With 7 Criteria'});
title('Errors in Stories (Advanced) - H2');
ylabel('Number of Errors');
grid on;

subplot(2,1,2);
boxplot([Time_without_criteria_exp, Time_with_3_criteria_exp, Time_with_7_criteria_exp], ...
    'Labels', {'No Criteria', 'With 3 Criteria', 'With 7 Criteria'});
title('Completion Time (Advanced) - H4');
ylabel('Time (seconds)');
grid on;

% Plot 3: Total Errors Comparison
figure;

max_value = max([Error_without_criteria_no_exp(:); Error_without_criteria_exp(:); ...
                 Error_with_3_criteria_no_exp(:); Error_with_3_criteria_exp(:); ...
                 Error_with_7_criteria_no_exp(:); Error_with_7_criteria_exp(:)]);
y_limits = [0, max_value];

subplot(3,1,1);
boxplot([Error_without_criteria_no_exp(:), Error_without_criteria_exp(:)], ...
    'Labels', {'Newbie', 'Advanced'});
title('Total Errors - No Criteria');
ylabel('Number of Errors');
ylim(y_limits);
grid on;

subplot(3,1,2);
boxplot([Error_with_3_criteria_no_exp(:), Error_with_3_criteria_exp(:)], ...
    'Labels', {'Newbie', 'Advanced'});
title('Total Errors - With 3 Criteria');
ylabel('Number of Errors');
ylim(y_limits);
grid on;

subplot(3,1,3);
boxplot([Error_with_7_criteria_no_exp(:), Error_with_7_criteria_exp(:)], ...
    'Labels', {'Newbie', 'Advanced'});
title('Total Errors - With 7 Criteria');
ylabel('Number of Errors');
ylim(y_limits);
grid on;

%% Mean and Standard Deviation of Errors and Times
criteria = {'No Criteria', 'With 3 Criteria', 'With 7 Criteria'};
x = 1:length(criteria);

% Errors
mean_errors_newbie = [stats_without_criteria.mean, stats_with_3_criteria.mean, stats_with_7_criteria.mean];
std_errors_newbie = [stats_without_criteria.std_dev, stats_with_3_criteria.std_dev, stats_with_7_criteria.std_dev];
mean_errors_advanced = [stats_exp_without_criteria.mean, stats_exp_with_3_criteria.mean, stats_exp_with_7_criteria.mean];
std_errors_advanced = [stats_exp_without_criteria.std_dev, stats_exp_with_3_criteria.std_dev, stats_exp_with_7_criteria.std_dev];


% Times
mean_times_newbie = [mean(Time_without_criteria_no_exp), mean(Time_with_3_criteria_no_exp), mean(Time_with_7_criteria_no_exp)];
std_times_newbie = [std(Time_without_criteria_no_exp), std(Time_with_3_criteria_no_exp), std(Time_with_7_criteria_no_exp)];
mean_times_advanced = [mean(Time_without_criteria_exp), mean(Time_with_3_criteria_exp), mean(Time_with_7_criteria_exp)];
std_times_advanced = [std(Time_without_criteria_exp), std(Time_with_3_criteria_exp), std(Time_with_7_criteria_exp)];

figure;

subplot(2,1,1);
hold on;
errorbar(x, mean_errors_newbie, std_errors_newbie, '-o', 'LineWidth', 1.5, 'Color', 'b', 'DisplayName', 'Newbie');
errorbar(x, mean_errors_advanced, std_errors_advanced, '-s', 'LineWidth', 1.5, 'Color', 'r', 'DisplayName', 'Advanced');
hold off;
set(gca, 'XTick', x, 'XTickLabel', criteria);
legend('Location', 'northwest');
title('Mean and Std Dev of Errors');
ylabel('Number of Errors');
grid on;

subplot(2,1,2);
hold on;
errorbar(x, mean_times_newbie, std_times_newbie, '-o', 'LineWidth', 1.5, 'Color', 'b', 'DisplayName', 'Newbie');
errorbar(x, mean_times_advanced, std_times_advanced, '-s', 'LineWidth', 1.5, 'Color', 'r', 'DisplayName', 'Advanced');
hold off;
set(gca, 'XTick', x, 'XTickLabel', criteria);
legend('Location', 'northwest');
title('Mean and Std Dev of Time');
ylabel('Time (seconds)');
grid on;

%% Histograms
figure;

subplot(2,1,1);
histogram(Error_without_criteria_no_exp, 'FaceColor', 'blue');
title('Histogram of Errors (No Criteria, Newbie)');
xlabel('Number of Errors');
ylabel('Frequency');

subplot(2,1,2);
histogram(Time_without_criteria_no_exp, 'FaceColor', 'red');
title('Histogram of Time (No Criteria, Newbie)');
xlabel('Time (seconds)');
ylabel('Frequency');

figure;

subplot(2,1,1);
histogram(Error_without_criteria_exp, 'FaceColor', 'blue');
title('Histogram of Errors (No Criteria, Advanced)');
xlabel('Number of Errors');
ylabel('Frequency');

subplot(2,1,2);
histogram(Time_without_criteria_exp, 'FaceColor', 'red');
title('Histogram of Time (No Criteria, Advanced)');
xlabel('Time (seconds)');
ylabel('Frequency');

%% Grouped Boxplots
errors_no_exp = [Error_without_criteria_no_exp, Error_with_3_criteria_no_exp, Error_with_7_criteria_no_exp];
groups_no_exp = [repmat("No Criteria", 1, numel(Error_without_criteria_no_exp)), ...
                 repmat("With 3 Criteria", 1, numel(Error_with_3_criteria_no_exp)), ...
                 repmat("With 7 Criteria", 1, numel(Error_with_7_criteria_no_exp))];

times_no_exp = [Time_without_criteria_no_exp, Time_with_3_criteria_no_exp, Time_with_7_criteria_no_exp];
times_exp = [Time_without_criteria_exp, Time_with_3_criteria_exp, Time_with_7_criteria_exp];

figure;

subplot(3, 1, 1);
boxplot(errors_no_exp, groups_no_exp);
title('Errors in Stories (Newbies)');
ylabel('Errors');
grid on;

subplot(3, 1, 2);
boxplot(times_no_exp, groups_no_exp);
title('Completion Time (Newbies)');
ylabel('Time (seconds)');
grid on;

subplot(3, 1, 3);
boxplot(times_exp, groups_no_exp);
title('Completion Time (Advanced)');
ylabel('Time (seconds)');
grid on;
