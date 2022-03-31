Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F53C433EF
	for <ath11k@archiver.kernel.org>; Thu, 31 Mar 2022 00:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R+z58uoRDKbnsmOwFE51Co1+V27B9oBPCRRsNmKZtP4=; b=QFVy4LCO6yw0PI
	SHLVQj4+AestqHrIKiqQFqbhcLMmcCzrqXe4Nao71TC+YrzFaN8vOipfZb17rxz19AixwOvb7kWcg
	Z2v/boip6jbk0Gw756+Eob0dyLyhcObiAvCpjsfS4m0Q/RhedMU/2k+nL65tqEn9t98M2gJ8yzSjH
	V9/oQGbHWfMc+MbxVst7JnbSxep11udf30dA/2oBe36nz0O0vHMrmIA9+AZHHrH5tpcnzc+ooP43o
	Sh0hYe+umeVCscdITHxzIX36iw1VOxJ/NdtLRgCPFukgJV0Mzs4Q7sCxCXBqXwtMG1HwZ0wO5lKRf
	oo/MTXzlDVS9y3W+Q/Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZiZ0-000CFo-Mx; Thu, 31 Mar 2022 00:21:22 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZiYy-000CFN-94
 for ath11k@lists.infradead.org; Thu, 31 Mar 2022 00:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648686080; x=1680222080;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5FRvCD7h6pC+ySGbwaZD+OK9XuQCej2qlEclI+8oj4o=;
 b=EnVxq/gQZ3uymrHo5fPFTc8OW7bGEgCXKXnZ1EC1uCZ+i0zDBigit9Fx
 0AG1ESUrFYdDK7IYQBYJ78i9Gsrm2T2BfFaEPGW/76QxH7FhnLh9vQfow
 EzgYIOtSRV2UTlxj3LDlqIB5wC0NOOJs9752qIgqsHFxI2IcO8JDbRBkq E=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 30 Mar 2022 17:21:19 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 17:21:19 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 30 Mar 2022 17:21:18 -0700
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 30 Mar 2022 17:21:17 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH] ath11k: Remove unnecessary delay in ath11k_core_suspend
Date: Thu, 31 Mar 2022 08:21:05 +0800
Message-ID: <20220331002105.1162099-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_172120_388533_A788C353 
X-CRM114-Status: UNSURE (   7.52  )
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

The intended delay in ath11k_core_suspend is introduced in commit
d1b0c33850d2 ("ath11k: implement suspend for QCA6390 PCI devices"),
now with ath11k_mac_wait_tx_complete added in commit ba9177fcef21
("ath11k: Add basic WoW functionalities"), that delay is not
necessary now, so remove it.

This is found in code review.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-02431-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 7f4462cf5787..509bfffceba1 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -459,11 +459,6 @@ int ath11k_core_suspend(struct ath11k_base *ab)
 	if (!ar || ar->state != ATH11K_STATE_OFF)
 		return 0;
 
-	/* TODO: there can frames in queues so for now add delay as a hack.
-	 * Need to implement to handle and remove this delay.
-	 */
-	msleep(500);
-
 	ret = ath11k_dp_rx_pktlog_stop(ab, true);
 	if (ret) {
 		ath11k_warn(ab, "failed to stop dp rx (and timer) pktlog during suspend: %d\n",

base-commit: 748b34786d1c96e758862d8e8577106ccde6515a
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
