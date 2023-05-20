<template>
    <footer class="clearfix">
        <div>
          <p><a title="项目简介" target="_blank" class="text-muted" href="">
           欢迎登录Codeanl的垃圾博客，该作品为实训课作品
          </a></p>
        </div>
        <div class="copyright">
            <p><a href="https://an23.co" target="_blank" rel="noopener">Codeanl an23.co © 2023.05.20 </a></p>
        </div>
    </footer>
</template>
<script>
export default {

}

</script>

<style scoped>
.clearfix {
    zoom: 1;
}

footer, footer p {
    font-size: 0.8125rem;
}
footer {
    position: relative;
    padding: 40px 10px 120px 10px;
    width: 100%;
    color: rgba(102,102,102,0.5);
    margin: 0px auto;
    overflow: hidden;
    text-align: center;
}
a {
    color: slategray;
    cursor: pointer;
    text-decoration: none;
}
a:hover{
    color: red;
}
</style>