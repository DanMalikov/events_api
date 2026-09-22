from fastapi import FastAPI

from app_py.presentation.routers.event_routers import event_router


def create_app():
    app = FastAPI(root_path="/api")

    app.include_router(event_router)

    return app

