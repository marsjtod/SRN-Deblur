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

# 1. GPU enabled OS
FROM kmubigdata/ubuntu-cuda-cudnn

# 2. basic
RUN apt-get update
RUN apt-get install -y libcupti-dev

# 3. pip
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN apt-get -y install python
RUN python get-pip.py 
RUN apt-get install -y python-pip python-dev 

# 4. tensorflow
# tensorflow python
RUN pip install tensorflow-gpu==1.4
ENV LD_LIBRARY_PATH /usr/local/cuda-8.0/lib64/:${LD_LIBRARY_PATH}

# 5. pip modules
RUN pip install scipy Scikit-image numpy