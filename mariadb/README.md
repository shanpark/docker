# MariaDB docker

## 생성

- run.sh 파일을 실행하여 생성 및 실행.
- 현재 폴더의 `data` 폴더를 mariadb docker의 volume으로 마운팅해서 DB data 폴더로 사용한다.
- 포트는 다음과 같이 맵핑되어 있지만 적당히 변경하여 사용한다.
  - Host:13306 => Image:3306

## 중단

- stop.sh 파일을 실행하여 mariadb 서버 종료.

## Shell 연결

- mariadb 가 실행된 상태에서 bash.sh 파일을 실행하여 mariadb 서버의 bash 터미널을 실행할 수 있다.

## Dump, Restore

- dump.sh, restore.sh 파일로 DB 데이터 전체를 백원, 복원할 수 있다. (테스트해보진 않음)

## 참고

- docker image는 하나지만 data 볼륨의 경로를 바꿔서 여러 버전으로 instance를 띄워서 작업하는 것도 가능하다.
