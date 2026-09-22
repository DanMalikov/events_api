from fastapi import APIRouter

event_router = APIRouter()

@event_router.get("/health")
async def health_check():
    return {"status": "ok"}
