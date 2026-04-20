---
type: project
created: 2026-04-20
modified: 2026-04-20T22:01:00+08:00
tags: [project, ai-agent, memory, self-evolution, evermind-ai]
aliases: [EverMind, EverMemOS, EverCore, HyperMem]
status: draft
confidence: 0.95
---

# EverOS

## 编译真相
> EverOS 是 EverMind-AI 开发的长期记忆操作系统，为自进化 Agent 提供记忆方法、基准测试和用例。核心组件包括 EverCore(记忆 OS)、HyperMem(超图记忆)、EverMemBench(记忆评估) 和 EvoAgentBench(进化评估)。

## 详细信息

**开发者**: EverMind-AI  
**许可证**: Apache 2.0  
**仓库**: https://github.com/EverMind-AI/EverOS  
**文档**: https://docs.evermind.ai  
**官网**: https://evermind.ai  
**论文**: 
- EverMemOS: [arXiv:2601.02163](https://arxiv.org/abs/2601.02163)
- HyperMem: [arXiv:2604.08256](https://arxiv.org/abs/2604.08256)
- EverMemBench: [arXiv:2602.01313](https://arxiv.org/abs/2602.01313)

**社区**: [Discord](https://discord.gg/gYep5nQRZJ) \| [X](https://x.com/evermind) \| [微信](https://github.com/EverMind-AI/EverOS/discussions/67)

---

## 🏗️ 项目结构

```
EverOS/
├── methods/              # 记忆方法 (生产就绪)
│   ├── EverCore/         # 自组织记忆操作系统
│   └── HyperMem/         # 超图记忆架构
├── benchmarks/           # 基准测试 (公开标准)
│   ├── EverMemBench/     # 记忆质量评估
│   └── EvoAgentBench/    # Agent 自进化评估
└── use-cases/            # 示例用例
    ├── claude-code-plugin/
    └── game-of-throne-demo/
```

---

## 📚 核心组件

### 1️⃣ EverCore — 记忆操作系统

**定位**: 受生物印记启发的自组织记忆操作系统

**功能**: 从对话中提取、结构化、检索长期知识

**性能**: LoCoMo 基准 **93% 准确率**

**快速启动**:
```bash
cd methods/evermemos

# 启动 Docker 服务
docker compose up -d

# 安装依赖
uv sync

# 配置 API keys
cp env.template .env

# 启动服务器
uv run python src/run.py

# 验证
curl http://localhost:1995/health
```

**API 示例**:
```python
import requests

API_BASE = "http://localhost:1995/api/v1"

# 存储记忆
requests.post(f"{API_BASE}/memories", json={
    "message_id": "msg_001",
    "sender": "user_001",
    "content": "I love playing soccer on weekends"
})

# 搜索记忆
response = requests.get(f"{API_BASE}/memories/search", json={
    "query": "What sports does the user like?",
    "user_id": "user_001",
    "memory_types": ["episodic_memory"],
    "retrieve_method": "hybrid"
})
```

---

### 2️⃣ HyperMem — 超图记忆架构

**定位**: 基于超图的层级记忆架构

**功能**: 通过超边捕获高阶关联，组织为主题/事件/事实三层

**性能**: LoCoMo **92.73%**

**检索策略**: 粗粒度→细粒度层级检索

---

### 3️⃣ EverMemBench — 记忆质量评估

**定位**: 三层记忆质量评估基准

**评估维度**:
| 层级 | 说明 |
|------|------|
| **Factual Recall** | 事实回忆能力 |
| **Applied Reasoning** | 应用推理能力 |
| **Personalized Generalization** | 个性化泛化能力 |

**数据集**: [HuggingFace](https://huggingface.co/datasets/EverMind-AI/EverMemBench-Dynamic)

**运行评估**:
```bash
uv sync --group evaluation
uv run python -m evaluation.cli --dataset locomo --system everos
cat evaluation/results/locomo-everos/report.txt
```

---

### 4️⃣ EvoAgentBench — Agent 自进化评估

**定位**: Agent 自进化纵向增长曲线评估

**测量指标**:
- Transfer Efficiency (迁移效率)
- Error Avoidance (错误避免)
- Skill-Hit Quality (技能命中质量)

**特点**: 对比有/无进化的对照实验

---

## 📊 性能对比

### 记忆性能

| 系统 | LoCoMo | LongMemEval-S |
|------|--------|---------------|
| **EverOS** | **93.05%** | **83.00%** |
| **HyperMem** | **92.73%** | — |
| Mem0 | 78.4% | — |
| MemOS | 74.2% | — |
| Zep | 71.6% | — |

### 自进化增益

| 任务类型 | Agent + 模型 | 基线 | + EverOS Skills | Delta |
|---------|-------------|------|-----------------|-------|
| Code (Django) | OpenClaw + Qwen3.5-397B | 37% | 58% | **+21%** |
| Code (Django) | Nanobot + Qwen3.5-397B | 21% | 47% | **+26%** |
| General (GDPVAL) | OpenClaw + Qwen3.5-397B | 29% | 69% | **+40%** |
| General (GDPVAL) | OpenClaw + Qwen3.5-27B | 41% | 61% | **+20%** |

---

## 🎯 用例展示

| 用例 | 说明 |
|------|------|
| **🌍 Earth Online Memory Game** | 记忆感知生产力游戏 |
| **🤖 Multi-Agent Orchestration** | Golutra 多 Agent 工程团队平台 |
| **📱 Mobi Companion** | iOS AI 生命体伴侣应用 |
| **⌚ AI Wearable** | 上下文感知 AI 可穿戴设备 |
| **🦞 OpenClaw Agent Memory** | 24/7 持续学习记忆的 Agent |
| **🎭 Live2D Character** | 带记忆的实时动漫角色 |
| **💻 Computer-Use with Memory** | 基于截图的分析 + 记忆存储 |
| **🎮 Game of Thrones Memories** | 权游交互式问答记忆演示 |
| **🔌 Claude Code Plugin** | Claude Code 持久记忆插件 |
| **🕸️ Memory Graph Visualization** | 记忆实体关系可视化 |

---

## 🔗 与 Luna/OpenClaw 的关联

### 直接相关

| EverOS 组件 | Luna 现有能力 | 潜在整合 |
|------------|--------------|---------|
| **OpenClaw Agent Memory** | 三层记忆体系 | ✅ 可直接使用 EverOS 插件 |
| **Claude Code Plugin** | 无 | ✅ 为 Claude Code 添加持久记忆 |
| **EverMemBench** | 无 | ✅ 评估 Luna 记忆质量 |
| **EvoAgentBench** | [[达尔文.skill]] | ✅ 评估自进化效果 |

### 架构对比

| 特性 | Luna 三层记忆 | EverOS EverCore |
|------|-------------|----------------|
| **L1 短期** | SESSION-STATE.md | Working Buffer |
| **L2 中期** | memory/YYYY-MM-DD.md | Episodic Memory |
| **L3 长期** | MEMORY.md | Semantic/Persona Memory |
| **提取方式** | Agent 主动写入 | 生物印记自动提取 |
| **检索策略** | memory_search (语义) | 混合检索 (向量 + 关键词) |

### 融合可能性

```
┌─────────────────────────────────────────────────────────┐
│              理想的自主进化系统                          │
├─────────────────────────────────────────────────────────┤
│  Luna 的三层记忆 (结构化)  +  EverOS 的学习循环 (实时)   │
│  Luna 的 Markdown 透明性    +  EverOS 的检索效率         │
│  Luna 的飞书集成          +  EverOS 的多平台支持         │
│  Luna 的可控性            +  EverOS 的自动化             │
└─────────────────────────────────────────────────────────┘
```

**可借鉴的 EverOS 特性**:
1. 生物印记自动提取 — 减少手动写入
2. EverMemBench — 量化评估记忆质量
3. EvoAgentBench — 评估 [[达尔文.skill]] 效果
4. 混合检索策略 — 向量 + 关键词组合

**可输出的 Luna 特性**:
1. 三层记忆架构 — 可作为 EverOS 的记忆后端
2. 飞书集成经验 — 企业场景整合
3. Markdown 技能格式 — 标准化技能表示

---

## 🛠️ 快速开始

### 安装 EverCore

```bash
git clone https://github.com/EverMind-AI/EverOS.git
cd EverOS/methods/evermemos

# 启动基础设施 (Docker)
docker compose up -d

# 安装依赖
curl -LsSf https://astral.sh/uv/install.sh | sh
uv sync

# 配置 API keys
cp env.template .env
# 编辑 .env 设置 LLM_API_KEY, VECTORIZE_API_KEY

# 启动服务
uv run python src/run.py

# 验证
curl http://localhost:1995/health
# {"status": "healthy", ...}
```

### 评估现有记忆系统

```bash
# 安装评估依赖
uv sync --group evaluation

# 运行快速测试
uv run python -m evaluation.cli --dataset locomo --system everos --smoke

# 完整评估
uv run python -m evaluation.cli --dataset locomo --system everos
```

---

## 📖 引用

```bibtex
@article{hu2026evermemos,
  title={EverMemOS: A Self-Organizing Memory Operating System for Structured Long-Horizon Reasoning},
  author={Hu, Chuanrui and Gao, Xingze and Zhou, Zuyi and Xu, Dannong and Bai, Yi and Li, Xintong and Zhang, Hui and Li, Tong and Zhang, Chong and Bing, Lidong and Deng, Yafeng},
  journal={arXiv preprint arXiv:2601.02163},
  year={2026}
}

@article{yue2026hypermem,
  title={HyperMem: Hypergraph Memory for Long-Term Conversations},
  author={Yue, Juwei and Hu, Chuanrui and Sheng, Jiawei and Zhou, Zuyi and Zhang, Wenyuan and Liu, Tingwen and Guo, Li and Deng, Yafeng},
  journal={arXiv preprint arXiv:2604.08256},
  year={2026}
}

@article{hu2026evaluating,
  title={Evaluating Long-Horizon Memory for Multi-Party Collaborative Dialogues},
  author={Hu, Chuanrui and Li, Tong and Gao, Xingze and Chen, Hongda and Bai, Yi and Xu, Dannong and Lin, Tianwei and Li, Xiaohong and Han, Yunyun and Pei, Jian and Deng, Yafeng},
  journal={arXiv preprint arXiv:2602.01313},
  year={2026}
}
```

---

## 时间线
<!-- 追加式记录，只增不改 -->
- 2026-04-20: 调研 EverOS，创建 Wiki 页面 (来源：[[楼澈]])

## 关联实体
<!-- LLM 自动构建的双向链接 -->
- **相关组织**: EverMind-AI
- **相关技术**: EverCore, HyperMem, EverMemBench, EvoAgentBench
- **相关概念**: [[自主进化]], [[自学习 Agent]], 长期记忆
- **对比项目**: [[OpenClaw]], [[达尔文.skill]], [[Hermes Agent]]
- **相关人**: [[楼澈]]

## 来源
- https://github.com/EverMind-AI/EverOS
- https://docs.evermind.ai
- https://evermind.ai

---
*此页面由 LLM 自动维护 | 最后更新：2026-04-20*
