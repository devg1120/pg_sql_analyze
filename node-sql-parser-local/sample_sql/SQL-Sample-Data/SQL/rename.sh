
for filename_ext in *.sql; do

  # ファイル一つ毎の処理
  #echo "file: $filename_ext"
  ARR=(${filename_ext//./ })
  #echo ${ARR[0]}
  #echo ${ARR[1]}
  filename=${ARR[0]}
  ext=${ARR[1]}
  PART=(${filename//-/ })
  #echo ${PART[0]}
  #echo ${PART[1]}
  head=${PART[0]}
  number=${PART[1]}
  number_2k=""
  #echo ${#number}
  if [ ${#number} -eq 1 ];then
      number_2k=0${number}
      new_filename=${head}-${number_2k}.${ext}
      echo " $filename_ext  new: ${new_filename}"
      mv  $filename_ext   ${new_filename}
  fi

done
