from fastapi.routing import APIRouter
from fastapi.responses import JSONResponse
from fastapi import status

router = APIRouter(prefix='/api')

@router.get('/sample', response_class=JSONResponse, status_code=status.HTTP_200_OK)
async def get_data():
    return JSONResponse({'message': 'Hello from server'})