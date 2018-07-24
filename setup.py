from setuptools import setup

setup(
    name='loam',
    version='0.1-alpha',
    description='Model boards and parts using Magma',
    packages=["loam"],
    install_requires=[
        "six"
    ],
    url='https://github.com/phanrahan/mantle',
    author='Leonard Truong',
    author_email='lenny@cs.stanford.edu',
    python_requires='>=3.6'
    )
