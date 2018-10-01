from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from datetime import datetime, timedelta


default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2018, 10, 1),
    'email': ['siyan355@gmail.com'],
    'email_on_failure': True,
    'email_on_retry': True,
    'retries': 2,
    'retry_delay': timedelta(minutes= 5),
    # 'queue': 'bash_queue',
    # 'pool': 'backfill',
    # 'priority_weight': 10,
    # 'end_date': datetime(2016, 1, 1),
}

dag = DAG('airQualityWeather', default_args=default_args, schedule_interval=timedelta(days=1))

parent = None
task_year = 1980
now = datetime.now()
current_year = now.year

while task_year <= 1988:
    '''
    Run the batch processes year by year
    '''
    if parent:
        t1.set_upstream(parent)
    t1 = BashOperator(
        task_id='download_{}'.format(task_year),
        bash_command='python /home/ubuntu/insightProject/src/loadDataToS3/download_toLocal.py {{params.task_year}}',
        params={'task_year': str(task_year)},
        dag=dag)

    t2 = BashOperator(
        task_id='upload_{}_csv_toS3'.format(task_year),
        bash_command='cd /home/ubuntu/insightProject/src/loadDataToS3/; ./uploadToS3.sh ', #a space is necessary after .sh
        dag=dag)

    t3 = BashOperator(
        task_id='process_{}'.format(task_year),
        bash_command='/home/ubuntu/insightProject/src/spark/run_join_airQ_weather.sh {{params.task_year}}',
        params={'task_year': str(task_year)},
        dag=dag)
    #t2 depend on t1
    t2.set_upstream(t1)
    # next download task start after the clearence of the files in previous loop
    parent = t2
    t3.set_upstream(t2)
    task_year = task_year + 1

# t4 = BashOperator(
#     task_id='update_db',
#     bash_command='/home/ubuntu/insightProject/src/spark/update_db.sh',
#     dag=dag)
