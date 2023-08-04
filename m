Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E69C001DB
	for <ath11k@archiver.kernel.org>; Fri,  4 Aug 2023 09:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3SFXw6NC26+2ktMXmcarPGKEJDxoMrl/XfNubyeEY48=; b=ShIhsZjIbNLXNv
	Z/dWLb7sf/CYU78/Xchk3syskpK7fYIv49lfR3qic/wIO1P5g3dIbqnBBh8Mv3ghVgj/Q4u4Eb91f
	ZFNH7Ud/YVhSu2fPNTnWxL96bQJMcws1S9Pp0iIc+ESOT17Y3ms0WNIfvupvyZT9t6zXxr4SMwCIl
	x2c5JGchnrZNxooVkEUkl9bPWw7mXWM3rUyAPTxvdMefVEPy7V1snJPzujEyQSgOy1Tgxp5CqEwg9
	vEZE39glXQwOL7OA/MzTzIJsvvcaZRUu06goMYsRGNn8VyhxOd3vxeXrwyZOfs0xJwDZkCXeJmS6U
	c5W3uuZmhv90dlVgAuzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRqub-00Bz6K-1j;
	Fri, 04 Aug 2023 09:15:57 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRquX-00Bz4Q-3D
	for ath11k@lists.infradead.org;
	Fri, 04 Aug 2023 09:15:56 +0000
Received: from dggpemm100024.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RHKjX2wvWzNm4v;
	Fri,  4 Aug 2023 17:12:16 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm100024.china.huawei.com (7.185.36.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 17:15:42 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 17:15:42 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>
CC: <kvalo@kernel.org>, <quic_jjohnson@quicinc.com>,
	<yangyingliang@huawei.com>
Subject: [PATCH -next] wifi: ath11k: simplify the code with module_platform_driver
Date: Fri, 4 Aug 2023 17:12:55 +0800
Message-ID: <20230804091255.1347178-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_021554_267726_B0654B6F 
X-CRM114-Status: UNSURE (   7.17  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

The init/exit() of driver only calls platform_driver_register/unregister,
it can be simpilfied with module_platform_driver.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 139da578831a..1074b0828de1 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1331,17 +1331,7 @@ static struct platform_driver ath11k_ahb_driver = {
 	.shutdown = ath11k_ahb_shutdown,
 };
 
-static int ath11k_ahb_init(void)
-{
-	return platform_driver_register(&ath11k_ahb_driver);
-}
-module_init(ath11k_ahb_init);
-
-static void ath11k_ahb_exit(void)
-{
-	platform_driver_unregister(&ath11k_ahb_driver);
-}
-module_exit(ath11k_ahb_exit);
+module_platform_driver(ath11k_ahb_driver);
 
 MODULE_DESCRIPTION("Driver support for Qualcomm Technologies 802.11ax WLAN AHB devices");
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
