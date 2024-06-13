### Prerequisite: Install open-intrsuct module from here: https://github.com/allenai/open-instruct
# you need 8 GPUs for full finetuning
export CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7

DATA_DIR=<path_to_coconot_pref_data> # this should in the standard chosen/rejected list of messages format (see [UltraFeedback for an example](https://huggingface.co/datasets/allenai/ultrafeedback_binarized_cleaned)
NUM_GPUS=8
BATCH_SIZE_PER_GPU=1
TOTAL_BATCH_SIZE=32
GRADIENT_ACC_STEPS=$(($TOTAL_BATCH_SIZE/$NUM_GPUS/$BATCH_SIZE_PER_GPU))
echo "Training model using $NUM_GPUS GPUs, $BATCH_SIZE_PER_GPU batch size per GPU, $GRADIENT_ACC_STEPS gradient accumulation steps"


accelerate launch \
    --mixed_precision bf16 \
    --num_machines 1 \
    --num_processes $NUM_GPUS \
    --use_deepspeed \
    --deepspeed_config_file ds_configs/stage3_no_offloading_accelerate.conf \
    open_instruct/dpo_tune.py \
    --model_name_or_path <lora_tuned_model_path> \
    --use_flash_attn \
    --gradient_checkpointing \
    --tokenizer_name <lora_tuned_model_path> \
    --use_slow_tokenizer \
    --train_file $DATA_DIR \
    --max_seq_length 2048 \
    --preprocessing_num_workers 16 \
    --per_device_train_batch_size $BATCH_SIZE_PER_GPU \
    --gradient_accumulation_steps $GRADIENT_ACC_STEPS \
    --learning_rate 5e-7 \
    --lr_scheduler_type linear \
    --warmup_ratio 0.1 \
    --weight_decay 0. \
    --num_train_epochs 1 \
    --output_dir ./output \
    --with_tracking \
    --report_to tensorboard \
    --logging_steps 1