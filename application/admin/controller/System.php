<?php
/**
 * +----------------------------------------------------------------------
 * | 系统设置控制器
 * +----------------------------------------------------------------------
 *                      .::::.
 *                    .::::::::.            | AUTHOR: siyu
 *                    :::::::::::           | EMAIL: 407593529@qq.com
 *                 ..:::::::::::'           | QQ: 407593529
 *             '::::::::::::'               | WECHAT: zhaoyingjie4125
 *                .::::::::::               | DATETIME: 2019/03/06
 *           '::::::::::::::..
 *                ..::::::::::::.
 *              ``::::::::::::::::
 *               ::::``:::::::::'        .:::.
 *              ::::'   ':::::'       .::::::::.
 *            .::::'      ::::     .:::::::'::::.
 *           .:::'       :::::  .:::::::::' ':::::.
 *          .::'        :::::.:::::::::'      ':::::.
 *         .::'         ::::::::::::::'         ``::::.
 *     ...:::           ::::::::::::'              ``::.
 *   ```` ':.          ':::::::::'                  ::::..
 *                      '.:::::'                    ':'````..
 * +----------------------------------------------------------------------
 */
namespace app\admin\controller;
use app\common\model\Config;
use think\facade\Request;

class System extends Base
{
    //系统设置
    public function system(){
        //查找所有模版
        $dir = './template/home/';
        $template = get_dir($dir);
        $this->view->assign('template', $template);
        $system = \app\common\model\System::get(1);
        $this->view->assign('system', $system);
        return $this->view->fetch();

    }

    //系统设置保存
    public function systemPost(){
        if(Request::isPost()) {
            $data = Request::except('file');
            $system = new \app\common\model\System();
            $result = $system->allowField(true)->save($data, ['id' => 1]);
            if($result) {
                $this->success('修改成功', 'system');
            } else {
                $this->error('修改失败');
            }
        }
    }
}
