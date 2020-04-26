#!/bin/bash

if [[ -z $1 ]];
then
        echo "Please provide input and output filenames!"
        echo "./folder_extractor.sh input_file output_file"
        exit
fi

#if [[ -z $2 ]];
#then
#        echo "Please provide the JSON file name!"
#        echo "./folder_extractor.sh JS_file_name JSON_file_name html_file_name""
#        exit
#fi


#if [[ -z $3 ]];
#then
#        echo "Please provide the html file name!"
#        echo "./folder_extractor.sh JS_file_name JSON_file_name html_file_name""
#        exit
#fi


source ~/.bash_profile
#rm -f folder_list.txt js_folders.txt json_folders.txt html_folders.txt
output_file=$2
echo "All of output is going to be saved in output file"
echo "************************************************************"

for i in $(cat $1)
do
        response_code=`curl -k -i --silent  $i --parallel-max 50 --connect-timeout 3 | tac| tac | head -n 1 | cut -d' ' -f2 `
        echo $i $response_code
        if [[ $response_code = 200 ]];
        then

                echo "========================================================================================================================================" >> grep_output.txt
 #               echo $i >> grep_output.txt
		python3 /home/offsecdawn/tools/LinkFinder/linkfinder.py -i $i -o cli >> $2
                echo "========================================================================================================================================" >> grep_output.txt
        fi
done

#for i in $(cat $2)
#do
#        response_code=`curl -k -i --silent  $i --parallel-max 50 --connect-timeout 3 | tac| tac | head -n 1 | cut -d' ' -f2 `
#        #echo $i $response_code
#        if [[ $response_code = 200 ]];
#        then
#                echo "========================================================================================================================================" >> grep_output.txt
#                echo $i >> grep_output.txt
#                curl -k -s $i |tac |tac | grep --color=always -i -E -- 'token|swagger|admin|jenkin|sandbox|wordpress|drupal|csrf|vpn|aws|key|api' >> grep_output.txt
#		python3 /home/offsecdawn/tools/LinkFinder/linkfinder.py -i $i -o cli >> json_folders.txt 
#               echo "========================================================================================================================================" >> grep_output.txt
#        fi
#done


#for i in $(cat $3)
#do
#        response_code=`curl -k -i --silent  $i --parallel-max 50 --connect-timeout 3 | tac| tac | head -n 1 | cut -d' ' -$
#        #echo $i $response_code
#        if [[ $response_code = 200 ]];
#        then
#                echo "===================================================================================================$
#                echo $i >> grep_output.txt
#                curl -k -s $i |tac |tac | grep --color=always -i -E -- 'token|swagger|admin|jenkin|sandbox|wordpress|dru$
#                python3 /home/offsecdawn/tools/LinkFinder/linkfinder.py -i $i -o cli >> html_folders.txt
#               echo "====================================================================================================$
#        fi
#done

#grep -iv -E -- '.png|.jpg|.gif|.ico|.img|.css|.svg'
