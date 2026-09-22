from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    hueta: str

    model_config = SettingsConfigDict(
        env_file=".env",
        env_file_encoding="utf-8"
    )