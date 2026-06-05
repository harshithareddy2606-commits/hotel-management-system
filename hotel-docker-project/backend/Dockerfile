FROM python:3.10

WORKDIR /app

COPY app.py .

RUN pip install flask flask-cors mysql-connector-python

EXPOSE 5000

CMD ["python","app.py"]

