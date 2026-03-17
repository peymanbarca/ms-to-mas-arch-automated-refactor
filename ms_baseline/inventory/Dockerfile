FROM python:3.10-slim

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir \
    fastapi \
    uvicorn \
    requests \
    pymongo

EXPOSE 8001

CMD ["uvicorn", "inventory_service:app", "--host", "0.0.0.0", "--port", "8001"]