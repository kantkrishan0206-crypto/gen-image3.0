# ==========================================================================
JOBS_DIR=$(dirname "$0")
PROJECT_BASE=$(cd ${JOBS_DIR} || exit; pwd)
echo "PROJECT_BASE: ${PROJECT_BASE}"
# Startup path
cd ${PROJECT_BASE} || exit 1
export PYTHONPATH=${PROJECT_BASE}:$PYTHONPATH
# ==========================================================================

GPUS=${GPUS:-0,1,2,3}
HOST=${HOST:-"0.0.0.0"}
PORT=${PORT:-443}
MODEL_ID=${MODEL_ID:-"kantkrishan0206-crypto/gen-image3.0/"}

# Clear proxy
export http_proxy=
export https_proxy=
# Avoiding the 'timeout error' in httpx used by gradio. Also, gradio>=4.21.0 is required.
export GRADIO_ANALYTICS_ENABLED=False
export CUDA_VISIBLE_DEVICES="$GPUS"

python3 app/run_chatbot.py \
    --open-sidebar \
    --host ${HOST} \
    --port ${PORT} \
    --model-id "${MODEL_ID}" \
    "$@"
