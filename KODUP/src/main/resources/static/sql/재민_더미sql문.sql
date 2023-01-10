use kodup;

ALTER TABLE `repl` AUTO_INCREMENT=1;
SET @COUNT = 0;
UPDATE `board` SET sno = @COUNT:=@COUNT+1;

/*-------------------------- member PROCEDURE ---------------------------*/
drop PROCEDURE memberlist;
CREATE PROCEDURE memberlist()
BEGIN
	DECLARE cnt INT DEFAULT 1;
	
	here : LOOP
		INSERT INTO member(id, pwd, email, nickname, gender, age, profile_img, account_type, ban_status, pixel, grade, join_date, email_status, mento_status, corp_status)
		VALUES(CONCAT('m001',cnt), '1111', CONCAT('abc',cnt,'@naver.com'), CONCAT('힐따기요',cnt), 'm' , FLOOR(RAND() * 70), "default.png", 0, 0, 0, 0, "2023-01-09",0,0,0);
		
		IF cnt = 100 THEN
			LEAVE here;
		END IF;
		
		SET cnt = cnt + 1;
	END LOOP;
END;
CALL memberlist();

SELECT * from member;
----------board procedure--------------------------------------- */
/*---------qna--------------*/
drop PROCEDURE qnaboardlist;
CREATE PROCEDURE qnaboardlist()
BEGIN 
    declare cnt int default 1;
    
    here : LOOP 
       INSERT INTO board(id, boardtype, nal, subject, doc, hashtag, viewcount, thumbup, thumbdown)
       VALUES(CONCAT('m001',cnt), 'qna', '2023-01-01 11:26:02', 'java가 뭔가요?',
             '혼자 독학 해보려고 하는데 java에 대해서 알려주실분? 10000픽셀 드립니다.', 
             '#프론트엔드#벡엔드',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
       IF cnt = 100 THEN
           LEAVE here;
       END IF;
       
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL qnaboardlist();

drop PROCEDURE qnaboardlist2;
CREATE PROCEDURE qnaboardlist2()
BEGIN 
    declare cnt int default 1;
    
    here : LOOP 
       INSERT INTO board(id, boardtype, nal, subject, doc, hashtag, viewcount, thumbup, thumbdown)
       VALUES(CONCAT('m001',cnt), 'qna', '2023-01-01 14:26:02', '백엔드 개발자 이직하려는데 도움필요합니다',
             '3년차 백엔드 개발잡니다 우리 회사 넘모 맘에 안드네용 아우 이직마렵다!!!!!!!', 
             '#이직#벡엔드',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
       IF cnt = 100 THEN
           LEAVE here;
       END IF;
       
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL qnaboardlist2();

drop PROCEDURE qnaboardlist3;
CREATE PROCEDURE qnaboardlist3()
BEGIN 
    declare cnt int default 1;
    
    here : LOOP 
       INSERT INTO board(id, boardtype, nal, subject, doc, hashtag, viewcount, thumbup, thumbdown)
       VALUES(CONCAT('m001',cnt), 'qna', '2023-01-01 11:26:02', '백엔드가 뭔가요?',
             '백엔드? 프론트엔드? 뭔가요 용어가 왜케 어렵죠? 코린이에요 ㅠㅠ 도와줘용 ㅜㅜ', 
             '#프론트엔드#벡엔드',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
       IF cnt = 100 THEN
           LEAVE here;
       END IF;
       
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL qnaboardlist3();


/*----------------freetaliking------------*/
drop PROCEDURE freetalkingboardlist;
CREATE PROCEDURE freetalkingboardlist()
BEGIN 
    declare cnt int default 1;
    
    here : LOOP 
       INSERT INTO board(id, boardtype, nal, subject, doc, hashtag, viewcount, thumbup, thumbdown)
       VALUES(CONCAT('m001',cnt), 'freetalking', '2023-01-02 12:26:02', 'LG트윈스가 2023년 종합 우승을 달성합니다!',
              'LG트윈스가 오랜 시간 끝에 마침내 우승을 달성합니다! 한국시리즈 MVP는 이재원 선수!', '#야구#LG트윈스',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
       IF cnt = 100 THEN
           LEAVE here;
       END IF;
       
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL freetalkingboardlist();

drop PROCEDURE freetalkingboardlist2;
CREATE PROCEDURE freetalkingboardlist2()
BEGIN 
    declare cnt int default 1;
    
    here : LOOP 
       INSERT INTO board(id, boardtype, nal, subject, doc, hashtag, viewcount, thumbup, thumbdown)
       VALUES(CONCAT('m001',cnt), 'freetalking', '2023-01-02 12:26:02', '롤 요즘 너무 담배마려움 하기싫다', 
              '협곡은 스트레스 받고 칼바람은 패치하고 노잼임 딴겜없음?진짜 하기 싫음 ㅇㅇ','#롤#lol',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
       IF cnt = 100 THEN
           LEAVE here;
       END IF;
       
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL freetalkingboardlist2();

drop PROCEDURE freetalkingboardlist3;
CREATE PROCEDURE freetalkingboardlist3()
BEGIN 
    declare cnt int default 1;
    
    here : LOOP 
       INSERT INTO board(id, boardtype, nal, subject, doc, hashtag, viewcount, thumbup, thumbdown)
       VALUES(CONCAT('m001',cnt), 'freetalking', '2023-02-02 12:26:02', '날이 풀려서 다행이네요', 
              '빨래만 하면 마르질 않았는데 요즘은 따뜻해서 빨래가 빨리 마르네요 좋습니당','#날씨#봄',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
       IF cnt = 100 THEN
           LEAVE here;
       END IF;
       
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL freetalkingboardlist3();

drop PROCEDURE freetalkingboardlist4;
CREATE PROCEDURE freetalkingboardlist4()
BEGIN 
    declare cnt int default 1;
    
    here : LOOP 
       INSERT INTO board(id, boardtype, nal, subject, doc, hashtag, viewcount, thumbup, thumbdown)
       VALUES(CONCAT('m001',cnt), 'freetalking', '2023-01-04 12:26:02', 'colde 묘 노래 좋네요', 
              '묘~ 할때 먕 하는데 자꾸 머리에 남음ㅋㅋㅋㅋ 노래 좋아요','#colde#음악',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
       IF cnt = 100 THEN
           LEAVE here;
       END IF;
       
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL freetalkingboardlist4();

drop PROCEDURE freetalkingboardlist5;
CREATE PROCEDURE freetalkingboardlist5()
BEGIN 
    declare cnt int default 1;
    
    here : LOOP 
       INSERT INTO board(id, boardtype, nal, subject, doc, hashtag, viewcount, thumbup, thumbdown)
       VALUES(CONCAT('m001',cnt), 'freetalking', '2023-01-02 12:26:02', '아무것도 하기 싫다 뒹굴뒹굴', 
              '뒹굴뒹굴 하다 밥먹고 뒹굴뒹굴하다 밥먹고 뒹굴뒹굴하다 자구싶다','#뒹굴뒹굴#휴일',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
       IF cnt = 100 THEN
           LEAVE here;
       END IF;
       
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL freetalkingboardlist5();

/*--------------infoshare----------------*/
drop PROCEDURE infoshareboardlist;
CREATE PROCEDURE infoshareboardlist()
BEGIN 
    declare cnt int default 1;
    
    here : LOOP 
       INSERT INTO board(id, boardtype, nal, subject, doc, hashtag, viewcount, thumbup, thumbdown)
       VALUES(CONCAT('m001',cnt), 'infoshare', '2023-01-04 03:26:02', '스압)우크라이나 전쟁 상황',
              '미국의 인터넷망 지원덕분에 우크라이나가 전쟁에서 승리를 가져가고 있습니다 현대 전쟁은 통신이 젤 중요하다 하네요', '#전쟁#우크라이나',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
       IF cnt = 100 THEN
           LEAVE here;
       END IF;
       
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL infoshareboardlist();

drop PROCEDURE infoshareboardlist2;
CREATE PROCEDURE infoshareboardlist2()
BEGIN 
    declare cnt int default 1;
    
    here : LOOP 
       INSERT INTO board(id, boardtype, nal, subject, doc, hashtag, viewcount, thumbup, thumbdown)
       VALUES(CONCAT('m001',cnt), 'infoshare', '2023-01-04 03:26:02', '엣지 브라우저도 쓸만함 ㅇㅇ',
              '크롬 크롬 하지만 엣지도 나름 쓸만함 이름도 간지나잖어 엣지 ㅋㅋ', '#edge#IEBYE',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
       IF cnt = 100 THEN
           LEAVE here;
       END IF;
       
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL infoshareboardlist2();

drop PROCEDURE infoshareboardlist3;
CREATE PROCEDURE infoshareboardlist3()
BEGIN 
    declare cnt int default 1;
    
    here : LOOP 
       INSERT INTO board(id, boardtype, nal, subject, doc, hashtag, viewcount, thumbup, thumbdown)
       VALUES(CONCAT('m001',cnt), 'infoshare', '2023-01-04 03:26:02', '갤럭시 플립은 좀 불편합니다',
              '접히는 부분에 필름이 자꾸 올라와서 맨날 찢어짐 진짜 개빡칩니다 이건 뭐 방법도 없어요', '#samsung#filp',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
       IF cnt = 100 THEN
           LEAVE here;
       END IF;
       
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL infoshareboardlist3();

/*---------------------jobsearch----------------------*/
drop PROCEDURE jobsearchboardlist;
CREATE PROCEDURE jobsearchboardlist()
BEGIN 
    declare cnt int default 1;
    
    here : LOOP 
       INSERT INTO board(id, boardtype, nal, subject, doc, hashtag, viewcount, thumbup, thumbdown)
       VALUES(CONCAT('m001',cnt), 'jobsearch', '2023-03-04 03:26:02', '백엔드 구직 합니다',
              '3년차 개발자 입니다 백엔드 구직 합니다 연락 부탁드려요', '#백엔드#java',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
       IF cnt = 100 THEN
           LEAVE here;
       END IF;
       
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL jobsearchboardlist();

drop PROCEDURE jobsearchboardlist2;
CREATE PROCEDURE jobsearchboardlist2()
BEGIN 
    declare cnt int default 1;
    
    here : LOOP 
       INSERT INTO board(id, boardtype, nal, subject, doc, hashtag, viewcount, thumbup, thumbdown)
       VALUES(CONCAT('m001',cnt), 'jobsearch', '2023-03-04 03:26:02', '프론트엔드 구직 합니다',
              '신입 개발자 입니다 프론트엔드 구직 합니다 연락 부탁드려요', '#프론트엔드#CSS',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
       IF cnt = 100 THEN
           LEAVE here;
       END IF;
       
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL jobsearchboardlist2();

drop PROCEDURE jobsearchboardlist3;
CREATE PROCEDURE jobsearchboardlist3()
BEGIN 
    declare cnt int default 1;
    
    here : LOOP 
       INSERT INTO board(id, boardtype, nal, subject, doc, hashtag, viewcount, thumbup, thumbdown)
       VALUES(CONCAT('m001',cnt), 'jobsearch', '2023-03-04 03:26:02', '풀스택 개발자 구직 합니다',
              '풀스택 10년차 개발자 입니다 어디든 구직 합니다 연락 부탁드려요', '#백엔드#프론트엔드',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
       IF cnt = 100 THEN
           LEAVE here;
       END IF;
       
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL jobsearchboardlist3();

/*---------mansearch----------------------------*/
drop PROCEDURE mansearchboardlist;
CREATE PROCEDURE mansearchboardlist()
BEGIN 
    declare cnt int default 1;
    
    here : LOOP 
       INSERT INTO board(id, boardtype, nal, subject, doc, hashtag, viewcount, thumbup, thumbdown)
       VALUES(CONCAT('m001',cnt), 'mansearch', '2023-03-05 03:26:02', '백엔드 구인 합니다',
              '필수 스킬은 java spring입니다 연봉은 회사내규입니다', '#백엔드#java',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
       IF cnt = 100 THEN
           LEAVE here;
       END IF;
       
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL mansearchboardlist();

drop PROCEDURE mansearchboardlist2;
CREATE PROCEDURE mansearchboardlist2()
BEGIN 
    declare cnt int default 1;
    
    here : LOOP 
       INSERT INTO board(id, boardtype, nal, subject, doc, hashtag, viewcount, thumbup, thumbdown)
       VALUES(CONCAT('m001',cnt), 'mansearch', '2023-03-05 03:26:02', '프론트엔드 구인 합니다',
              '필수 스킬은 CSS bootstrap입니다 연봉은 회사내규입니다', '#프론트엔드#bootstrap',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
       IF cnt = 100 THEN
           LEAVE here;
       END IF;
       
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL mansearchboardlist2();


/*----------------repl-------------------*/
drop PROCEDURE repllist;
CREATE PROCEDURE repllist()
BEGIN 
    declare cnt int default 1;
    
    here : LOOP 
       INSERT INTO repl(id, sno, grp, seq, deep, repl_nal, repl_doc, thumbup, thumbdown)
       VALUES(CONCAT('m001',cnt), cnt, 0,0,0, '2023-03-05 03:26:02', 'ㄹㅇㅋㅋ', FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
       IF cnt = 50 THEN
           LEAVE here;
       END IF;
       
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL repllist();

drop PROCEDURE repllist2;
CREATE PROCEDURE repllist2()
BEGIN 
    declare cnt int default 1;
    
    here : LOOP 
       INSERT INTO repl(id, sno, grp, seq, deep, repl_nal, repl_doc, thumbup, thumbdown)
       VALUES(CONCAT('m001',cnt), cnt+50 , 2,1,1, '2023-03-05 03:26:02', '인정 ㅋㅋㅋㅋ', FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
       IF cnt = 50 THEN
           LEAVE here;
       END IF;
       
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL repllist2();
select * from repl;