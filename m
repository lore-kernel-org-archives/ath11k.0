Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40296C433EF
	for <ath11k@archiver.kernel.org>; Mon, 30 May 2022 13:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2rwkE9FOD7aL0TZrRr4dqyLO7l0l4dBCxLuaLxvFSc0=; b=MxmHHlqw6ebgH9
	53rrzYpq7lOU9Gqddo+UJqpFZJQj2a9Yj4SAij59kWsenudktpRCGPE1PT2Ivgt4tG32gsNHMTAzj
	Dp1g7fLx04Jkze/qu1OdFnuk4Qqi4J0CGOhE+5mg/k4JjCRAOJuyhTtgbncnmvbyKv72NWdRNL8nX
	be1t0l66BMzpLJb6wsN+plPfQeTLywOKhw7WcF7811c+1leO74v3ldNV8k7mqNL0vGW9m8OGYZiRc
	/kWcOJSOfpmOyCULB3GVzYiMWyiF/j/XyCYGrEgOyOVOS8t2Y9L7QCCB3hXxAutCxsVbf2CUZJmRt
	ymjLka/Mj6/6rs7iRqag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfam-006mkv-Ai; Mon, 30 May 2022 13:37:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfUx-006jW4-M1
	for ath11k@lists.infradead.org; Mon, 30 May 2022 13:31:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 125E960F2D;
	Mon, 30 May 2022 13:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED130C385B8;
	Mon, 30 May 2022 13:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653917514;
	bh=1jivECbvXCO1ttPRE4WjZy2whczZwwcQBj1mjYHVZ/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lK0J16I+HPB6Lo5BoxjDRdnRCau6vI0i4VhrlW/HnMpca2IqRooPg1I6a5k1+jdAr
	 Lwgv41hAlvg6/736ImC3jCUG+x0MWS9qN9Ap38Wu9zq8l/51oyTqlPz8IaUFe/Vixc
	 O1TJ/bhq5MukFeL1GFXq7+Rgmvo13U0FQmshh+ZMNJWQuL8Dj7r9ghfrBbIEUQpxB5
	 Q/2aNtiMWx9jY8nh1DvjUT60ZQti1kUxRK1yhdpP7wLhGhHIEFz3mRA6FWNa25oqhY
	 /lTj76T5RsDm82M68CebnftYDBFZ8w4qO6CyFbCwyYedgqj9fjz2MTotzqS80PJpXB
	 lAEJhWJy4W0Mg==
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
Subject: [PATCH AUTOSEL 5.17 007/135] ath11k: Change max no of active probe SSID and BSSID to fw capability
Date: Mon, 30 May 2022 09:29:25 -0400
Message-Id: <20220530133133.1931716-7-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530133133.1931716-1-sashal@kernel.org>
References: <20220530133133.1931716-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_063155_861879_B5A3534F 
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
index 2f26ec1a8aa3..8173570975e4 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -3087,9 +3087,6 @@ enum scan_dwelltime_adaptive_mode {
 	SCAN_DWELL_MODE_STATIC = 4
 };
 
-#define WLAN_SCAN_MAX_NUM_SSID          10
-#define WLAN_SCAN_MAX_NUM_BSSID         10
-
 #define WLAN_SSID_MAX_LEN 32
 
 struct element_info {
@@ -3104,7 +3101,6 @@ struct wlan_ssid {
 
 #define WMI_IE_BITMAP_SIZE             8
 
-#define WMI_SCAN_MAX_NUM_SSID                0x0A
 /* prefix used by scan requestor ids on the host */
 #define WMI_HOST_SCAN_REQUESTOR_ID_PREFIX 0xA000
 
@@ -3112,10 +3108,6 @@ struct wlan_ssid {
 /* host cycles through the lower 12 bits to generate ids */
 #define WMI_HOST_SCAN_REQ_ID_PREFIX 0xA000
 
-#define WLAN_SCAN_PARAMS_MAX_SSID    16
-#define WLAN_SCAN_PARAMS_MAX_BSSID   4
-#define WLAN_SCAN_PARAMS_MAX_IE_LEN  256
-
 /* Values lower than this may be refused by some firmware revisions with a scan
  * completion with a timedout reason.
  */
@@ -3311,8 +3303,8 @@ struct scan_req_params {
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
