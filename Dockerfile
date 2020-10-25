FROM archlinux:latest

RUN echo 'Server = https://mirror.pkgbuild.com/$repo/os/$arch' > \
      /etc/pacman.d/mirrorlist && \
    echo 'Server = https://mirror.leaseweb.net/archlinux/$repo/os/$arch' >> \
      /etc/pacman.d/mirrorlist && \
    echo 'Server = https://mirror.rackspace.com/archlinux/$repo/os/$arch' >> \
      /etc/pacman.d/mirrorlist
RUN pacman --needed --noconfirm -Syu base base-devel && \
    pacman --noconfirm -Scc
RUN useradd -m nonroot && \
    echo 'nonroot ALL=(ALL) NOPASSWD: ALL' > \
      /etc/sudoers.d/nonroot && \
    chmod 440 /etc/sudoers.d/nonroot

USER nonroot
WORKDIR /home/nonroot

CMD ["/bin/bash"]
