FROM python:3.9.6-buster

#RUN pwd
#RUN ls -la
#
#RUN ls -l
#
#RUN apt update
#RUN apt install -y htop

WORKDIR /var/app

COPY app/requirements.txt /var/app

RUN pip install -r requirements.txt

COPY app /var/app

RUN ls -l

COPY entrypoint.sh ./
RUN chmod a+x entrypoint.sh

ENV FLASK_ENV=development

EXPOSE 5000

ENTRYPOINT ["./entrypoint.sh"]
CMD ["flask", "run", "--host=0.0.0.0"]