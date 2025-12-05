from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base
from sqlalchemy.pool import NullPool


import os
from dotenv import load_dotenv

load_dotenv()  # تحميل بيئة .env

# ============= DATABASE URL =============
# عدّليها حسب معلومات PostgreSQL عندك
DATABASE_URL = os.getenv("DATABASE_URL")


# ============= ENGINE =============
engine = create_engine(
    DATABASE_URL,
    poolclass=NullPool,      # يمنع الأخطاء المتعلقة بالـ Idle connections
    echo=False               # لو تبغي تشوفي كل SQL خليها True
)

# ============= SESSION =============
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# ============= BASE CLASS =============
Base = declarative_base()

# ============= DB DEPENDENCY (FastAPI) =============
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
