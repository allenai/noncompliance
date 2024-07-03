## The Art of Saying No: Contextual Noncompliance in Language Models
<p align="left">
  <a href=''>
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


You can also view and download 🥥 CoCoNot on the [🤗 Huggingface Hub](https://huggingface.co/datasets/allenai/coconot).

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
@article{brahman-kumar2024,
  title={{The Art of Saying No: Contextual Noncompliance in Language Models}},
  author={Faeze Brahman, Sachin Kumar, Vidhisha Balachandran, Pradeep Dasigi, Valentina Pyatkin, Abhilasha Ravichander, Sarah Wiegreffe, Nouha Dziri, Khyathi Chandu, Jack Hessel, Yulia Tsvetkov, Noah A. Smith, Yejin Choi, Hannaneh Hajishirzi},
  journal={},
  year={2024}
}
```