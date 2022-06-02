Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D4AC43334
	for <ath11k@archiver.kernel.org>; Thu,  2 Jun 2022 12:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1EWUaFWwn6GZrQa79rYfHh45FcYKaTzft/a4qj3gSa0=; b=fJupBdSEkojKGI
	nXGIjYQQLzupRgkt5u0cP3vKoo5BQJtfcBw0v8dQRRPTenGCwvL8TfveojyISr23MZAOdW6VEXBpX
	nSq0IBi/LxqYHcbB1ZH/oPG9uUdf9p0Qbbx2RRyqxtj7F8ukhr2qFAx8w4ZtQ1Na65PJLjV/HnCpY
	rwAitKzOQtmo5vbyQhHZbwVz/Lh3pnAgtJMnhwjVvp6urh6ZHkZNcZOhB6WXwtU/KkSiCUtHkQKZk
	EEEWPlckGgHDP2zfnlatsKeyBO1KihGfJif3joA8gQDqDb2lldM6QKSys4JMrA9TBtyFP5u6atebE
	a1l8vTdQmNnjA13o3nAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwk9L-003F7P-Q6; Thu, 02 Jun 2022 12:42:03 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwk9J-003F6e-Tu
	for ath11k@lists.infradead.org; Thu, 02 Jun 2022 12:42:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654173721; x=1685709721;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vI3dykq+/nxLcaJ8BRdrfh9jOZK5Imea8Cf6WRjmGFs=;
  b=ctf9i/7j9YaGy++pWqjnUkWoEMl4SodbERk4zM2xM6PMIg52ubvjFfKB
   U73uoFMzCMY4NH0tvQQAYp2Ayfs/NiRd1y+umzYS07lGqRxwmigh9bHXB
   c/Rk02ISFB2fd84qvv3wAMW1qCls0zKIywbAKH2J/WaI5QfVbfTVR6Q4j
   s=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 02 Jun 2022 05:42:00 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 05:42:00 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 2 Jun 2022 05:42:00 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 2 Jun 2022 05:41:58 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
Subject: [PATCH] ath11k: Fix LDPC config in set_bitrate_mask hook
Date: Thu, 2 Jun 2022 18:11:42 +0530
Message-ID: <20220602124142.29909-1-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_054202_012228_FD9D303F 
X-CRM114-Status: GOOD (  13.07  )
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

Currently ar->ht_cap_info is not set anywhere in the code, this could
result in LDPC config computed wrongly in the set_bitrate_mask() hook
and eventually sending wrong config to the target. Fix this by checking
the LDPC support from the band HT capabilities of the radio instead.

Furthermore, it looks like firmwares running on the ath11k hardware
do not set WMI_HT_CAP_LDPC for advertising the TX LDPC capability,
WMI_HT_CAP_TX_LDPC is set instead and this should be checked for
getting hardware's TX LDPC support. This is true for QCA6390, WCN6855
& WCN6750 hardware.

Also, remove unused variables ht_cap_info & vht_cap_info from
struct ath11k{}.

Found this during code review.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.h | 2 --
 drivers/net/wireless/ath/ath11k/mac.c  | 4 +++-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index ea31016437b0..2bd5eb9df4d4 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -582,8 +582,6 @@ struct ath11k {
 	struct ath11k_pdev_wmi *wmi;
 	struct ath11k_pdev_dp dp;
 	u8 mac_addr[ETH_ALEN];
-	u32 ht_cap_info;
-	u32 vht_cap_info;
 	struct ath11k_he ar_he;
 	enum ath11k_state state;
 	bool supports_6ghz;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index f11956163822..6b3d7a014847 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -7800,6 +7800,7 @@ ath11k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 {
 	struct ath11k_vif *arvif = (void *)vif->drv_priv;
 	struct cfg80211_chan_def def;
+	struct ath11k_pdev_cap *cap;
 	struct ath11k *ar = arvif->ar;
 	enum nl80211_band band;
 	const u8 *ht_mcs_mask;
@@ -7820,10 +7821,11 @@ ath11k_mac_op_set_bitrate_mask(struct ieee80211_hw *hw,
 		return -EPERM;
 
 	band = def.chan->band;
+	cap = &ar->pdev->cap;
 	ht_mcs_mask = mask->control[band].ht_mcs;
 	vht_mcs_mask = mask->control[band].vht_mcs;
 	he_mcs_mask = mask->control[band].he_mcs;
-	ldpc = !!(ar->ht_cap_info & WMI_HT_CAP_LDPC);
+	ldpc = !!(cap->band[band].ht_cap_info & WMI_HT_CAP_TX_LDPC);
 
 	sgi = mask->control[band].gi;
 	if (sgi == NL80211_TXRATE_FORCE_LGI)
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
