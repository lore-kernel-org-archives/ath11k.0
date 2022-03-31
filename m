Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B75DC433F5
	for <ath11k@archiver.kernel.org>; Thu, 31 Mar 2022 04:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iVGqbYG8wd9K+W0cw4ghNc6JlqdsAlRdkn0Jftr8mRQ=; b=dQmPy0XqzxwHfM
	MmoNJn4NVMYvUF/DYbMx/A//1sBrIydwarHKBPeMehBh85fqwwb3I4OjKQtaVaqqg1SxTxytR/XAZ
	hVHLCO3aWE1aVPvLB5gdzw+auLUNTDsDFIUGbY4NBw/DxfsrKZzdkzsKLopiX1+QkZP56UfD/T2WO
	yOu3dMmw41ahw6fLq5H+Uj1M28VDVKB7ZhmiS1MQ0uwedu8I8skDzZq3FPNp7jfeW/SBezofFq61y
	fgEMy9yb1OyQNq94W2SGqHNtsQVwN3Rc9SNWs+lz83Lzn+iMqMM2lhRCALlxZaXtkkBWqkU8sFu5c
	NIuVswZRy355bNJOKP8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZmZb-000dgF-KX; Thu, 31 Mar 2022 04:38:15 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZmZZ-000dfj-IE
 for ath11k@lists.infradead.org; Thu, 31 Mar 2022 04:38:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648701493; x=1680237493;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=5Ug/c+onuuFVHOMnWrXE1dZ96puP8xNz8D0CvaUjs/A=;
 b=i9XV2juTh0Rbfh0teQdutmnxBoAfXGG4O0lyZN4PKLqx665oAC3/qp6/
 WYQQ6vMjvoMrDe7GE47eDmO5no55EpQg6sRr1N9BezGgQZAs+0ljo4Dje
 IG1uHYQ7/k0ocOkZwZnlGA29IHsKgtc48Fuh5RO5OLdj7DLViArosyKyU Y=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 30 Mar 2022 21:38:09 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 21:38:09 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 30 Mar 2022 21:38:09 -0700
Received: from akolli-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 30 Mar 2022 21:38:07 -0700
From: Anilkumar Kolli <quic_akolli@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Anilkumar Kolli <quic_akolli@quicinc.com>
Subject: [PATCH v5.18] Revert "ath11k: mesh: add support for 256 bitmap in
 blockack frames in 11ax"
Date: Thu, 31 Mar 2022 10:07:57 +0530
Message-ID: <1648701477-16367-1-git-send-email-quic_akolli@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_213813_672399_F974BB2E 
X-CRM114-Status: GOOD (  11.30  )
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

This reverts commit 743b9065fe6348a5f8f5ce04869ce2d701e5e1bc.

The original commit breaks the 256 bitmap in blockack frames in AP
mode. After reverting the commit the feature works again in both AP and
mesh modes

Tested-on: IPQ8074 hw2.0 PCI WLAN.HK.2.6.0.1-00786-QCAHKSWPL_SILICONZ-1

Signed-off-by: Anilkumar Kolli <quic_akolli@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 175a4ae752f3..ca998fb13b62 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3150,6 +3150,20 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 			arvif->do_not_send_tmpl = true;
 		else
 			arvif->do_not_send_tmpl = false;
+
+		if (vif->bss_conf.he_support) {
+			ret = ath11k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
+							    WMI_VDEV_PARAM_BA_MODE,
+							    WMI_BA_MODE_BUFFER_SIZE_256);
+			if (ret)
+				ath11k_warn(ar->ab,
+					    "failed to set BA BUFFER SIZE 256 for vdev: %d\n",
+					    arvif->vdev_id);
+			else
+				ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
+					   "Set BA BUFFER SIZE 256 for VDEV: %d\n",
+					   arvif->vdev_id);
+		}
 	}
 
 	if (changed & (BSS_CHANGED_BEACON_INFO | BSS_CHANGED_BEACON)) {
@@ -3185,14 +3199,6 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 
 		if (arvif->is_up && vif->bss_conf.he_support &&
 		    vif->bss_conf.he_oper.params) {
-			ret = ath11k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
-							    WMI_VDEV_PARAM_BA_MODE,
-							    WMI_BA_MODE_BUFFER_SIZE_256);
-			if (ret)
-				ath11k_warn(ar->ab,
-					    "failed to set BA BUFFER SIZE 256 for vdev: %d\n",
-					    arvif->vdev_id);
-
 			param_id = WMI_VDEV_PARAM_HEOPS_0_31;
 			param_value = vif->bss_conf.he_oper.params;
 			ret = ath11k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
