const base = {
    get() {
        return {
            url : "http://localhost:8080/springboot097f4/",
            name: "springboot097f4",
            // 退出到首页链接
            indexUrl: 'http://localhost:8080/springboot097f4/front/dist/index.html'
        };
    },
    getProjectName(){
        return {
            projectName: "智慧公交管理系统"
        } 
    }
}
export default base
