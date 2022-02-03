
function display_table(f,position_x,position_y, length_x,length_y,decoder,calibrator)
% this function display the list of parameters in a table in a GUI,
%@ E.Ferrea, 2015

%INPUT 
%It takes the position and length of the table as input and decoder and calibration objects 


[row,col] = find(decoder.neurons > 0);
index = find(decoder.neurons > 0);
data = {};
for i  = 1 : length(index)
    
    data{i,1} = ['Ch' num2str(row(i)) , 'U' num2str(col(i))];
    data{i,2} = calibrator.correlation_tuning(index(i));
    data{i,3} = calibrator. baseline_rate(index(i));
    %data{i,4} = calibrator.modulation_depth(index(i));
    data{i,4} = calibrator.training_sample_number;
end

colnames = {'neuron', 'R2', 'b0','Samples'};
t =  uitable(f,'Data', data, 'ColumnName', colnames, 'Units','normalized',...
    'Position', [position_x position_y length_x length_y]);

end