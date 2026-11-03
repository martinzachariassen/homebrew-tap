class DomeneshopMcp < Formula
  desc "MCP server for the Domeneshop API: domains, DNS, forwards and invoices"
  homepage "https://github.com/martinzachariassen/domeneshop-mcp"
  url "https://registry.npmjs.org/domeneshop-mcp/-/domeneshop-mcp-2.0.5.tgz"
  sha256 "ead9d85675e492c5794d2c08cf8c1db9f6409422b8bb7b9e750ce80339db0d47"
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
