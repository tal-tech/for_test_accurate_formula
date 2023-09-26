FROM registry.cn-beijing.aliyuncs.com/ailab-paas/cuda10_opencv:v0.0.0.1

RUN  apt-get install -y libglib2.0-dev && \
     apt-get install -y libboost-dev libboost-filesystem-dev libboost-system-dev libboost-log-dev && \
     apt-get install -y libcurl4-openssl-dev

COPY package/ /home/for_test_accurate_formula/package
WORKDIR /home/for_test_accurate_formula/package/bin
RUN  echo '/home/for_test_accurate_formula/lib' > /etc/ld.so.conf.d/for_test_accurate_formula.conf && ldconfig
RUN chmod 777 -Rf /home/for_test_accurate_formula/package/bin/*

COPY ./formula /home/for_test_accurate_formula/formula

ENV LD_LIBRARY_PATH=/home/for_test_accurate_formula/formula/lib:${LD_LIBRARY_PATH}
ENV LD_LIBRARY_PATH=/home/for_test_accurate_formula/package/lib:${LD_LIBRARY_PATH}

CMD export BLADE_REGION=cn-beijing && export BLADE_TOKEN=hwl21g2KmE7ME3OnnSqd9jrQpo3GMn4XKUWxl2JcO4ybp && ./AccurateFormula
