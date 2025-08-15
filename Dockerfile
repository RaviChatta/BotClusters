FROM python:3.11-slim

WORKDIR /app

# Copy and run install script (if needed)
COPY install.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/install.sh && /usr/local/bin/install.sh || true

# Install Python dependencies
COPY requirements.txt ./
RUN echo "supervisor" >> requirements.txt && pip install --no-cache-dir -r requirements.txt

# Copy rest of the project
COPY . .

EXPOSE 5000
CMD ["python3", "cluster.py"]
