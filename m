Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27B2C433F5
	for <ath11k@archiver.kernel.org>; Mon, 30 May 2022 13:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IrWQDv86ZsPeXCgtMfJSTgFpxopD2muWQ1bgMk7H+qM=; b=AUfa2/kfPC4/wr
	PCzSYloEHxl4rXjJWE98yuCrUih6iHDEISIpnVnfn+8/4B/pSoTI6ibLmE3zsTip6gNjrE0LCEdGa
	tr2LC5zihIdYax1gZ/OaG9WF8fOVwNhgzTY/mfbzJ4EOP8QeAfSu6oErZ0F1W9Z1WuSS9MHkcdcMY
	wI/HKBx3VBB/HBJq4mTbykyl4i/JFhiQlJZtW7WBxZ3eMhHKHzXMu/P3feBBthNYTnKZF0t1OVVGI
	gU13PRySlVyRDhQ0MBYzdyIVdQCWxmV+7OHgpTYpawnFShQTipj6aRNqD9dmLAAL5cTk6o+KEMRMw
	2qYA/63hWCDcI0CedbtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfO9-006fv3-7H; Mon, 30 May 2022 13:24:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfO5-006fsC-2L
	for ath11k@lists.infradead.org; Mon, 30 May 2022 13:24:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D06DB60DD4;
	Mon, 30 May 2022 13:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00B5C36AE7;
	Mon, 30 May 2022 13:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653917086;
	bh=2nJqjbrkEXx+zlta2BV0O1ePumXPRWHtyr5AtREfBTY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NXaRchUtiQhdrX3BLzp7KbspSPkJtgCBkoRLkaDu3PVLOJfYnHnGiHjNF9XaDHKPa
	 j0INvzXZuOhsaoGfR7d3ni7RRPhQJHvsfEnQdQiJBxviB660sjaBeSK30MnC4XwxP2
	 K6lDfTGKj68lbV6pXh0CzLDZtxWSj1f8Q5qMpsAEXEdvx4yTIzEhwgB/p6DjpmZmFt
	 yv7vqsB1JwDgHv1h/is+0ufT6BvRRhC96pNVEXqYeQwdCFXnCmmwV7BNhhC086VpUc
	 DgeTDJmdLpB9A0jUuMdEQUORMZrLEKwpxUPCycpjhCymvEOa0lwp4SNfJuOv878SZB
	 nCc0OFjj/NJ4A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 008/159] ath11k: Change max no of active probe SSID and BSSID to fw capability
Date: Mon, 30 May 2022 09:21:53 -0400
Message-Id: <20220530132425.1929512-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530132425.1929512-1-sashal@kernel.org>
References: <20220530132425.1929512-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_062449_218159_7CD2CA61 
X-CRM114-Status: GOOD (  14.01  )
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

From: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>

[ Upstream commit 50dc9ce9f80554a88e33b73c30851acf2be36ed3 ]

The maximum number of SSIDs in a for active probe requests is currently
reported as 16 (WLAN_SCAN_PARAMS_MAX_SSID) when registering the driver.
The scan_req_params structure only has the capacity to hold 10 SSIDs.
This leads to a buffer overflow which can be triggered from
wpa_supplicant in userspace. When copying the SSIDs into the
scan_req_params structure in the ath11k_mac_op_hw_scan route, it can
overwrite the extraie pointer.

Firmware supports 16 ssid * 4 bssid, for each ssid 4 bssid combo probe
request will be sent, so totally 64 probe requests supported. So
set both max ssid and bssid to 16 and 4 respectively. Remove the
redundant macros of ssid and bssid.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01300-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20220329150221.21907-1-quic_kathirve@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/wmi.h | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 587f42307250..b5b72483477d 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -3088,9 +3088,6 @@ enum scan_dwelltime_adaptive_mode {
 	SCAN_DWELL_MODE_STATIC = 4
 };
 
-#define WLAN_SCAN_MAX_NUM_SSID          10
-#define WLAN_SCAN_MAX_NUM_BSSID         10
-
 #define WLAN_SSID_MAX_LEN 32
 
 struct element_info {
@@ -3105,7 +3102,6 @@ struct wlan_ssid {
 
 #define WMI_IE_BITMAP_SIZE             8
 
-#define WMI_SCAN_MAX_NUM_SSID                0x0A
 /* prefix used by scan requestor ids on the host */
 #define WMI_HOST_SCAN_REQUESTOR_ID_PREFIX 0xA000
 
@@ -3113,10 +3109,6 @@ struct wlan_ssid {
 /* host cycles through the lower 12 bits to generate ids */
 #define WMI_HOST_SCAN_REQ_ID_PREFIX 0xA000
 
-#define WLAN_SCAN_PARAMS_MAX_SSID    16
-#define WLAN_SCAN_PARAMS_MAX_BSSID   4
-#define WLAN_SCAN_PARAMS_MAX_IE_LEN  256
-
 /* Values lower than this may be refused by some firmware revisions with a scan
  * completion with a timedout reason.
  */
@@ -3312,8 +3304,8 @@ struct scan_req_params {
 	u32 n_probes;
 	u32 *chan_list;
 	u32 notify_scan_events;
-	struct wlan_ssid ssid[WLAN_SCAN_MAX_NUM_SSID];
-	struct wmi_mac_addr bssid_list[WLAN_SCAN_MAX_NUM_BSSID];
+	struct wlan_ssid ssid[WLAN_SCAN_PARAMS_MAX_SSID];
+	struct wmi_mac_addr bssid_list[WLAN_SCAN_PARAMS_MAX_BSSID];
 	struct element_info extraie;
 	struct element_info htcap;
 	struct element_info vhtcap;
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
