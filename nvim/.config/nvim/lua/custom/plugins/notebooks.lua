return {
  {
    'kiyoon/jupynium.nvim',
    -- build = "uv pip install . --python=$HOME/.virtualenvs/jupynium/bin/python",
    build = 'conda run --no-capture-output pip install .',
  },
}
