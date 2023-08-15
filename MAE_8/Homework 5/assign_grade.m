function [total_score, letter] = assign_grade(homework, midterm, project, final)
%ASSIGN_GRADED takes an input of 4 different grade sections and assignes a
%total percentage score and a letter grade
%   The the lowest homework grade is not counted, and the two formulas for
%   getting a final grade are: grade = (.25* (sum(homework)/7) + (.25 * midterm) +
%   (.2*project) + (.3*final)) and grade = (.25* (sum(homework)/7)  +
%   (.2*project) + (.55*final)). 
%   the letter grade values are 
% A ≥ 93 ,A- ≥ 90, B+ ≥ 87, B ≥ 83,B- ≥ 80, C+ ≥ 77, C ≥ 73, C- ≥ 70, D ≥
% 60, F < 60  

formA = (.25* ((sum(homework) - min(homework))/7) + (.25 * midterm) + (.2*project) + (.3*final));
formB = (.25* ((sum(homework) - min(homework))/7)  + (.2*project) + (.55*final));
if formA > formB
    total_score = formA;
else
    total_score = formB;    
end
if(total_score >= 93)
    letter = 'A';
elseif total_score < 93 && total_score >= 90
    letter = 'A-';
elseif total_score < 90 && total_score >= 87
    letter = 'B+';
elseif total_score < 87 && total_score >= 83
    letter = 'B';
elseif total_score < 83 && total_score >= 80
    letter = 'B-';
elseif total_score < 80 && total_score >= 77
    letter = 'C+';
elseif total_score < 77 && total_score >= 73
    letter = 'C';
elseif total_score < 73 && total_score >= 70
    letter = 'C-';
elseif total_score < 70 && total_score >= 60
    letter = 'D';
elseif total_score < 60
    letter = 'F';
end
   
    
end