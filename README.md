## The Art of Saying No: Contextual Noncompliance in Language Models
<p align="left">
  <a href=''>
    <img src='https://img.shields.io/badge/Arxiv-2308.16905-A42C25?style=flat&logo=arXiv&logoColor=A42C25'>
  </a>
  <!-- <a href=''>
    <img src='https://img.shields.io/badge/Paper-PDF-yellow?style=flat&logo=arXiv&logoColor=yellow'>
  </a> -->
  <a href="https://huggingface.co/datasets/allenai/coconot">
    <img src="https://img.shields.io/badge/🤗-Data-orange">
  </a>

We introduce 🥥 **CoCoNot**, a reasouce for **benchmarking and enhancing noncompliance** behavior of large language models. 

### Data
CoCoNot contains two components:
- Original Set: For testing and improving contextual noncompliance in LMs.
    - This set contains 1,001 evaluation and 11,477 SFT training examples.
    
- Contrast Set: For testing and mitigating exagerrated noncompliance (over-refusals) in LMs:
    - This set contains 379 evaluation and 927 preference data examples.


You can also download and view 🥥 CoCoNot on [🤗 Huggingface Hub](https://huggingface.co/datasets/allenai/coconot).

### Evaluation
For evaluation, please install [open-instruct](https://github.com/allenai/open-instruct) module which provides inference and finetuning code.

Then run the following command to evaluate a model (`hf_model_name_or_path`):

```
bash open-instruct-predict-and-refusal-evaluate.sh ./data/coconot_eval.jsonl <hf_model_name_or_path> "prompt" "false" "refusal" "gpt-3.5-turbo"
```

You can replace `gpt-3.5-turbo` with a different judge model such as `gpt-4`.

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