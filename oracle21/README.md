# Oracle Docker image

Oracle은 공식적으로는 Docker image를 배포하지 않는다.
그래도 가장 쓸만한 이미지가 아래 이미지이다.

- Docker Image  
  <https://hub.docker.com/r/gvenzl/oracle-xe>

## Docker Pull

위의 docker hub 설명 페이지에 가보면 21버전 말고도 지원되는 버전이 모두 표시되어 있으므로 다른 버전이 필요하다면 직접 페이지에서 표시하는 이미지를 사용하면 된다. run을 하면 자동으로 이루어지므로 굳이 pull은 하지 않아도 된다.

```
docker pull gvenzl/oracle-xe:21
```

## Quick start

설명 페이지의 실행 명령 샘플은 아래와 같다.

```
docker run -d -p 1521:1521 -e ORACLE_PASSWORD=<your password> -v oracle-volume:/opt/oracle/oradata gvenzl/oracle-xe
```

현재 devsvr에서 실행한 명령은 아래와 같다.  
data 볼륨을 따로 설정하여 실행하였으며 data 볼륨이 따로 있으면 `--rm` 옵션으로 실행해도 나중에 다시 실행할 때 그대로 복구되는 것을 확인하였다. 21버전만 유지되면 정상동작할 것으로 예상된다.  
당연히 data 볼륨에는 쓰기 권한이 있어야 하며 mount된 hdd가 root만 쓰기권한이 있어서 따로 권한을 777로 해제해주고 실행하였다.

```
docker run \
        -d \
        --rm \
        --name oracle21 \
        -p 1521:1521 \
        -e ORACLE_PASSWORD=Iotree123!@# \
        -v $PWD/data:/opt/oracle/oradata \
        gvenzl/oracle-xe:21
```

## 기본 정보

tag 버전 21이면 Major 버전 21 중에서 최신 버전이 사용된다. (현재 21.3.0)

### 기본 생성 DB (Service)

- freepdb1 (docker의 설명 페이지에서는 XEPDB1이 생성된다고 했지만 로그를 보니 freepdb1이 맞다.)

### 기본 사용자 정보

처음 실행 명령에서 지정한 변수들의 값으로 아래 사용자가 생성된다.
위 명령에서 지정된 ORACLE_PASSWORD 처럼 APP_USER, APP_USER_PASSWORD도 지정할 수 있다.
하지만 현재 따로 사용자를 추가하진 않았으며 사실 추가할 필요도 없다.
새로운 스키마를 추가하면서 해당 스키마의 사용자가 추가되며 일반적으로 그 사용자를 사용하기 때문이다.

- Database Admin User: system
- Database Admin User Password: $ORACLE_PASSWORD
- Database App User: $APP_USER
- Database App User Password: $APP_USER_PASSWORD

## 기타 명령어

- SYS, SYSTEM 계정 password 리셋

```
docker exec oracle21 resetPassword <ORACLE_PASSWORD>
```

- 사용자 추가

기본 system 계정 외에 다른 사용자 계정은 스키마를 생성할 때 같이 생성하므로 이 명령이 사용될 일이 별로 없다. 참고로 기록해둔다.

```
docker exec oracle21 createAppUser <APP_USER> <APP_USER_PASSWORD> [<TARGET_PDB>]
