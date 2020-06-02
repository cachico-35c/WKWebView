<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title></title>
<meta charset="utf-8">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="">
<link rel="shortcut icon" href="">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

        $(function(){
            $('.comp').on('click',function(){
                webkit.messageHandlers.successHandler.postMessage("登録が完了しました。");
                // webkit.messageHandlers.errorHandler.postMessage("登録が失敗しました。");
                return false;
            });
        });

    </script>
</head>
<body>

<div class="">
    <a href="comp" class="comp">登録完了ボタン　動作検証</a>
</div>
</body>
</html>