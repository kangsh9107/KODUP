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
		VALUES(CONCAT('m001',cnt), '1111', CONCAT('abc',cnt,'@naver.com'), CONCAT('�������',cnt), 'm' , FLOOR(RAND() * 70), "default.png", 0, 0, 0, 0, "2023-01-09",0,0,0);
		
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
       VALUES(CONCAT('m001',cnt), 'qna', '2023-01-01 11:26:02', 'java�� ������?',
             'ȥ�� ���� �غ����� �ϴµ� java�� ���ؼ� �˷��ֽǺ�? 10000�ȼ� �帳�ϴ�.', 
             '#����Ʈ����#������',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
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
       VALUES(CONCAT('m001',cnt), 'qna', '2023-01-01 14:26:02', '�鿣�� ������ �����Ϸ��µ� �����ʿ��մϴ�',
             '3���� �鿣�� ������ϴ� �츮 ȸ�� �Ѹ� ���� �ȵ�׿� �ƿ� �������ƴ�!!!!!!!', 
             '#����#������',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
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
       VALUES(CONCAT('m001',cnt), 'qna', '2023-01-01 11:26:02', '�鿣�尡 ������?',
             '�鿣��? ����Ʈ����? ������ �� ���� �����? �ڸ��̿��� �Ф� ������� �̤�', 
             '#����Ʈ����#������',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
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
       VALUES(CONCAT('m001',cnt), 'freetalking', '2023-01-02 12:26:02', 'LGƮ������ 2023�� ���� ����� �޼��մϴ�!',
              'LGƮ������ ���� �ð� ���� ��ħ�� ����� �޼��մϴ�! �ѱ��ø��� MVP�� ����� ����!', '#�߱�#LGƮ����',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
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
       VALUES(CONCAT('m001',cnt), 'freetalking', '2023-01-02 12:26:02', '�� ���� �ʹ� ��踶���� �ϱ�ȴ�', 
              '������ ��Ʈ���� �ް� Į�ٶ��� ��ġ�ϰ� ������ ���׾���?��¥ �ϱ� ���� ����','#��#lol',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
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
       VALUES(CONCAT('m001',cnt), 'freetalking', '2023-02-02 12:26:02', '���� Ǯ���� �����̳׿�', 
              '������ �ϸ� ������ �ʾҴµ� ������ �����ؼ� ������ ���� �����׿� �����ϴ�','#����#��',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
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
       VALUES(CONCAT('m001',cnt), 'freetalking', '2023-01-04 12:26:02', 'colde �� �뷡 ���׿�', 
              '��~ �Ҷ� �� �ϴµ� �ڲ� �Ӹ��� ������������ �뷡 ���ƿ�','#colde#����',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
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
       VALUES(CONCAT('m001',cnt), 'freetalking', '2023-01-02 12:26:02', '�ƹ��͵� �ϱ� �ȴ� �߱��߱�', 
              '�߱��߱� �ϴ� ��԰� �߱��߱��ϴ� ��԰� �߱��߱��ϴ� �ڱ��ʹ�','#�߱��߱�#����',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
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
       VALUES(CONCAT('m001',cnt), 'infoshare', '2023-01-04 03:26:02', '����)��ũ���̳� ���� ��Ȳ',
              '�̱��� ���ͳݸ� �������п� ��ũ���̳��� ���￡�� �¸��� �������� �ֽ��ϴ� ���� ������ ����� �� �߿��ϴ� �ϳ׿�', '#����#��ũ���̳�',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
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
       VALUES(CONCAT('m001',cnt), 'infoshare', '2023-01-04 03:26:02', '���� �������� ������ ����',
              'ũ�� ũ�� ������ ������ ���� ������ �̸��� �������ݾ� ���� ����', '#edge#IEBYE',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
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
       VALUES(CONCAT('m001',cnt), 'infoshare', '2023-01-04 03:26:02', '������ �ø��� �� �����մϴ�',
              '������ �κп� �ʸ��� �ڲ� �ö�ͼ� �ǳ� ������ ��¥ ����Ĩ�ϴ� �̰� �� ����� �����', '#samsung#filp',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
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
       VALUES(CONCAT('m001',cnt), 'jobsearch', '2023-03-04 03:26:02', '�鿣�� ���� �մϴ�',
              '3���� ������ �Դϴ� �鿣�� ���� �մϴ� ���� ��Ź�����', '#�鿣��#java',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
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
       VALUES(CONCAT('m001',cnt), 'jobsearch', '2023-03-04 03:26:02', '����Ʈ���� ���� �մϴ�',
              '���� ������ �Դϴ� ����Ʈ���� ���� �մϴ� ���� ��Ź�����', '#����Ʈ����#CSS',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
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
       VALUES(CONCAT('m001',cnt), 'jobsearch', '2023-03-04 03:26:02', 'Ǯ���� ������ ���� �մϴ�',
              'Ǯ���� 10���� ������ �Դϴ� ���� ���� �մϴ� ���� ��Ź�����', '#�鿣��#����Ʈ����',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
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
       VALUES(CONCAT('m001',cnt), 'mansearch', '2023-03-05 03:26:02', '�鿣�� ���� �մϴ�',
              '�ʼ� ��ų�� java spring�Դϴ� ������ ȸ�系���Դϴ�', '#�鿣��#java',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
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
       VALUES(CONCAT('m001',cnt), 'mansearch', '2023-03-05 03:26:02', '����Ʈ���� ���� �մϴ�',
              '�ʼ� ��ų�� CSS bootstrap�Դϴ� ������ ȸ�系���Դϴ�', '#����Ʈ����#bootstrap',FLOOR(RAND() * 70),FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
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
       VALUES(CONCAT('m001',cnt), cnt, 0,0,0, '2023-03-05 03:26:02', '��������', FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
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
       VALUES(CONCAT('m001',cnt), cnt+50 , 2,1,1, '2023-03-05 03:26:02', '���� ��������', FLOOR(RAND() * 70),FLOOR(RAND() * 70));
       
       IF cnt = 50 THEN
           LEAVE here;
       END IF;
       
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL repllist2();
select * from repl;