# 💾 rm dckr

[![Static Badge](https://img.shields.io/badge/Linux-white?style=flat&logo=linux&logoColor=white&logoSize=auto&labelColor=black)](https://www.linux.org/)
[![Static Badge](https://img.shields.io/badge/Docker-white?style=flat&logo=docker&logoColor=white&logoSize=auto&labelColor=black)](https://docker.com/)
[![Static Badge](https://img.shields.io/badge/Bash-Script-white?style=flat&logo=gnubash&logoColor=white&logoSize=auto&labelColor=black)](https://www.gnu.org/software/bash/)
[![Static Badge](https://img.shields.io/badge/GPL-V3-white?style=flat&logo=gnu&logoColor=white&logoSize=auto&labelColor=black)](https://www.gnu.org/licenses/gpl-3.0.en.html/)

rm dckr, is a shell script tool designed to help you clean up Docker resources, making Docker resource management more streamlined and efficient.

## ✨ Features

- Remove all Docker containers
- Remove all Docker images
- Remove all Docker volumes
- Remove all Docker networks
- Simple and intuitive command-line interface
- Safe operation with confirmation prompts

## 🚀 Quick Start

1. Clone this repository:
   ```bash
   git clone https://github.com/peterweissdk/rm_dckr.git
   ```

2. Make the script executable:
   ```bash
   chmod +x rm_dckr.sh
   ```

3. Run the script:
   ```bash
   ./rm_dckr.sh
   ```

4. Optional: Install the script system-wide:
   ```bash
   ./rm_dckr.sh --install
   ```

### Usage Options
- `-i, --install`: Install the script system-wide
- `-u, --update-version`: Update the script version
- `-v, --version`: Display current version
- `-h, --help`: Show help message

## 📝 Directory Structure

```bash
rm_dckr/
├── .git
├── LICENSE
├── README.md
└── rm_dckr.sh
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 🆘 Support

If you encounter any issues or need support, please file an issue on the GitHub repository.

## 📄 License

This project is licensed under the GNU GENERAL PUBLIC LICENSE v3.0 - see the [LICENSE](LICENSE) file for details.