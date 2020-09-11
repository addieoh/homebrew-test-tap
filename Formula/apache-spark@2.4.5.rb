class ApacheSparkAT245 < Formula
  desc "Engine for large-scale data processing"
  homepage "https://spark.apache.org/"
  url "https://archive.apache.org/dist/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.6.tgz"
  version "2.4.5"
  sha256 "93AA64A6A0A98BE7134214A38EDB8FE13EDFB977383D4C6ABDBA03CB457A0BCCECA4912D331421A75E78FB1B24C8DFF3C6B4AC7991FB70352C4C9F3AC56E34C1"
  head "https://github.com/apache/spark.git"

  bottle :unneeded

  def install
    # Rename beeline to distinguish it from hive's beeline
    mv "bin/beeline", "bin/spark-beeline"

    rm_f Dir["bin/*.cmd"]
    libexec.install Dir["*"]
    bin.write_exec_script Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/spark-shell <<<'sc.parallelize(1 to 1000).count()'"
  end
end
©