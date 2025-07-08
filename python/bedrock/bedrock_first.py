import boto3
import json

def prompt_bedrock():
    """
    Sends prompt to Amazon Bedrock 
    Model - Amazon Titan Text Lite
    Returns - A generated response form the Model

    """
    # Initialize the Bedrock Runtime
    client = boto3.client(service_name="bedrock-runtime", region_name="us-east-1")

    # Define the intended prompt
    prompt = "Write a short, positive story about a cloud engineer using AWS services to build something great"

    # Define the request payload
    payload = {
        "inputText": prompt,
        "textGenerationConfig": {
            "maxTokenCount": 4096, # Maximum tokens to generate
            "stopSequences": [],   # Stop Sequences set to none
            "temperature": 0,      # No Ramdomness
            "topP": 1              # Consider top 100% of the probabilities
        }
    }

    # Make API Request
    response = client.invoke_model(
        modelId="amazon.titan-text-lite-v1", # This represents the model id
        contentType="application/json",      # This represent the content type
        accept="application/json",           # This represent the accept type
        body=json.dumps(payload)             # Converts the dic to json string
    )

    # Parse response
    response_body = json.loads(response["body"].read())

    # Return full response
    return response_body

# Print the response
result = prompt_bedrock()

print(result)
