FROM python:3.11-slim
# Set the working directory
WORKDIR /app
# Create a non-root user
RUN useradd -m myuser
# Copy the requirements file into the container
COPY requirements.txt .
# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt
#make folders
RUN mkdir -p logs qr_codes && chown -R myuser:myuser logs qr_codes
COPY --chown=myuser:myuser . .
USER myuser
ENTRYPOINT ["python3", "main.py"]
CMD ["--url", "http://github.com/kaw393939"]

