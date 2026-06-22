./prep_env.ps1

python -m pip install --upgrade pip setuptools wheel
pip install -r requirements.txt

pip install ./submodules/fused-ssim
pip install ./submodules/diff-gaussian-rasterization
pip install ./submodules/simple-knn
