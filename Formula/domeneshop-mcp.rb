class DomeneshopMcp < Formula
  desc "MCP server for the Domeneshop API: domains, DNS, forwards and invoices"
  homepage "https://github.com/martinzachariassen/domeneshop-mcp"
  url "https://registry.npmjs.org/domeneshop-mcp/-/domeneshop-mcp-2.0.4.tgz"
  sha256 "06ba5ab96853a4f11733f9ce18cf8f7f592089eeff5d5e5d55cb1a22b30ab3a3"
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
