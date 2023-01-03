# vote
<b> Index 화면 </b>
![image](https://user-images.githubusercontent.com/102115231/210199845-665cea4f-5da2-404e-8b4e-9c0b875edcfe.png)<br>
 # 후보조회 화면 <br>
![image](https://user-images.githubusercontent.com/102115231/210199890-3d816c48-a5d0-47c8-ac77-0ce23dc771c3.png)
<br>
<br>
<b>select tm.m_no, tm.m_name, tp.p_name, case when p_school = '1' then '고졸' when p_school = '2' then '학사' when p_school = '3' then '석사' else '박사' end as p_school , substr(tm.m_jumin,1,6)||'-'||substr(tm.m_jumin,7) as m_jumin, tm.m_city, tp.p_tel1||'-'||tp.p_tel2||'-'||tp.p_tel3 as p_tal<br> 
from tbl_member_202005 tm, tbl_party_202005 tp <br>
where tm.p_code = tp.p_code"</b> <br>
<br>
<br>
sql문이 두 테이블을 사용해야 하므로 테이블의 새로운 이름을 지어줘 기본키로 조인시켜줍니다. <br>
그리고 조건에 맞게 작성하여 이중 p_school의 있는 숫자 변화의 따라 달라지도록 case문을, m_jumin라는 주민등록번호를 받는 값의 앞 뒤를 짤라 '-'를 중간에 추가시켜주고 p_tel도 똑같이 중간에 '-'문자를 넣어주었습니다.<br>
# 유효성 검사
![image](https://user-images.githubusercontent.com/102115231/210286102-a1445b26-5ab8-44c3-8062-cab4eecf62b7.png) <br>
저번처럼 스크립트가 유효성검사를 진행하게 된다 만약 값이 없으면 경우 알림창이 뜨며 포커스를 이동시켜줍니다.
# 투표하기 <br>
![image](https://user-images.githubusercontent.com/102115231/210285821-96d188cf-b6aa-45c8-a475-e62022467456.png) <br>
빈칸 중 투표번호에서는 목록을 열어 선택이 가능하다. 그리고 마지막 줄에 라디오 버튼을 통해 누른 값에 따라 Y 또는 N 으로 나눠지도록 하고, 투표하기 버튼을 누를 시 테이블이 업데이트 되며 입력 됬다는 알림창이 뜨고, 다시하기를 누르면 초기화 된다. <br>
![image](https://user-images.githubusercontent.com/102115231/210285905-d8b89f28-f3b3-47ef-b3a3-6db87efbd33d.png)
# 투표검수조회
![image](https://user-images.githubusercontent.com/102115231/210287328-e55d21af-e5f0-4f29-a50d-47ff991c0bd6.png)
<br>
<br>
<b>select V_NAME ,'19'||SUBSTR(V_JUMIN,1,2)||'년'||SUBSTR(V_JUMIN,3,2)||'월'||SUBSTR(V_JUMIN,5,2)||'일생' AS V_BIRTH , TRUNC(MONTHS_BETWEEN(SYSDATE, TO_DATE(SUBSTR('19'||V_JUMIN,1,8), 'YYYYMMDD'))/12) AS V_AGE , CASE SUBSTR(V_JUMIN,7,1) WHEN '1' THEN '남자' WHEN '2' THEN '여자' WHEN '3' THEN '남자' WHEN '4' THEN '여자' END AS V_GENDER , V_NO , SUBSTR(V_TIME,1,2) || ':' || SUBSTR(V_TIME,3,2) AS V_TIME , CASE V_CONFIRM WHEN 'Y' THEN '확인' WHEN 'N' THEN '미확인' END AS V_CONFIRM <br>
from TBL_VOTE_202005 <br>
where V_AREA = '제1투표장' </b> <br> 
<br>
<br>
투표검수조회페이지와 sql문입니다. 이 페이지에서는 제1투표장을에서 투표한 사람이 화면에 나오는 페이지로, 주민등록번호를 나누어 생년월일을 뒤에 붙여 만 나이를 구해주고 주민등록번호 숫자를 통한 성별을 알수있고, 후보들의 번호를 가져와 값을 출력해줍니다. 이전 라디오버튼에서  Y 와 N 을 나눠서 유권자확인 검사를 구별해줍니다. 
# 후보자등수
![image](https://user-images.githubusercontent.com/102115231/210287377-430318a9-0603-4cf4-8881-7dd25e864f40.png) <br>
이전에 값과 입력한 값이 같이 포함되서 현재까지에 후보들의 투표 수를 보여니다.
