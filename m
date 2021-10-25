Return-Path: <SRS0=kw9f=PN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE5D1C433FE
	for <ath11k@archiver.kernel.org>; Mon, 25 Oct 2021 12:21:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B96EA60FDA
	for <ath11k@archiver.kernel.org>; Mon, 25 Oct 2021 12:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B96EA60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4ye+JPtz2miulCmD4lvEM1ObGIEcPZv4cdYXP9e8tzk=; b=rogTggmmsF21IS
	NJjcQJYXVPNo+qLqIScImWc3Rmp/Vqe4xgK35k1mx3xmiPibD7IXX3/0zVhE0VOaAkgTzGove7SoK
	HG3QaJCDiA8k07y59dZ+cEcrtMmcZMQV/xUtrTbYrKFKJa1R5rlJYWFkABWT+EHFjqJZtoNm6zkI3
	yw1DbnsGoWDt9/eYOJdx7Us/V2Iki2B0fP16oq4js7Ji7pyvWNiXVvuwB2wuNi7/WC33DAi9xQY34
	tZdRBmGOPoe0XrbCyqJcOItOpid/o4PGKZlHgUyN86JR1rCJ987VO95mz7j7xi52+ByPelqk6q+ed
	F15yCwMjysES3S2Ms7vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meyyc-00GPIw-LX; Mon, 25 Oct 2021 12:21:18 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meyyZ-00GPGu-Ac
 for ath11k@lists.infradead.org; Mon, 25 Oct 2021 12:21:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635164475; x=1666700475;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=gY2wVZzuowqwL8UzlbTf5gnOqtd/tFAkzwq2gcuIZ+c=;
 b=SItHv9KzMFAtKNh37LiwUnt7Uji0quQ25sEAhllRREjLHLQSOKkInu5A
 YDOzpEirdf+EqPCyWyoFy4Q26Wj781TzmUIxQZG7z29l2ypJlp7c7hOtB
 07+I6Q5wTb0k5w4pZkuXYryjhOpeyv+7q+IZ/LYwQMRkfBhDb8cFvZUnB Y=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 25 Oct 2021 05:21:15 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 05:21:14 -0700
Received: from ppranees-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Mon, 25 Oct 2021 05:21:12 -0700
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <ppranees@codeaurora.org>,
 Lavanya Suresh <lavaks@codeaurora.org>
Subject: [PATCH] ath11k: Increment pending_mgmt_tx count before tx send invoke
Date: Mon, 25 Oct 2021 17:50:31 +0530
Message-ID: <1635164431-27437-1-git-send-email-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_052115_490328_2EBF7A47 
X-CRM114-Status: GOOD (  11.19  )
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

From: P Praneesh <ppranees@codeaurora.org>

There is a race condition whereby the tx completion handler can be invoked
before the 'num_pending_mgmt_tx" count is incremented. If that occurs, we
could get warning trace indicating that 'num_pending_mgmt_tx' is 0 (because
it was not yet incremented). Ideally, this trace should be seen only if
mgmt tx has not happened but tx completion is received, and it is not
expected in this race condition.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01386-QCAHKSWPL_SILICONZ-1

Co-developed-by: Lavanya Suresh <lavaks@codeaurora.org>
Signed-off-by: Lavanya Suresh <lavaks@codeaurora.org>
Signed-off-by: P Praneesh <ppranees@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/mac.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1cc5560..56f3208 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5048,13 +5048,15 @@ static void ath11k_mgmt_over_wmi_tx_work(struct work_struct *work)
 		arvif = ath11k_vif_to_arvif(skb_cb->vif);
 		if (ar->allocated_vdev_map & (1LL << arvif->vdev_id) &&
 		    arvif->is_started) {
+			atomic_inc(&ar->num_pending_mgmt_tx);
 			ret = ath11k_mac_mgmt_tx_wmi(ar, arvif, skb);
 			if (ret) {
+				if (atomic_dec_if_positive(&ar->num_pending_mgmt_tx) < 0)
+					WARN_ON_ONCE(1);
+
 				ath11k_warn(ar->ab, "failed to tx mgmt frame, vdev_id %d :%d\n",
 					    arvif->vdev_id, ret);
 				ieee80211_free_txskb(ar->hw, skb);
-			} else {
-				atomic_inc(&ar->num_pending_mgmt_tx);
 			}
 		} else {
 			ath11k_warn(ar->ab,
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
