from setuptools import setup

setup(
    name='loam',
    version='0.1-alpha',
    description='Model boards and parts using Magma',
    packages=["loam"],
    install_requires=[
        "six",
        "magma",
        "mantle"
    ],
    dependency_links=[
        "git+git://github.com/phanrahan/magma.git#egg=magma",
        "git+git://github.com/phanrahan/mantle.git#egg=mantle"
    ],
    url='https://github.com/phanrahan/mantle',
    author='Leonard Truong',
    author_email='lenny@cs.stanford.edu',
    python_requires='>=3.6'
    )
