# Jenkins docker

## 생성

- run.sh 파일을 실행하여 생성 및 실행.
- 현재 폴더의 `jenkins_home`을 jenkins docker의 volume으로 마운팅해서 `jenkins_home` 폴더로 사용한다.
- 포트는 다음과 같이 맵핑되어 있지만 적당히 변경하여 사용한다.
  - Host:80 => Image:8000
  - Host:50000 => Image:50000

## 중단

- stop.sh 파일을 실행하여 jenkins 서버 종료.

## Shell 연결

- jenkins 가 실행된 상태에서 bash.sh 파일을 실행하여 jenkins 서버의 bash 터미널을 실행할 수 있다.

## 참고

- docker image는 하나지만 jenkins_home 볼륨을 여러 버전으로 만들어서 개발용, 테스트용, 상용 등의 instance를 따로 띄워서 작업하는 것도 가능하다.
