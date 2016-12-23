require 'formula'

class StanfordSegmenter < Formula
  homepage 'http://nlp.stanford.edu/software/segmenter.shtml'
  url 'http://nlp.stanford.edu/software/stanford-segmenter-2015-12-09.zip'
  sha256 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
  version '20151209'

  def install
    libexec.install Dir['*']
    bin.write_exec_script Dir["#{libexec}/*.sh"]
  end

  test do
    system "#{bin}/segment.sh", "ctb", "#{libexec}/test.simp.utf8", "UTF-8", "0"
  end
end
