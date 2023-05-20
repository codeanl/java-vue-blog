<template>
  <div>
    <Header></Header>
    <div class="container">
      <div class="block">
        <el-timeline>
          <el-timeline-item
              placement="top"
              v-for="(blog,index) in blogContents"
              :key="index"
          >
            <el-card>
              <h2>
                <router-link class="link" :to="{name:'BlogDetail',params:{blogId:blog.id}}">{{blog.title}}</router-link>
              </h2>
              <div class="new-meta-box">
                <div class="new-meta-item">
                  <i class="el-icon-user-solid" aria-hidden="true"></i>


                  <router-link class="link" :to="{name:'User',params:{username:blog.author}}">{{blog.author}}</router-link>
                </div>
                <div class="new-meta-item date">
                  <i class="el-icon-s-order" aria-hidden="true"></i>
                  <a class="notlink">

                    <p>{{blog.gmtCreate}}</p>
                  </a>
                </div>
              </div>
              <div class="fenge">
                <el-divider></el-divider>
              </div>
              <blockquote>
                <p><i class="el-icon-collection-tag"></i>简介：{{blog.description}}</p>
              </blockquote>
            </el-card>
          </el-timeline-item>
        </el-timeline>
        分页
        <el-pagination class="pager" background layout="prev, pager, next"
                       :current-page="currentPage"
                       :page-size="pageSize"
                       :total="total"
                       @current-change="getPage">
        </el-pagination>
      </div>
      <div class="right">
        <div class="info">
          <div style="width: 100%;height: 120px;background:url(https://an23.co/upload/2022/07/IMG_3966%2820220501-021302%29.JPG);background-repeat: no-repeat;background-size: cover;">
<!--            <el-avatar :size="80" :src="user.avatar" style="margin-left: 33%;"></el-avatar>-->
            <el-avatar :size="80" src="http://ru4zvdhsv.hn-bkt.clouddn.com/Fp-Sqoyz40-829GpdkFMTNsifBmx" style="margin-left: 33%;"></el-avatar>
          </div>
          <h1>长谷川安</h1>
          <span>春风不解风情 吹动少年的心</span><br><br>
          <div style="padding: 0 5px 0 5px;text-align: center">
            <span style="display: inline-block;margin-right: 30px">文章 {{ this.articlesum }}</span>
            <span style="display: inline-block;margin-right: 30px">分类 {{this.typesum}}</span>
            <span style="display: inline-block;">访问 {{this.looksum}}</span>
          </div>
        </div>
        <div class="notice">
            <div class="noticettop"> <h1>公告信息</h1></div>
            <div class="noticetp">
              <p>欢迎您来访长谷川安同学的小破站，如果您对博主还认可，麻烦您收藏本站，时常来蹭蹭 (¬‿¬)</p>
            </div>
        </div>
      </div>
    </div>

    <Footer></Footer>
  </div>
</template>

<script>
import Header from "@/components/Header";
import Footer from "@/components/Footer";
export default {
  components: { Header,Footer },

  data() {
    return {
      blogContents: {},
      currentPage: 1,
      total: 0,
      pageSize: 5,
      avatar:require("@/asserts/img/default_user.jpg"),
    };
  },

  methods: {
    getPage(currentPage) {
      const _this = this;
      _this.$axios.get("/blogs?currentPage=" + currentPage).then(res => {
        _this.blogContents = res.data.data.records;
        _this.currentPage = res.data.data.current;
        _this.total = res.data.data.total;
        _this.pageSize = res.data.data.size;
      });
    }
  },
  created() {
    this.getPage(1);
  }
};
</script>

<style>
.container {
  display: flex;
  justify-content: space-between;
  width: 100%;
}

.right{
  width: 35%;
  height: 700px;
  margin: 7px 0 0 25px;

}
.info{
  width:100%;
  height: 300px;
  background-color: #faf8f7;
}
.notice{
  margin-top: 30px;
  width:100%;
  height: 200px;
}
.block{
  width: 90%;
}
.fenge .el-divider{
 margin: 2px 0 !important;
}
.new-meta-item a{
    text-decoration: none;
    color: rgba(68,68,68,0.65);
    padding-left: 0;
    padding-right: 4px;
}
.new-meta-box{
    -webkit-transition: all 0.1s ease;
    font-size: 0.8125rem;
    padding-top: 0px;
    padding-bottom: 2px;
    display: flex;
    align-items: center;
    flex-wrap: wrap;
}
.new-meta-item{
    color: rgba(68,68,68,0.65);
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 2px;
    margin: 0 8px 0 0;
    border-radius: 4px;
}
blockquote{
    margin-left: 2px;
    text-align: left;
    font-size: 0.9375rem;
    margin-top: 0.5rem;
    margin-bottom: 0.5rem;
    position: relative;
    width: 95%;
    padding: 0.7em 1.2em;
    background: #fff7f3;
    border-left: 4px solid #2196f3;
    border-radius: 4px;
}
.pager {
  margin: 0 auto;
  text-align: center;
}
.link{
  color: skyblue;
  text-decoration: none;
}
.link:hover{
  color: #ff5722;
}

.info h1{
  font-size: 25px;
  text-align: center;

}
.info span{
  font-size: 18px;
  display: block;
  text-align: center;
}
.noticettop{
  height: 40px;
  border:  1px solid #f6e4df;

}
.noticettop h1{
  font-size: 20px;
  margin-left: 20px;
}
.noticetp{
  margin: 0 auto;
  height: 140px;
  background-color: #faf8f7;
}
.noticetp p{
  margin: 2px 10px 0 10px;
  font-size: 15px;
}

</style>