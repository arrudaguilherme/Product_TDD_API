from decouple import config   #get values from env variables
from sqlalchemy import create_engine #sqlalchemy engine
from sqlalchemy.orm import sessionmaker #session function


DB_URL = config('DB_URL')

engine = create_engine(DB_URL, pool_pre_ping=True)
Session = sessionmaker()


Session()
