import pandas as pd
import numpy as np
import pickle
from fastapi import FastAPI
from pydantic import BaseModel
import json
import xgboost as xgb

app = FastAPI()

# Load the model and scaler
model = pickle.load(open('xgboost_model.SAV', 'rb'))
scaler = pickle.load(open('scaler.pkl', 'rb'))

class ModelInput(BaseModel):
    Rt: float
    kW_Tot: float
    kW_RT: float
    kW_CHH: float
    Gpm: float
    Precent_CH: float
    Rh_per: float

@app.post('/predict')
def predict_new_data(input_parameters: ModelInput):
    input_data = input_parameters.json()
    input_dictionary = json.loads(input_data)
    print(input_dictionary)
    input_list = [
        input_dictionary['Rt'],
        input_dictionary['kW_Tot'],
        input_dictionary['kW_RT'],
        input_dictionary['kW_CHH'],
        input_dictionary['Gpm'],
        input_dictionary['Precent_CH'],
        input_dictionary['Rh_per']
    ]
    
    # Scale the input data
    input_data_scaled = scaler.transform([input_list])
    
    # Predict using the loaded model
    prediction = model.predict(xgb.DMatrix(input_data_scaled))
    
    return {"Chiller load_percentage required": f"{prediction[0]:.2f}"}
