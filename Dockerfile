# B22 Capstone - Mouse Physiological Variability Analysis

FROM python:3.11-slim

LABEL maintainer="B22 Capstone Team"
LABEL description="Analysis environment for mouse temperature and activity time-series data"

# Set working directory
WORKDIR /workspace

# Install system dependencies 
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gfortran \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY data/ ./data/
COPY notebooks/ ./notebooks/
COPY README.md .

# Expose Jupyter Lab port
EXPOSE 8888

# Set environment variables
ENV JUPYTER_ENABLE_LAB=yes

# Run Jupyter Lab
# --ip=0.0.0.0 allows access from outside container
# --no-browser prevents attempting to open browser in container
# --allow-root allows running as root user
# --NotebookApp.token='' disables authentication (use only in trusted environments)
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
