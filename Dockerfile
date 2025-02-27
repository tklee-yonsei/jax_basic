# 베이스 이미지로 Ubuntu 22.04 사용
FROM ubuntu:22.04

# 필수 시스템 패키지 설치 및 Python 3.10 설치
RUN apt-get update && apt-get install -y \
    software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update && apt-get install -y \
    python3.10 \
    python3.10-venv \
    python3.10-dev \
    python3-pip \
    build-essential \
    wget \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Python 3.10을 기본 python3로 설정
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1

# Python 패키지 관리자(pip) 최신 버전으로 업데이트
RUN pip3 install --upgrade pip

# 추가 시스템 패키지 설치
RUN apt-get update && apt-get install -y \
    pkg-config \
    libhdf5-dev \
    && rm -rf /var/lib/apt/lists/*

# JAX 및 필요한 라이브러리 설치
RUN pip3 install \
    jax \
    jaxlib \
    numpy \
    scipy \
    pandas \
    matplotlib

# Keras 3 설치
RUN pip3 install keras

# Jupyter Notebook 설치
RUN pip3 install jupyter

# 작업 디렉토리 설정
WORKDIR /app

# Jupyter Notebook을 실행하는 기본 명령 설정
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
