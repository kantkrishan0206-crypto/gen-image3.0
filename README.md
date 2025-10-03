# gen-image3.0
a powerful, large-scale, multimodal model for Text-to-Image generation.
<p align="center">
  <img src=" https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.washingtonpost.com%2Ftechnology%2Finteractive%2F2022%2Faiimagegenerator%2F&psig=AOvVaw2dK9kBzpcLWBYCIZnd_Vn5&ust=1759587060396000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCLCZieKaiJADFQAAAAAdAAAAABAm" width="600"/>
</p>



<h1 align="center">🎨 gen-image3.0</h1>
<p align="center">
  A large-scale, multimodal Text-to-Image generation model — fully open-source and commercial-grade.
</p>

---

## 📖 Introduction
**gen-image3.0** is a state-of-the-art AI model that generates high-quality images from textual descriptions. It uses a **unified autoregressive multimodal framework**, meaning it deeply understands both text and image data to create visually compelling outputs.  

In simple words:
- **What it is:** An AI model that turns text prompts into images.  
- **Who made it:** Your team (inspired by open-source breakthroughs).  
- **Why it matters:** It’s large, intelligent, accurate in rendering details (including text), and fully open-source for commercial use.

---

## ✨ Key Features
- **Unified Multimodal Architecture:** Integrates text and image modalities for contextually rich image generation.
- **Largest Open-Source Image Generation Model:** ~80 billion parameters with a Mixture-of-Experts (MoE) design (13B active per token).
- **World-Knowledge Reasoning:** Can intelligently fill missing details using common sense.
- **Ultra-Long Prompt Understanding:** Handles text prompts over 1,000 characters for fine-grained scene control.
- **Accurate Text Rendering:** Supports precise generation of titles, logos, annotations, and multilingual text.
- **Commercial Use:** Fully open-source for developers and businesses (some geographic restrictions may apply).

---

## 💻 System Requirements
Due to its size, gen-image3.0 requires high-end hardware:

- **GPU Memory:** ≥3 × 80GB VRAM (4 × 80GB recommended, e.g., NVIDIA A100/H100)  
- **Disk Space:** 170GB for model weights  
- **Operating System:** Linux with CUDA 12.8  

---

## 📦 Environment Setup
1. **Python:** 3.12+  
2. **PyTorch:** 2.7.1 with CUDA 12.8  
3. **Install Dependencies:**
```bash
pip install torch==2.7.1 tor

pip install flash-attn==2.8.3 --no-build-isolation
pip install flashinfer-python


## 🚀 Usage:
from transformers import AutoModelForCausalLM

model_id = "./gen-image3"

kwargs = dict(
    attn_implementation="sdpa",    # "flash_attention_2" if installed
    trust_remote_code=True,
    torch_dtype="auto",
    device_map="auto",
    moe_impl="eager",              # "flashinfer" if installed
)

model = AutoModelForCausalLM.from_pretrained(model_id, **kwargs)
model.load_tokenizer(model_id)

prompt = "A brown and white dog is running on the grass"
image = model.generate_image(prompt=prompt, stream=True)
image.save("image.png")



chvision==0.22.1 torchaudio==2.7.1 --index-url https://download.pytorch.org/whl/cu128
pip install -r requirements.txt
