pkgname=fishshell-cmd-opts
pkgver=0.2
pkgrel=1
pkgdesc="utilities for elegant handling of command line options in fish shell scripts"
arch=("any")
url="https://github.com/EsGeh/fishshell-cmd-opts"
license=('GPL')
depends=('fish>=3')
source=("cmd_args.fish")
sha1sums=('SKIP')

package() {
		dest_dir="/usr/share/fish/vendor_conf.d"
		echo "dest_dir: $dest_dir"
    mkdir -p "$pkgdir/$dest_dir"
    install -D -m755 ./cmd_args.fish "$pkgdir/$dest_dir/$pkgname.fish"
}
