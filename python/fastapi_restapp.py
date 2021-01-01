from fastapi import FastAPI

app = FastAPI()

@app.get('/')
async def health_check():
    return {
            "status": "OK"
           }

@app.get('/{path}')
async def hello(
        path: str,
        q: str):
    return {
            "message": "hello, world!",
            "path": path,
            "q": q
           }
