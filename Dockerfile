FROM python:3.14-slim

RUN python -m pip install --no-cache-dir uv

ENV UV_COMPILE_BYTECODE=1 \
    UV_CACHE_DIR=/tmp/.uv_cache \
    UV_LINK_MODE=copy \
    PYTHONUNBUFFERED=1 \
    PATH="/app/.venv/bin:$PATH"

RUN addgroup --system --gid 1000 appuser && \
    adduser --system --uid 1000 --ingroup appuser appuser

WORKDIR /app

COPY --chown=appuser:appuser pyproject.toml uv.lock ./
RUN uv sync --frozen --no-cache --no-install-project

COPY --chown=appuser:appuser app_py ./app_py

USER appuser

EXPOSE 8000

CMD ["uvicorn", "app_py.main:app", "--host", "0.0.0.0", "--port", "8000"]
