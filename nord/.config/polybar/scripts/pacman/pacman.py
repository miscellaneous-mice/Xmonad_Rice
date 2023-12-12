
if __name__=="__main__" :

   

    with open( "file.txt", 'r+' ) as file:
        line = file.read()
        line = line.strip()
        if line == '󰮯':
          output = '󰮯'
          print(output)
          file.seek(0)
          file.write('')
          file.truncate()
          file.close()
        elif line == '':
          output = ''
          print(output)
          file.seek(0)
          file.write('󰮯')
          file.truncate()
          file.close()

