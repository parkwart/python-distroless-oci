FROM docker.io/python:3 as builder
WORKDIR /opt/app
COPY app.py .
COPY requirements.txt .
RUN pip install -r requirements.txt --no-cache-dir -t ./dependencies

FROM gcr.io/distroless/python3
WORKDIR /opt/app
COPY --from=builder /opt/app .
ENV PYTHONPATH=/opt/app/dependencies
CMD [ "app.py"]
