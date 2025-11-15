# 配置zsh + Oh My Zsh 最佳实践

> zsh和oh my zsh一起使用，能大幅提升终端效率。


## 安装配置zsh为默认shell

```bash
# 1. 安装Zsh
sudo apt update
sudo apt install zsh -y

# 2. 验证安装
zsh --version

# 3. 安装Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# 或者是国内镜像
# sh -c "$(curl -fsSL https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh)"

# 安装后，会提示是否切换到zsh，选择是即可
# 如果没有提示，可以手动执行下面的命令切换到zsh

# 4. 设置Zsh为默认shell
chsh -s $(which zsh)

# 5. 重启终端或WSL
exit
```

## 安装两个常用插件
> 有些插件是自带的，可以查看`~/.oh-my-zsh/plugins/`目录
> 有些没有就需要手动安装，其实就是把插件代码clone到`~/.oh-my-zsh/custom/plugins/`目录下
```bash
# 自动建议插件
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# 语法高亮插件
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## 修改.zshrc配置文件
```bash
export ZSH="$HOME/.oh-my-zsh"

############
ZSH_THEME="robbyrussell"  # 简洁经典

# 推荐插件
plugins=(
    git                    # Git别名和补全
    colored-man-pages      # man页面彩色显示
    command-not-found      # 命令未找到时提示如何安装
    sudo                   # 按两次ESC在命令前加sudo
    z                      # 快速跳转目录
    zsh-autosuggestions    # 自动建议(需单独安装)
    zsh-syntax-highlighting # 语法高亮(需单独安装)
)
############


source $ZSH/oh-my-zsh.sh
source ~/.zsh/base.zsh  # 自定义别名和函数
```