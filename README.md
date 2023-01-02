# vote
<b> Index 화면 </b>
![image](https://user-images.githubusercontent.com/102115231/210199845-665cea4f-5da2-404e-8b4e-9c0b875edcfe.png)<br>
<b> 후보조회 화면 </b> <br>
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
투표하기 <br>

여러 빈칸 중 투표번호는 선택할수가 있다 그리고 마지막칸있는 라디오 버튼은 누른 값에 따라 Y N 으로 바뀌게 된다 그리고 투표하기 버튼을 누르면 테이블의 업데이트된고 다시하기를 누르면 초기화 된다.
