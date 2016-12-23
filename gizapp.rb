require 'formula'

class Gizapp < Formula
  homepage 'https://github.com/moses-smt/giza-pp'
  head 'https://github.com/moses-smt/giza-pp.git'

  def install
    system 'make'
    bin.install 'GIZA++-v2/GIZA++'
    bin.install 'GIZA++-v2/plain2snt.out'
    bin.install 'GIZA++-v2/snt2cooc.out'
    bin.install 'GIZA++-v2/snt2plain.out'
    bin.install 'GIZA++-v2/trainGIZA++.sh'
    bin.install 'mkcls-v2/mkcls'
  end

  fails_with :clang do
    build 503
    cause <<-EOS.undent
      Requires tr1 headers, which are not present in Clang's libc++.
    EOS
  end

  test do
    system bin/'GIZA++', '--help'
  end
end
