Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A749C433FE
	for <ath11k@archiver.kernel.org>; Fri,  8 Apr 2022 03:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PJBNxTn6W4czyro3JMNVjvdAeBBg8g6HWHhplrV6WM4=; b=2p6DXOJQgHMlA7
	F6nirj6YbCAuZRXH8OmTgzq/eFAtktM+2LFNUmAPQ00faWTdToOQW/iSASlWrH97OS8sFJFY7Hs6l
	oTKjuId7AS5tg235jxp/GBjqSt/mmKRydMRujLi2WKHpXeQl6odpplAAdR9MUybAC2JJF8ZUZGuFq
	94KSDbL3iDdq/GGr1GjMume2Qxz7s+yza8ctwNGwO39MRl0eQeCvVpIWBfLUm+ZtXkv/udIQVn0VD
	vOrUbSrG6yOkdnfeiwYd215Q+BuifCSKGjXQDbrrBd0a1J8zs1OdRQWZZRMn/cJLMhXzkPFHuHbX6
	ihpnl63iC4hsSljUxbrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncerQ-00Ej08-0u; Fri, 08 Apr 2022 03:00:32 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncerN-00Eiy3-G2
 for ath11k@lists.infradead.org; Fri, 08 Apr 2022 03:00:31 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KZNJl3krgz1HBSY;
 Fri,  8 Apr 2022 10:59:51 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 8 Apr 2022 11:00:12 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Fri, 8 Apr
 2022 11:00:19 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>
CC: <quic_kvalo@quicinc.com>, <quic_cjhuang@quicinc.com>,
 <davem@davemloft.net>, <kuba@kernel.org>
Subject: [PATCH -next] ath11k: fix missing unlock on error in
 ath11k_wow_op_resume()
Date: Fri, 8 Apr 2022 11:09:12 +0800
Message-ID: <20220408030912.3087293-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_200029_750025_EDA65C90 
X-CRM114-Status: UNSURE (   7.25  )
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

Add the missing unlock before return from function ath11k_wow_op_resume()
in the error handling case.

Fixes: 90bf5c8d0f7e ("ath11k: purge rx pktlog when entering WoW")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/net/wireless/ath/ath11k/wow.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wow.c b/drivers/net/wireless/ath/ath11k/wow.c
index 6c2611f93739..9d088cebef03 100644
--- a/drivers/net/wireless/ath/ath11k/wow.c
+++ b/drivers/net/wireless/ath/ath11k/wow.c
@@ -758,7 +758,7 @@ int ath11k_wow_op_resume(struct ieee80211_hw *hw)
 	ret = ath11k_dp_rx_pktlog_start(ar->ab);
 	if (ret) {
 		ath11k_warn(ar->ab, "failed to start rx pktlog from wow: %d\n", ret);
-		return ret;
+		goto exit;
 	}
 
 	ret = ath11k_wow_wakeup(ar->ab);
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
