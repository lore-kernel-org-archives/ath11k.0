Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AA1C433F5
	for <ath11k@archiver.kernel.org>; Tue, 21 Dec 2021 11:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QmJIRv5EEz0UxZqBQSormaHjeqTt3xZdmV7U6yjW4ws=; b=fwJO5zlHnWS19t
	TaeRpTWRv/rEEy7yx65VBHDmcOP7eDgT5wl60s4qXZtQGWBkm4Vke53C19RuZiaTwMwd7fgpF3ZeV
	latXihpu6q7yNPcbvE9ifw1/3n0LJq6BABjSaNOzQXdMpuK5XSY8Q2FqBwbY3J22W8uKYrRIR3ior
	4nY2OA+LbaL6AICA7ww0vQ1vwAhDoNISvtqRADPbcvdIcVJFsTPMiRZ6dXvYXbt+jZD5mh4ieHyN7
	3ppriU0W6ZJDcojLTzsmNIaSI5ZBijVzvdY7cj5J5Mw+eAZVXgSOhntaLOX3+ZNXtTexUASNHKDi6
	xgYxqEgfLnvwnfRxsrXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzdPF-006bf8-7S; Tue, 21 Dec 2021 11:34:09 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzdPC-006bco-3e
 for ath11k@lists.infradead.org; Tue, 21 Dec 2021 11:34:07 +0000
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JJDpw1Dhxz8yfQ;
 Tue, 21 Dec 2021 19:33:12 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 21 Dec 2021 19:34:01 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 21 Dec
 2021 19:34:01 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>
CC: <kvalo@kernel.org>, <akolli@codeaurora.org>
Subject: [PATCH -next] ath11k: add missing of_node_put() to avoid leak
Date: Tue, 21 Dec 2021 19:40:03 +0800
Message-ID: <20211221114003.335557-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_033406_352912_B52FEA1A 
X-CRM114-Status: UNSURE (   6.72  )
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

The node pointer is returned by of_find_node_by_type()
or of_parse_phandle() with refcount incremented. Calling
of_node_put() to aovid the refcount leak.

Fixes: 6ac04bdc5edb ("ath11k: Use reserved host DDR addresses from DT for PCI devices")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/net/wireless/ath/ath11k/mhi.c | 1 +
 drivers/net/wireless/ath/ath11k/qmi.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
index e4250ba8dfee..cccaa348cf21 100644
--- a/drivers/net/wireless/ath/ath11k/mhi.c
+++ b/drivers/net/wireless/ath/ath11k/mhi.c
@@ -332,6 +332,7 @@ static int ath11k_mhi_read_addr_from_dt(struct mhi_controller *mhi_ctrl)
 		return -ENOENT;
 
 	ret = of_address_to_resource(np, 0, &res);
+	of_node_put(np);
 	if (ret)
 		return ret;
 
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 3b9ba0e03a66..2d46c0b07be3 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1892,6 +1892,7 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
 			}
 
 			ret = of_address_to_resource(hremote_node, 0, &res);
+			of_node_put(hremote_node);
 			if (ret) {
 				ath11k_dbg(ab, ATH11K_DBG_QMI,
 					   "qmi fail to get reg from hremote\n");
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
