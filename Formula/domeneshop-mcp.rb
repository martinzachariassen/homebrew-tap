class DomeneshopMcp < Formula
  desc "MCP server for the Domeneshop API: domains, DNS, forwards and invoices"
  homepage "https://github.com/martinzachariassen/domeneshop-mcp"
  url "https://registry.npmjs.org/domeneshop-mcp/-/domeneshop-mcp-2.0.0.tgz"
  sha256 "7d83adb0fac70a0211abb2bfee95a0a9415ff55d782574059ac42bf8205ca832"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/domeneshop-mcp --version")
  end
end
