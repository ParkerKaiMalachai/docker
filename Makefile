create:
	mkdir -p storage

	docker run --rm -v ./storage:/backup -v ./app:/data alpine \
		sh -c "tar cvf /backup/snapshot -C /data ."

restore:
	docker run --rm -v ./app:/data -v ./storage:/backup alpine \
	sh -c "tar xvf /backup/snapshot -C /data"; 