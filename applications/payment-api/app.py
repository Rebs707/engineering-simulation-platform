import os
from fastapi import FastAPI, HTTPException
import psycopg

app = FastAPI()

DB_CONFIG = {
    "host": os.getenv("DB_HOST", "postgres"),
    "port": int(os.getenv("DB_PORT", "5432")),
    "dbname": os.getenv("DB_NAME", "paymentdb"),
    "user": os.getenv("DB_USER", "payment"),
    "password": os.getenv("DB_PASSWORD", "payment123"),
    "connect_timeout": 5,
}

@app.get("/health")
def health():
    return {"status": "healthy"}

@app.get("/ready")
def ready():
    try:
        with psycopg.connect(**DB_CONFIG) as connection:
            with connection.cursor() as cursor:
                cursor.execute("SELECT 1")
                cursor.fetchone()
        return {"status": "ready", "database": "connected"}
    except Exception as exc:
        raise HTTPException(status_code=503, detail=f"Database unavailable: {exc}")

@app.get("/payment")
def payment():
    try:
        with psycopg.connect(**DB_CONFIG) as connection:
            with connection.cursor() as cursor:
                cursor.execute("SELECT pg_sleep(0.1), NOW()")
                result = cursor.fetchone()
        return {"status": "completed", "database_time": str(result[1])}
    except Exception as exc:
        raise HTTPException(status_code=503, detail=f"Checkout failed: {exc}")
