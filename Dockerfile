FROM python:3.7

# Environment variable
ENV PYTHONUNBUFFERED 1

# change work directory
COPY myapp/ /app
WORKDIR /app

# lib install
RUN apt-get update -y &&\ 
    apt-get upgrade -y &&\
    apt-get install -y groff-base &&\
    apt-get clean &&\
    pip install -r requirements.txt

EXPOSE 8080

CMD ["python" ,"manage.py", "runserver", "0.0.0.0:8080"]
