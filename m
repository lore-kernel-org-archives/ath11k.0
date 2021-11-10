Return-Path: <SRS0=jp2b=P5=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EF8C433F5
	for <ath11k@archiver.kernel.org>; Wed, 10 Nov 2021 15:36:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9281A6121F
	for <ath11k@archiver.kernel.org>; Wed, 10 Nov 2021 15:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9281A6121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8tHXDVAzW/tKq2yGN4VggkHIfTGnB6z/hkn9wIaJGWY=; b=RdiCXdwvzxEAGI
	D/wQx3ZB0dp2PAtapu/ewbHrqs4VmNSlM4ILGA6z6dfdDG5dl0k3I8dkb8DmwKilkHx3FttoPZY5r
	+9yX2ccq6/3p0eSFHDYZM8idA8zdev3Z3ck6VKgVwAU/XBpiRE4eembzrmLV8SGk3lLShOZmLUcNG
	EKOIy9ZXsOH9y7WKpIHego8HwjXHdff2fsp8n2jiCQWkx4C7YV6qIhU+Xz+7W+n44WW4yvYh75U0M
	gM3g12D3e0s1bh2TdpVkLhDaRN4MsM0aFHF5j7oi6QRKMa+hQ2YdQ/vUrTVdeEXWHYqVAgGWluCl5
	MmK1kgB0X3tl7aFdPjSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkpe6-005kjv-GH; Wed, 10 Nov 2021 15:36:18 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkpe4-005kjN-F3
 for ath11k@lists.infradead.org; Wed, 10 Nov 2021 15:36:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1636558576; x=1668094576;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=6pqHHAwHwHiiVqjFTIQqX0idFJTAseI5HjTjevH/U7o=;
 b=Bxvk3YxlxlUaudEqbXjY5E5zVmXk8L0ArMYwtU29j2i5A4/e69ulSJgr
 dCn8VlhMxHJ/fGKgABrEuSR/C2G43PBw3bZ4i7Rbd6r6VPiP31pAC57QA
 0tIPTDmvdiwEPd+l1jdoYzup5Woep6GvzTj5BVUHC2VZJ8/71syrnHc/G Q=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 10 Nov 2021 07:36:14 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 07:36:14 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Wed, 10 Nov 2021 07:36:14 -0800
Received: from periyasa-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Wed, 10 Nov 2021 07:36:11 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Karthikeyan Periyasamy
 <quic_periyasa@quicinc.com>
Subject: [PATCH] ath11k: fix error routine when fallback of add interface fails
Date: Wed, 10 Nov 2021 21:05:57 +0530
Message-ID: <1636558557-2874-1-git-send-email-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_073616_594551_7F2DC425 
X-CRM114-Status: GOOD (  11.23  )
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

When there is an error in add interface process from
ath11k_mac_set_kickout(), the code attempts to handle a
fallback for add_interface. When this fallback succeeds, the
driver returns zero rather than error code. This leads to
success for the non created VAP. In cleanup, driver gets
remove interface callback for the non created VAP and
proceeds to self peer delete request which leads to FW assert.
Since it was already deleted on the fallback of add interface,
return the actual error code instead of fallback return code.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-00729-QCAHKSWPL_SILICONZ-3 v2

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 5d860fe..25f5248 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5523,7 +5523,7 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 	u32 param_id, param_value;
 	u16 nss;
 	int i;
-	int ret;
+	int ret, fbret;
 	int bit;
 
 	vif->driver_flags |= IEEE80211_VIF_SUPPORTS_UAPSD;
@@ -5725,17 +5725,17 @@ static int ath11k_mac_op_add_interface(struct ieee80211_hw *hw,
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
 		reinit_completion(&ar->peer_delete_done);
 
-		ret = ath11k_wmi_send_peer_delete_cmd(ar, vif->addr,
-						      arvif->vdev_id);
-		if (ret) {
+		fbret = ath11k_wmi_send_peer_delete_cmd(ar, vif->addr,
+							arvif->vdev_id);
+		if (fbret) {
 			ath11k_warn(ar->ab, "failed to delete peer vdev_id %d addr %pM\n",
 				    arvif->vdev_id, vif->addr);
 			goto err;
 		}
 
-		ret = ath11k_wait_for_peer_delete_done(ar, arvif->vdev_id,
-						       vif->addr);
-		if (ret)
+		fbret = ath11k_wait_for_peer_delete_done(ar, arvif->vdev_id,
+							 vif->addr);
+		if (fbret)
 			goto err;
 
 		ar->num_peers--;
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
