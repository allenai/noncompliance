input_path=$1
model=$2
output_path="./outputs/outputs.jsonl"

prompt_key=$3

echo $input_path
echo $output_path
echo $prompt_key


pip install scipy
pip install scikit-learn
pip install matplotlib
pip install openai==0.28
# pip install ai2-olmo 
# pip install transformers -U

system_prompt=""
use_system_prompt=$4
if [[ "$use_system_prompt" == "true" ]]; then 
    system_prompt=./prompts/system_prompt.json
fi 
echo "system_prompt"
echo $system_prompt

taskname=$5
echo "taskname"
echo $taskname

gpt_model=$6
echo $gpt_model

mkdir -p "outputs"

## specify the chat format based on the tested model.
## you can write your own customized chat format in the open-instruct source code: "open-instruct/eval/templates.py"
if [[ $model == *"Llama-3"* || $model == *"llama-3"* ]]; then
    chat_format="eval.templates.create_prompt_with_llama3_chat_format"
elif [[ $model == *"Llama-2"* || $model == *"llama-2"* ]]; then
    chat_format="eval.templates.create_prompt_with_llama2_chat_format"
elif [[ $model == *"mistral"* || $model == *"gemma"* ]]; then
    chat_format="tokenizer.apply_chat_template"
    pip install -U transformers
else
    chat_format="eval.templates.create_prompt_with_tulu_chat_format"
fi 
echo $chat_format

## inference
python predict.py\
    --model_name_or_path "$model"\
    --tokenizer_name_or_path "$model"\
    --input_files "$input_path"\
    --output_file "$output_path"\
    --batch_size 8\
    --use_chat_format\
    --chat_formatting_function $chat_format\
    --max_new_tokens 512\
    --system_prompt "$system_prompt"

    
## evaluate (using gpt-x models)
results_path="./outputs/refusal_evaluation.jsonl"
python eval/response_evaluation_refusal.py\
    --openai_key <OPENAI_KEY>\
    --org_id <ORG_ID>\
    --model $gpt_model\
    --output_file $output_path\
    --results_file $results_path\
    --prompt_key "prompt"\
    --response_key "output"\
    --eval_set $taskname

## compute compliance scores
python eval/compute_compliance_scores.py\
    --evaluation_file $results_path\
    --response_file $output_path\
    --output_dir /outputs/\
    --eval_set $taskname\
    --category_key "subcategory"
