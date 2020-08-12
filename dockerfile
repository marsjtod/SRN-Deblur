#docker build =>
#sudo docker build --tag srn-deblur:0.1 ./
#docker run ==> 
#docker run -it --gpus all -v "/mnt/e/workspace":/home/mars/workspace -w "/home/mars/workspace" -p 8890:8890 srn-deblur:0.1
#inferring
# ==> cd git/SRN-Deblur
# (GPU version)
# ==> python run_model.py --input_path=./testing_set --output_path=./testing_res
# (CPU version)
# ==> python run_model.py --gpu=-1 --input_path=./testing_set --output_path=./testing_res

FROM kmubigdata/ubuntu-cuda-cudnn

RUN apt-get update
RUN apt-get install -y libcupti-dev
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN apt-get -y install python
RUN python get-pip.py 
RUN apt-get install -y python-pip python-dev 
RUN pip install tensorflow-gpu==1.4
ENV LD_LIBRARY_PATH /usr/local/cuda-8.0/lib64/:${LD_LIBRARY_PATH}

RUN pip install scipy Scikit-image numpy