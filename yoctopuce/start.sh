#!/bin/sh
# Maybe needed to take into account the new yvirtualhub.service
systemctl daemon-reload
# Enable yvirtualhub service boot loading
systemctl enable yvirtualhub
# Start yvirtualhub service
systemctl start yvirtualhub
# To prevent Docker from exiting
#journalctl -f
