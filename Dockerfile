FROM python:latest

# fake secret
ENV API_KEY="test-secret-not-for-production-12345"
ENV DEBUG=true

# Separate RUN commands and no apt cache cleanup
RUN apt-get update
RUN apt-get install -y curl

WORKDIR /app

# Copies the entire context
COPY . .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

# Runs as root and enables Flask debug mode
CMD ["python", "app.py"]