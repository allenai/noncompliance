## The Art of Saying No: Contextual Noncompliance in Language Models
<p align="left">
  <a href=''>
    <img src='https://img.shields.io/badge/Arxiv-2308.16905-A42C25?style=flat&logo=arXiv&logoColor=A42C25'>
  </a>
  <!-- <a href=''>
    <img src='https://img.shields.io/badge/Paper-PDF-yellow?style=flat&logo=arXiv&logoColor=yellow'>
  </a> -->
  <a href="">
    <img src="https://img.shields.io/badge/🤗-Data-orange">
  </a>

We introduce 🥥 **CoCoNot**, a reasouce for **benchmarking and enhancing noncompliance** behavior of large language models. 

### Data
CoCoNot contains two components:
- Original Set: For testing and improving contextual noncompliance in LMs.
    - This set contains 1,001 evaluation and 11,477 SFT training examples.
    
- Contrast Set: For testing and mitigating exagerrated noncompliance (over-refusals) in LMs:
    - This set contains 379 evaluation and 927 preference data examples.


You can also download and view 🥥 CoCoNot in [🤗 Huggingface]().

### Evaluation
TBD

### Acknowledgement
We greatly thank Tulu team for providing awesome [open-instruct](https://github.com/allenai/open-instruct) for inference and finetuning models.


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