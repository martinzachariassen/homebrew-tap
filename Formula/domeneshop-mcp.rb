class DomeneshopMcp < Formula
  desc "MCP server for the Domeneshop API: domains, DNS, forwards and invoices"
  homepage "https://github.com/martinzachariassen/domeneshop-mcp"
  url "https://registry.npmjs.org/domeneshop-mcp/-/domeneshop-mcp-1.1.3.tgz"
  sha256 "d29da23ce3b8cd9af5ccce0e269994f6672098dbaf4a6b99c00cf55bec83aae6"
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
