FROM python:3.9.4-slim
WORKDIR /app
COPY . /app

RUN pip install -r requirements.txt

ENTRYPOINT ["sh", "-c", "python inference.py --im_path $IM_PATH --task $TASK; if [ \"$RUN_PX_BY_PX\" = \"true\" ]; then python px_by_px.py $ARG1 $ARG2; fi"]

