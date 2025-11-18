{ pkgs, ... }:

{
  home = {
    stateVersion = "23.11";

    packages = with pkgs; [
      atool
      bat
      cloudflared
      d2
      dive
      git
      git-repo-updater
      graphviz
      httpie
      imagemagick
      iperf
      jq
      mitmproxy
      pv
      tldr
      vim
      wget
      # programming
      elixir
      go
      python3
    ];

    file = {
      ".config/git/.gitignore".source = ../config/git/.gitignore;
      ".config/git/allowed_signers".source = ../config/git/allowed_signers;
      ".config/karabiner/karabiner.json".source = ../config/karabiner/karabiner.json;
      ".ideavimrc".source = ../config/vim/.ideavimrc;
      ".vimrc".source = ../config/vim/.vimrc;
      ".config/ghostty/config".source = ../config/ghostty/config;
    };

  };

  programs = {

    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh.enable = true;

      sessionVariables = {
        LESS = "FRX";
      };

      shellAliases = {
        add = "git add";
        branch = "git branch";
        checkout = "git checkout";
        commit = "git commit";
        log = "git log --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)'";
        pull = "git pull";
        push = "git push";
        status = "git status";
        amen = "git commit --amend --no-edit";

        j = "z";
        pip = "uv pip";
        ldd = "otool -L";
        tunnel = "cloudflared tunnel --url";

        mkshell = "nix flake init --template ~/GitHub/dotfiles#blank";
        mkgo = "nix flake init --template ~/GitHub/dotfiles#go";
        mkpython = "nix flake init --template ~/GitHub/dotfiles#python";
        mkelixir = "nix flake init --template ~/GitHub/dotfiles#elixir";
      };

      initContent = ''
        chpwd() eza --group-directories-first --icons=auto

        if [[ $(uname -m) == 'arm64' ]]; then
          eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
      '';
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        git_status.style = "bold yellow";
      };
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
      config = {
        warn_timeout = 0;
        hide_env_diff = true;
      };
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    eza = {
      enable = true;
      enableZshIntegration = true;
      git = true;
      icons = "auto";
      extraOptions = [
        "--group-directories-first"
      ];
    };

  };
}
