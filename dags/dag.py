from airflow import DAG
from airflow.operators.dummy_operator import DummyOperator
from datetime import datetime, timedelta

# Default arguments
default_args = {
    'owner': 'airflow',
    'start_date': datetime(2025, 1, 16),
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

# Define the DAG
dag = DAG(
    'simple_airflow_dag',
    default_args=default_args,
    description='A simple example DAG',
    schedule_interval=timedelta(days=1),
    catchup=False,
)

# Define tasks
start_task = DummyOperator(task_id='start', dag=dag)
process_task = DummyOperator(task_id='process_data', dag=dag)
end_task = DummyOperator(task_id='end', dag=dag)

# Set task dependencies
start_task >> process_task >> end_task
