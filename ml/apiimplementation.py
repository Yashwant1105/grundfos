import json
import requests

# API URL
url = 'https://8j0t70j7-8000.inc1.devtunnels.ms/predict'  # API endpoint

# Input data to be sent to the model
input_data_for_model = {
    #341.6, 263, 0.77, 199.1, 1322.5, 75.7, 69.8
    'Rt': 341.6,
    'kW_Tot': 263,
    'kW_RT': 0.77,
    'kW_CHH': 199.1,
    'Gpm': 1322.5,
    'Precent_CH': 75.7,
    'Rh_per': 69.8
}

# Make a POST request to the FastAPI model prediction endpoint
response = requests.post(url, json=input_data_for_model)

# Check the response status code and content
if response.status_code == 200:
    prediction = response.json()  # Get the JSON response
    print("Prediction response:", prediction)
else:
    print(f"Failed with status code {response.status_code}. Response: {response.text}")
