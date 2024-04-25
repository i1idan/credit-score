# Use the official Python image as base
FROM python:3.8-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the working directory
COPY requirements.txt .

# Install any dependencies
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install "altair<5"

# Copy the content of the local src directory to the working directory
COPY . .

# Expose port 80
EXPOSE 80

# Command to run the Streamlit app
CMD ["streamlit", "run", "app/streamlit_app.py", "--server.port", "80"]
