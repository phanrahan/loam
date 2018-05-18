from setuptools import setup

reqs = [str(ir.req) for ir in install_reqs]

setup(
    name='loam',
    version='0.1-alpha',
    description='Model boards and parts using Magma',
    packages=["loam"],
    )
