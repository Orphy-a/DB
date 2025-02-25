SELECT a.*, u.nick 
FROM `article` AS a 
JOIN `user` AS u 
ON a.writer = u.uid 
ORDER BY `no` DESC
LIMIT 10,10;


SELECT COUNT(*) 
from `article` AS a
JOIN `user` AS u ON articlea.writer = u.uid
WHERE `nick` LIKE '%w%';


INSERT INTO `article` (`title`, `content`, `writer`, `regip`, `wdate`) 
SELECT `title`, `content`, `writer`, `regip`, `wdate` FROM `article`;