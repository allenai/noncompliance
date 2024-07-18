## The Art of Saying No: Contextual Noncompliance in Language Models
<p align="left">
  <a href='https://arxiv.org/abs/2407.12043'>
    <img src='https://img.shields.io/badge/Arxiv-2308.16905-A42C25?style=flat&logo=arXiv&logoColor=A42C25'>
  </a>
  <!-- <a href=''>
    <img src='https://img.shields.io/badge/Paper-PDF-yellow?style=flat&logo=arXiv&logoColor=yellow'>
  </a> -->
  <a href='https://nbviewer.org/github/allenai/noncompliance/blob/main/paper.pdf' class="image fit">
    <img src='https://img.shields.io/badge/Paper-PDF-yellow?style=flat&logo=arXiv&logoColor=yellow' alt="">
  </a>
  <a href="https://huggingface.co/datasets/allenai/coconot">
    <img src="https://img.shields.io/badge/🤗-Data-orange">
  </a>

We introduce 🥥 **CoCoNot**, a resource for **benchmarking and enhancing noncompliance** behavior of large language models. 

### 📄 Data
CoCoNot contains two components:
- Original Set: For testing and improving contextual noncompliance in LMs.
    - This set contains 1,001 evaluation and 11,477 SFT training examples.
    
- Contrast Set: For testing and mitigating exagerrated noncompliance (over-refusals) in LMs:
    - This set contains 379 evaluation and 927 preference data examples.


You can also view and download 🥥 CoCoNot on the [🤗 Huggingface Hub](https://huggingface.co/datasets/allenai/coconot). And download them by:
```
from datasets import load_dataset


# load original test set
coconot_eval = load_dataset("allenai/coconot", "original", split="test")

# load contrast test set
coconot_contrast_eval = load_dataset("allenai/coconot", "contrast", split="test")

# load preference training set
coconot_train_pref = load_dataset("allenai/coconot", "pref", split="train")
```

#### Seed Prompts
You can find the seed prompts used for generating the data in [prompts/](https://github.com/allenai/noncompliance/tree/main/prompts) folder.


### 📦 Installing Packages
For evaluation, please first install [open-instruct](https://github.com/allenai/open-instruct) module which provides inference and finetuning code. Please follow the installation available in open-instruct.


### 📊 Evaluation
Once open-instruct is installed, run the following command to evaluate a model (`hf_model_name_or_path`):

```
bash open-instruct-predict-and-refusal-evaluate.sh ./data/coconot_eval.jsonl <hf_model_name_or_path> "prompt" "false" "refusal" "gpt-3.5-turbo"
```

You can replace `gpt-3.5-turbo` with a different judge model such as `gpt-4`.

Note that you can find our category-scpecific rubric for evaluating responses in [here](https://github.com/allenai/noncompliance/blob/main/prompts/refusal_evaluation_rubric.json).

### 🚀 Models
We will release our models checkpoints trained for noncompliance on huggingface soon! 

### Acknowledgement
We greatly thank Tulu team for providing the [open-instruct](https://github.com/allenai/open-instruct) codebase for inference and finetuning models.


### Citation
If you find this work is relevant with your research, please cite us using:
```
@misc{brahman2024artsayingnocontextual,
      title={The Art of Saying No: Contextual Noncompliance in Language Models}, 
      author={Faeze Brahman and Sachin Kumar and Vidhisha Balachandran and Pradeep Dasigi and Valentina Pyatkin and Abhilasha Ravichander and Sarah Wiegreffe and Nouha Dziri and Khyathi Chandu and Jack Hessel and Yulia Tsvetkov and Noah A. Smith and Yejin Choi and Hannaneh Hajishirzi},
      year={2024},
      eprint={2407.12043},
      archivePrefix={arXiv},
      primaryClass={cs.CL},
      url={https://arxiv.org/abs/2407.12043}, 
}
```