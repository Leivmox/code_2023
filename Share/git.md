# git

---



Ubuntu下载git：

`sudo apt-get install git`

生成ssh密钥对：

`ssh-keygen`

共钥地址：

`cat ~/.ssh/id_rsa.pub`



配置git信息：（第一次下载完git配置一次）

```bash
git config --global user.name 名字
git config --global user.email 邮箱
git config --list
```


`git remote add origin` + ssh下载地址

```Plain Text
如：
git remote add origin git@gitee.com:leivzy/code_2023.git
git remote add origin git@github.com:Leivzy/code_2023.git

```
第一次同步仓库：

`git pull origin master`



关联本地master和远程master，简化命令：

`git branch --set-upstream-to=origin/master master`

（若显示master分支未commit过，请先使用master提交一次更改再进行绑定）

---



> \*\*\*\*\*\*\*\*\*\*\*\*git常用命令\*\*\*\*\*\*\*\*\*\*\*\*

> git init    #初始化仓库

> git clone + ssh路径/https路径   #拷贝一份远程仓库

> git add     #添加文件到暂存区

> git commit -m "备注"     #将暂存区提交至本地仓库

> git push origin master  #将本地分支推送到远程origin的master分支

> git pull  origin master  #从远程仓库拉取最新代码

> #\*\*\*\*\*\*\*\*\*\*\*

> git status             #查看当前仓库状态

> git branch         #查看本地所有分支

> git branch -r   #查看远程所有分支

> git branch -d <分支名>  #删除本地分支

> git branch    #创建分支

> #\*\*\*\*\*\*\*\*

> git checkout   #切换分支

> git merge              #合并分支

> git branch --set-upstream-to=origin/<远程分支名称> <本地分支名称>  #本地分支关联远程分支

> git config --list     #查看git配置信息

> #\*\*\*\*\*\*回滚操作\*\*\*\*\*

> git reset --hard        #已执行git add 但未执行git commit

> #\*\*\*\*\*\*\*\*已提交至本地仓库

> git reset --hard HEAD^   #上个版本回退，不加^是当前版本  执行git commit 未执行git push

> git reset --hard <commit\_id>   #指定版本回退

> #\*\*\*\*\*已git push情况

> git reset --hard HEAD^     #先在暂存区恢复上个版本 

> git push -f           #在强制推送是远程仓库，覆盖之前版本



# git 覆盖本地文件

如果你想将本地 Git 仓库中的所有文件都覆盖到本地文件系统中，可以使用以下命令：

```Plain Text
git checkout .
```

该命令会将 Git 仓库中的所有文件都还原到最近一次提交的状态，并覆盖本地文件系统中的文件。注意，这个命令会清除你在本地的所有未提交的更改，因此请谨慎使用。

---



# 远程仓库完全覆盖本地 git 仓库

 `git fetch --all` 

 `git reset --hard origin/master `

前者：从远程仓库获取所有分支的最新状态

后者：命令重置本地仓库到远程仓库的状态。

注意，这将丢失本地仓库中未提交的所有更改，因此请确保在执行此操作！

---



```Plain Text
Github官方教学文档：（main）
echo "# ReadmeTest" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:Leivzy/ReadmeTest.git
git push -u origin main
```
