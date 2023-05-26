FROM zarak.fr:8092/cache/library/python:3.10-slim-buster

RUN useradd -ms /bin/bash u
USER u
WORKDIR  /app
COPY . .
RUN pip install -r requirements.txt --user
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=9000
EXPOSE 9000
CMD [ "python", "-m" , "flask", "run"]

