# docker

Docker scripts collections

## MariaDB

- db data가 저장될 경로를 적절히 수정해서 run.sh를 실행하면 된다. start.sh는 따로 없으며 종료는 stop.sh를 실행한다.
- run.sh에는 **현재 경로 밑에 data 폴더를 default data 폴더로 지정**하고있지만 gitlab의 run.sh 스크립트를 참고해서 수정하면 원하는 경로를 지정할 수 있다.
- data 볼륨의 경로만 바꿔주면 여러 DB를 운영할 수도 있다.

## Jenkins

- jenkins data가 저장될 경로를 적절히 수정해서 run.sh를 실행하면 된다. start.sh는 따로 없으며 종료는 stop.sh를 실행한다.
- run.sh에는 **현재 경로 밑에 jenkins_home 폴더를 default home 폴더로 지정**하고있지만 gitlab의 run.sh 스크립트를 참고해서 수정하면 원하는 경로를 지정할 수 있다.

## Gitlab

- gitlab data가 위치할 경로를 run.sh 에 적절히 지정해주어야 한다.
- run.sh는 최초에 한 번만 실행하고 그 이후에는 start.sh, stop.sh를 이용해서 시작, 종료해준다.
- 참고로 gitlab data 경로만 외부 경로를 적절히 지정했다면 stop 시킨 후에 docker image를 지우고 다시 run.sh를 실행해도 이전 데이터는 모두 살아있다.
