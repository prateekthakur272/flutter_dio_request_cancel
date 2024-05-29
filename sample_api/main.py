from fastapi import FastAPI
import uvicorn
import routes

app = FastAPI(
    title='Sample API',
    description='This is a sample API to test application.'
)
app.include_router(routes.router)


if __name__ == '__main__':
    uvicorn.run('main:app', reload=True)