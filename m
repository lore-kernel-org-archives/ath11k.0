Return-Path: <SRS0=4fK3=PO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CA2C43217
	for <ath11k@archiver.kernel.org>; Tue, 26 Oct 2021 11:20:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D16A60232
	for <ath11k@archiver.kernel.org>; Tue, 26 Oct 2021 11:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D16A60232
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FHIn8Jyo4Ob/SN79d4w+xmmvdP80XN/GgLuWOnQEhWA=; b=PLXbpZKvhcXvpJ
	M0rLtyDui4VQ6t0aVRHMDERLNNHbx1dhS0gwcS5JTCZ7DVm8SGF8X0zJ8vs+hb4oy7zGzzqaROv5i
	6z7wF7pxt6YiPjFhXVoH6kPLP66mtgnoBfGBDYZmtW5Imjn4W+8UwNBZfeQZRLnQ1SM6gBzoaOhbL
	YV2EA2t+0vfTVU9m10NzG8UGAG8Kir64B80rxo+ZGnQ8xad9GMUHskX/ZYzSFnsjohVSzF3KbJZ3D
	0zvDNR9ugRILMxAhSjTMtNTYp0jiNs4FI0RJEPhtaFTI1M2A4uvzgcrFfBK5tpKieL4udRkbjkhBZ
	qQjIX5nWvCfWoevCAPqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfKUn-001cJr-PP; Tue, 26 Oct 2021 11:19:57 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfKUk-001cGs-0E
 for ath11k@lists.infradead.org; Tue, 26 Oct 2021 11:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635247194; x=1666783194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3D/VUADKnb7G3mKyABz343EVM5vSqCrGoJnBl084SOo=;
 b=IZKv7VU41I8/dKqYpnHxJEAwF+ZOC/GwA+DoQkyXZkoOY4/P0ZOGE5zh
 Z3g/SieOWZzZHqv1yG317XrX5UrRV05c2f8AGyAN7ixwlZZzZeWbPEVcb
 pXyU9zfAhhHWCHuObkZdHFVWqE8TNpUD5+kfXsf0thYhN+HsJdt/PJjae 0=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 26 Oct 2021 04:19:53 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 04:19:54 -0700
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Tue, 26 Oct 2021 04:19:52 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH 04/15] ath11k: allow only one interface up simultaneously for
 WCN6855
Date: Tue, 26 Oct 2021 07:19:02 -0400
Message-ID: <20211026111913.7346-5-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211026111913.7346-1-quic_wgong@quicinc.com>
References: <20211026111913.7346-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_041954_133842_ED170A6B 
X-CRM114-Status: GOOD (  13.94  )
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

Currently ath11k support both station/AP mode for WCN6855, and it is
configured with single_pdev_only, it means it has only one ath11k
and one ieee80211_hw which registered in mac80211 and one wiphy
registered in cfg80211. Now it does not have requirement to start
up both station and AP interface simultaneously for WCN6855, this
is to disable station and AP concurrency mode.

After this patch, when station interface is up, then AP interface
can not start up. AP interface can start up after station interface
down. Also when AP interface is up, station interface can not start
up. station interface can start up after AP interface down.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.h |  5 +++++
 drivers/net/wireless/ath/ath11k/mac.c  | 17 ++++++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a65f7d00eea2..e6c4963e41ac 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -972,4 +972,9 @@ static inline bool ath11k_support_cc_ext(struct ath11k_base *ab)
 	       test_bit(WMI_TLV_SERVICE_REG_CC_EXT_EVENT_SUPPORT, ab->wmi_ab.svc_map);
 }
 
+static inline bool ath11k_support_6G_cc_ext(struct ath11k *ar)
+{
+	return ath11k_support_cc_ext(ar->ab) && ar->supports_6ghz;
+}
+
 #endif /* _CORE_H_ */
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 61e70f3b4a7c..2d96eea9300d 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6431,7 +6431,22 @@ static int ath11k_mac_setup_iface_combinations(struct ath11k *ar)
 
 	combinations[0].limits = limits;
 	combinations[0].n_limits = n_limits;
-	combinations[0].max_interfaces = 16;
+
+	/* When single pdev is set, there is only one ieee80211_hw/wiphy
+	 * of mac80211/cfg80211, and it has only one reg rules stored
+	 * The reg rules of 6 GHz is different for station and AP, please
+	 * refer WMI_REG_CHAN_LIST_CC_EXT_EVENTID handler.
+	 * When start station/AP simultaneously, there is not more
+	 * struct to store the second reg rules in cfg80211.
+	 * Also it does not have requirement for station/AP concurrency
+	 * for WCN6855, so disable it currently.
+	 */
+	if (ab->hw_params.single_pdev_only &&
+	    ath11k_support_6G_cc_ext(ar))
+		combinations[0].max_interfaces = 1;
+	else
+		combinations[0].max_interfaces = 16;
+
 	combinations[0].num_different_channels = 1;
 	combinations[0].beacon_int_infra_match = true;
 	combinations[0].beacon_int_min_gcd = 100;
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
