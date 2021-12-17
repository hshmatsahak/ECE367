%% 1.7a
% Find the two documents with minimum distance
load wordVecV.mat
[W, D] = size(V);
minlen = sum((V(:,1)-V(:,2)).^2);
minlen_v1 = 1;
minlen_v2 = 2;

fprintf("Unnormalized:\n")

for i = 1:D-1
   for j = i+1:D
      pair_len = sum((V(:,i)-V(:,j)).^2);
      if pair_len < minlen
          minlen = pair_len;
          minlen_v1 = i;
          minlen_v2 = j;
      end
   end
end
fprintf('Document %d and Document %d have minimum euclidean distance of %.02f between them\n', minlen_v1, minlen_v2, sqrt(minlen))

% Find the two documents with minimal angle
minang = acos(dot(V(:,1), V(:,2))/(norm(V(:,1))*norm(V(:,2))))*180/pi;
minang_v1 = 1;
minang_v2 = 2;
for i = 1:D-1
   for j = i+1:D
      pair_ang = acos(dot(V(:,i), V(:,j))/(norm(V(:,i))*norm(V(:,j))))*180/pi;
      if pair_ang < minang
          minang = pair_ang;
          minang_v1 = i;
          minang_v2 = j;
      end
   end
end
fprintf('Document %d and Document %d have minimum angle of %.02f degrees between them\n', minang_v1, minang_v2, minang)

%% 1.7b
Vnorm = V;
for i = 1:D
    Vnorm(:,i) = V(:,i)/sum(V(:,i));
end
sum(Vnorm); % All columns should sum to 1 now
% Now do the same thing as before, use this as new f(t,d) matrix

fprintf("\nNormalized:\n")

% Length
minlennorm = sum((Vnorm(:,1)-Vnorm(:,2)).^2);
minlennorm_v1 = 1;
minlennorm_v2 = 2;
for i = 1:D-1
   for j = i+1:D
      pair_len = sum((Vnorm(:,i)-Vnorm(:,j)).^2);
      if pair_len < minlennorm
          minlennorm = pair_len;
          minlennorm_v1 = i;
          minlennorm_v2 = j;
      end
   end
end
fprintf('Document %d and Document %d have minimum euclidean distance of %f between them\n', minlennorm_v1, minlennorm_v2, sqrt(minlennorm))

% Angle
% Find the two documents with minimal angle
minangnorm = acos(dot(Vnorm(:,1), Vnorm(:,2))/(norm(Vnorm(:,1))*norm(Vnorm(:,2))))*180/pi;
minangnorm_v1 = 1;
minangnorm_v2 = 2;
for i = 1:D-1
   for j = i+1:D
      pair_ang = acos(dot(Vnorm(:,i), Vnorm(:,j))/(norm(Vnorm(:,i))*norm(Vnorm(:,j))))*180/pi;
      if pair_ang < minangnorm
          minangnorm = pair_ang;
          minangnorm_v1 = i;
          minangnorm_v2 = j;
      end
   end 
end
fprintf('Document %d and Document %d have minimum angle of %.02f degrees between them\n', minangnorm_v1, minangnorm_v2, minangnorm)

%%
V_tfidf = Vnorm;
for i = 1:W
   V_tfidf(i,:) = Vnorm(i,:) * sqrt(log(D/nnz(Vnorm(i,:))));
end

fprintf("\nTFIDF:\n")

% Length
minlentfidf = sum((V_tfidf(:,1)-V_tfidf(:,2)).^2);
minlentfidf_v1 = 1;
minlentfidf_v2 = 2;
for i = 1:D-1
   for j = i+1:D
      pair_len = sum((V_tfidf(:,i)-V_tfidf(:,j)).^2);
      if pair_len < minlentfidf
          minlentfidf = pair_len;
          minlentfidf_v1 = i;
          minlentfidf_v2 = j;
      end
   end
end
fprintf('Document %d and Document %d have minimum euclidean distance of %f between them\n', minlentfidf_v1, minlentfidf_v2, sqrt(minlentfidf))