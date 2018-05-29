chmod a+x ${workspace.absolutePath}/HTTPmsgTest
docker run --rm -v tee:/workspace sonatanfv/tng-titan ttcn3_start ${workspace.absolutePath}/HTTPmsgTest ${workspace.absolutePath}/config.cfg
