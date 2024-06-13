### Prerequisite: Install open-intrsuct module from here: https://github.com/allenai/open-instruct
export CUDA_VISIBLE_DEVICES=0,1,2,3 #,4,5,6,7

DATA_DIR=<path_to_coconot_sft_data>
MODEL_SIZE=7B
NUM_GPUS=2 # 8 for full finetuning
BATCH_SIZE_PER_GPU=2
TOTAL_BATCH_SIZE=128 
GRADIENT_ACC_STEPS=$(($TOTAL_BATCH_SIZE/$NUM_GPUS/$BATCH_SIZE_PER_GPU))
echo "Safety tuning tulu2 model ${MODEL_SIZE} using $NUM_GPUS GPUs, $BATCH_SIZE_PER_GPU batch size per GPU, $GRADIENT_ACC_STEPS gradient accumulation steps"


accelerate launch \
    --mixed_precision bf16 \
    --num_machines 1 \
    --num_processes $NUM_GPUS \
    --use_deepspeed \
    --deepspeed_config_file ds_configs/stage3_no_offloading_accelerate.conf \
    open_instruct/finetune.py \
    --model_name_or_path allenai/tulu-2-7b \
    --use_flash_attn \
    --tokenizer_name allenai/tulu-2-7b \
    --use_slow_tokenizer \
    --train_file $DATA_DIR \
    --max_seq_length 2048 \
    --preprocessing_num_workers 16 \
    --checkpointing_steps epoch \
    --per_device_train_batch_size $BATCH_SIZE_PER_GPU \
    --gradient_accumulation_steps $GRADIENT_ACC_STEPS \
    --learning_rate 1e-5 \
    --lr_scheduler_type cosine \
    --warmup_ratio 0.03 \
    --weight_decay 0. \
    --num_train_epochs 1 \
    --output_dir ./output \
    --with_tracking \
    --report_to tensorboard \
    --logging_steps 1 \
    --use_lora \
    --lora_rank 64 \
    --lora_alpha 16 \
    --lora_dropout 0.1 \


python open_instruct/merge_lora.py \
    --base_model_name_or_path allenai/tulu-2-7b \
    --lora_model_name_or_path ./output \
    --output_dir ./output/tulu_2_7b_lora_merged/ \
    --save_tokenizer
