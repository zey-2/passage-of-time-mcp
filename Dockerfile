# Use Python 3.12 slim image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Install pipenv
RUN pip install pipenv

# Copy Pipfile and Pipfile.lock
COPY Pipfile Pipfile.lock ./

# Install dependencies using pipenv
RUN pipenv install --system --deploy

# Copy the application code
COPY passage_of_time_mcp.py ./

# Expose port 8002
EXPOSE 8002

# Set environment variable for port (can be overridden)
ENV PORT=8002

# Run the server
CMD ["python", "passage_of_time_mcp.py"]
