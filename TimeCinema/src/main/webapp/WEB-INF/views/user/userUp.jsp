<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <!-- link file css -->
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/userUp.css"
    />

    <!-- Link font -->
    <link rel="preconnect" href="https://fonts.googleapis.com/" />
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
      rel="stylesheet"
    />

    <title></title>
  </head>
  <body>
    <div class="login-wrapper">
      <h2>회원가입</h2>
      <form
        action="${pageContext.request.contextPath}/user/join"
        method="post"
        name="joinForm"
      >
        <div class="form-group">
          <!--사용자클래스선언-->
          <label for="id">아이디</label>
          <div class="input-group">
            <!--input2탭의 input-addon을 가져온다 -->
            <input
              type="text"
              class="form-control"
              name="userId"
              id="userId"
              placeholder="아이디를 (영문포함 8~12자 이상)"
            />
            <div class="input-group-addon">
              <button type="button" class="btn btn-primary" id="idCheckBtn">
                아이디 중복체크
              </button>
            </div>
          </div>
          <span id="msgId"></span>
          <!--자바스크립트에서 추가-->
        </div>
        <div class="form-group">
          <!--기본 폼그룹을 가져온다-->
          <label for="password">비밀번호</label>
          <input
            type="password"
            name="userPw"
            class="form-control"
            id="userPw"
            placeholder="비밀번호 (영 대/소문자, 숫자 조합 8~16자 이상)"
          />
          <span id="msgPw"></span>
          <!--자바스크립트에서 추가-->
        </div>
        <div class="form-group">
          <label for="password-confrim">비밀번호 확인</label>
          <input
            type="password"
            class="form-control"
            id="pwConfirm"
            placeholder="비밀번호를 확인해주세요."
          />
          <span id="msgPw-c"></span>
          <!--자바스크립트에서 추가-->
        </div>
        <div class="form-group">
          <label for="name">이름</label>
          <input
            type="text"
            name="userName"
            class="form-control"
            id="userName"
            placeholder="이름을 입력하세요."
          />
        </div>
        <div class="form-group email-form">
          <label for="email">이메일</label><br />
          <div class="input-group">
            <input
              type="text"
              name="userEmail"
              class="form-control"
              id="userEmail"
              placeholder="이메일"
            />
            <div class="input-group-addon">
              <button type="button" id="mail-check-btn" class="btn btn-primary">
                이메일 인증
              </button>
            </div>
          </div>
        </div>
        <div class="mail-check-box">
          <input
            type="text"
            class="form-control mail-check-input"
            placeholder="인증번호 6자리를 입력하세요."
            maxlength="6"
            disabled="disabled"
          />
          <span id="mail-check-warn"></span>
        </div>

        <!--button탭에 들어가서 버튼종류를 확인한다-->
        <div class="form-group">
          <button
            type="button"
            id="joinBtn"
            class="btn btn-lg btn-success btn-block"
          >
            회원가입
          </button>
        </div>

        <div class="form-group">
          <button type="button" class="btn btn-lg btn-info btn-block">
            로그인
          </button>
        </div>
      </form>
    </div>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
      let code = ''; // 이메일 전송 인증번호 저장을 위한 변수.
      let idFlag, pwFlag; // 정규표현식 유효성 검사 여부 판단.

      //아이디 중복 체크
      document.getElementById('idCheckBtn').onclick = function () {
        const userId = document.getElementById('userId').value;
        console.log('userId: ' + userId);
        if (userId === '') {
          alert('아이디는 필수값입니다.');
          return;
        }

        if (!idFlag) {
          alert('유효하지 않은 아이디 입니다.');
          return;
        }

        //비동기 요청을 fetch()로 보내고 결과를 확인하기.
        //화살표 함수 내의 코드가 한 줄이고, 그것이 return이라면 괄호와 return 생략 가능
        fetch('${pageContext.request.contextPath}/user/id/' + userId)
          .then((res) => res.text()) //요청 완료 후 응답 정보에서 텍스트 데이터가 담긴 Promise 반환.
          .then((data) => {
            //텍스트 데이터만 담긴 Promise 객체로부터 data를 전달받음.
            if (data === 'ok') {
              //더 이상 아이디를 작성할 수 없도록 막아주겠다.
              document.getElementById('userId').setAttribute('readonly', true);
              //더 이상 버튼을 누를 수 없도록 버튼 비활성화.
              document
                .getElementById('idCheckBtn')
                .setAttribute('disabled', true);
              //메세지 남기기
              document.getElementById('msgId').textContent =
                '사용 가능한 아이디 입니다.';
            } else {
              document.getElementById('msgId').textContent =
                '중복된 아이디 입니다.';
              document.getElementById('userId').value = ''; //입력칸 비우기
              document.getElementById('userId').focus(); //입력칸에 포커싱.
            }
          });
      }; // 아이디 중복확인 끝.

      //인증번호 이메일 전송
      document.getElementById('mail-check-btn').onclick = function () {
        const email = document.getElementById('userEmail').value;
        console.log('완성된 email: ', email);
        fetch('${pageContext.request.contextPath}/user/email', {
          method: 'post',
          headers: {
            'Content-Type': 'text/plain',
          },
          body: email,
        })
          .then((res) => res.text())
          .then((data) => {
            console.log('인증번호: ', data);
            //비활성화된 인증번호 입력창을 활성화
            document.querySelector('.mail-check-input').disabled = false;
            code = data; //서버가 전달한 인증번호를 전역변수에 저장.
            alert(
              '인증번호가 전송되었습니다. 확인 후 입력란에 정확히 입력하세요.'
            );
          })
          .catch((error) => {
            console.log(error);
            alert('알 수 없는 문제가 발생했습니다. 관리자에게 문의하세요!');
          }); // 비동기 끝.
      }; //이메일 인증 버튼 클릭 이벤트 끝

      //인증번호 검증
      //blur -> focus가 벗어나는 경우 발생.
      document.querySelector('.mail-check-input').onblur = function (e) {
        // console.log('blur 이벤트 발생 확인!');
        const inputCode = e.target.value; //사용자가 입력한 인증번호.
        const $resultMsg = document.getElementById('mail-check-warn'); //span
        console.log('사용자가 입력한 값: ', inputCode);

        if (inputCode === code) {
          $resultMsg.textContent = '인증번호가 일치합니다.';
          $resultMsg.style.color = 'green';
          //이메일 인증을 더 이상 못하게 버튼 비활성.
          document.getElementById('mail-check-btn').disabled = true;
          document.getElementById('userEmail').setAttribute('readonly', true);

          e.target.style.display = 'none'; //인증번호 입력창 숨기기
        } else {
          $resultMsg.textContent = '인증번호를 다시 확인해 주세요.';
          $resultMsg.style.color = 'red';
          e.target.focus();
        }
      }; //인증번호 검증 끝.

      //폼 데이터 검증 (회원 가입 버튼 눌렀을 시)
      document.getElementById('joinBtn').onclick = function () {
        if (idFlag && pwFlag) {
          if (!document.getElementById('userId').getAttribute('readonly')) {
            alert('아이디 중복체크는 필수입니다!');
            return;
          }
          if (document.getElementById('userName').value === '') {
            alert('이름은 필수값입니다.');
            return;
          }
          if (!document.getElementById('mail-check-btn').disabled) {
            alert('이메일 인증을 완료해 주세요.');
            return;
          }

          if (confirm('회원가입을 진행합니다.')) {
            document.joinForm.submit();
          } else return;
        } else {
          alert('입력값을 다시 한 번 확인하세요!');
        }
      };

      /*아이디 형식 검사 스크립트*/
      var id = document.getElementById('userId');
      id.onkeyup = function () {
        /*
            자바스크립트의 정규표현식 입니다.
            정규표현식: 문자열 내의 특정 문자 조합을 찾기 위한 패턴입니다.
            특정 규칙이 있는 문자열 집합을 대상으로 규칙을 직접 지정하여 탐색할 수 있게 해 주는
            메타 문자입니다.
        */
        var regex = /^[A-Za-z0-9+]{8,12}$/;
        // test(문자열) -> 정규표현식의 규칙에 어긋나지 않는 문자라면 true, 어긋난다면 false
        if (regex.test(document.getElementById('userId').value)) {
          document.getElementById('userId').style.borderColor = 'green';
          document.getElementById('msgId').innerHTML =
            '아이디 중복 체크는 필수 입니다';
          idFlag = true;
        } else {
          document.getElementById('userId').style.borderColor = 'red';
          document.getElementById('msgId').innerHTML =
            '부적합한 아이디 입니다.';
          idFlag = false;
        }
      };

      /*비밀번호 형식 검사 스크립트*/
      var pw = document.getElementById('userPw');
      pw.onkeyup = function () {
        var regex = /^[A-Za-z0-9+]{8,16}$/;
        if (regex.test(document.getElementById('userPw').value)) {
          document.getElementById('userPw').style.borderColor = 'green';
          document.getElementById('msgPw').innerHTML = '사용가능합니다';
          pwFlag = true;
        } else {
          document.getElementById('userPw').style.borderColor = 'red';
          document.getElementById('msgPw').innerHTML =
            '비밀번호를 제대로 입력하세요.';
          pwFlag = false;
        }
      };

      /*비밀번호 확인검사*/
      var pwConfirm = document.getElementById('pwConfirm');
      pwConfirm.onkeyup = function () {
        var regex = /^[A-Za-z0-9+]{8,16}$/;
        if (
          document.getElementById('pwConfirm').value ==
          document.getElementById('userPw').value
        ) {
          document.getElementById('pwConfirm').style.borderColor = 'green';
          document.getElementById('msgPw-c').innerHTML =
            '비밀번호가 일치합니다';
          pwFlag = true;
        } else {
          document.getElementById('pwConfirm').style.borderColor = 'red';
          document.getElementById('msgPw-c').innerHTML =
            '비밀번호 확인란을 확인하세요';
          pwFlag = false;
        }
      };
    </script>
  </body>
</html>
