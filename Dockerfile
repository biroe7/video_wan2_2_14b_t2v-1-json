# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# The workflow contains only unknown_registry nodes. No registry-verified custom nodes were found.
# Could not resolve unknown_registry node: MarkdownNote (no aux_id provided), skipping
# Could not resolve unknown_registry node: MarkdownNote (no aux_id provided), skipping
# Could not resolve unknown_registry node: MarkdownNote (no aux_id provided), skipping
# Could not resolve unknown_registry node: Note (no aux_id provided), skipping
# Could not resolve unknown_registry node: Note (no aux_id provided), skipping

# download models into comfyui
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors --relative-path models/clip --filename umt5_xxl_fp8_e4m3fn_scaled.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors --relative-path models/vae --filename wan_2.1_vae.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_t2v_low_noise_14B_fp8_scaled.safetensors --relative-path models/diffusion_models --filename wan2.2_t2v_low_noise_14B_fp8_scaled.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_t2v_high_noise_14B_fp8_scaled.safetensors --relative-path models/diffusion_models --filename wan2.2_t2v_high_noise_14B_fp8_scaled.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/loras/wan2.2_t2v_lightx2v_4steps_lora_v1.1_high_noise.safetensors --relative-path models/loras --filename wan2.2_t2v_lightx2v_4steps_lora_v1.1_high_noise.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/loras/wan2.2_t2v_lightx2v_4steps_lora_v1.1_low_noise.safetensors --relative-path models/loras --filename wan2.2_t2v_lightx2v_4steps_lora_v1.1_low_noise.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
