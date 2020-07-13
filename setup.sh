#!/bin/sh
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gboucett <gboucett@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/18 13:55:24 by gboucett          #+#    #+#              #
#    Updated: 2020/03/18 13:59:16 by gboucett         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

start=`date +%s`

echo "            __ _                           _                             "
echo "           / _| |_     ___  ___ _ ____   _(_) ___ ___  ___               "
echo "          | |_| __|   / __|/ _ \\ '__\\ \\ / / |/ __/ _ \\/ __|          "
echo "          |  _| |_    \\__ \\  __/ |   \\ V /| | (_|  __/\\__ \\         "
echo "          |_|  \\__|___|___/\\___|_|    \\_/ |_|\\___\\___||___/         "
echo "                 |_____|"
echo "========================================================================="
echo "                                                              by gboucett"

#starting minikube and the dashboard
minikube start --vm-driver=docker --extra-config=apiserver.service-node-port-range=20-32767
minikube addons enable dashboard

eval $(minikube docker-env)

CLUSTER_IP=$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)
# echo "Cluster IP : ${CLUSTER_IP}"

echo "Building nginx image..."
docker build -t custom/nginx srcs/nginx --quiet
echo "Building ftps image..."
docker build -t custom/ftps srcs/ftps --quiet
echo "Building mysql image..."
docker build -t custom/mysql srcs/mysql --quiet
echo "Building phpmyadmin image..."
docker build -t custom/phpmyadmin srcs/phpmyadmin

echo "Applying yaml files"
kubectl apply -f srcs/metallb.yaml
kubectl apply -f srcs/nginx.yaml
kubectl apply -f srcs/ftps.yaml
kubectl apply -f srcs/mysql.yaml
kubectl apply -f srcs/phpmyadmin.yaml

end=`date +%s`
total=$((end - start))
echo "========================================================================="
echo "✅ ft_services deployment done in $total seconds"

echo "SSH (password : gboucett): ssh -p 2222 gboucett@${CLUSTER_IP}"
echo "FTPS : ip = ${CLUSTER_IP}, username = gboucett, password = gboucett"
