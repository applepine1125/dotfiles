if has("lua")
python << EOF
import os
import sys

path = os.path.expanduser("~/.anyenv/envs/pyenv/versions/anaconda3-4.3.1/lib/python3.6/site-packages")
if not path in sys.path:
  sys.path.append(path)
EOF
endif
