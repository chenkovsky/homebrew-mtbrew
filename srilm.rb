require 'formula'

class Srilm < Formula
  homepage 'http://www.speech.sri.com/projects/srilm/'
  url "file://#{HOMEBREW_CACHE}/srilm-1.7.2.tgz"
  sha256 'a528a778f881c679233f94d7b26d6f795129fa6009b32305c8ce769f66e223b4'

  depends_on 'homebrew/science/liblbfgs' => :optional

  def install
    args = ["SRILM=#{buildpath}"]
    args << "HAVE_LIBLBFGS=1" if build.with? 'liblbfgs'
    system 'make', 'World', *args

    bin.install Dir['bin/*'].reject {|name| name == 'bin/macosx'}
    bin.install Dir['bin/macosx/*']
    include.install Dir['include/*']
    lib.install Dir['lib/macosx/*']
    man.install Dir['man/man*']
  end

  def caveats
    <<-EOS.undent
      Users must agree to a license before downloading SRILM, so this formula
      does not do so automatically.  Please fill out the download form on the
      SRILM home page and move the downloaded archive to the following path:

        #{HOMEBREW_CACHE}/srilm-1.7.2.tgz

      Then run `brew install srilm` as usual.
    EOS
  end
end
