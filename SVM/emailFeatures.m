function x = emailFeatures(word_indices)
% Total number of words in the dictionary
n = 1899;

% You need to return the following variables correctly.
x = zeros(n, 1);

% Checking for each and every word in the word_indices.
% MYCODE HERE
for i = 1 : size(word_indices,1)
	x(word_indices(i)) = 1;
end
% END OF MYCODE

end
