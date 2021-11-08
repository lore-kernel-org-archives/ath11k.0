Return-Path: <SRS0=ve4P=P4=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D50C433EF
	for <ath11k@archiver.kernel.org>; Tue,  9 Nov 2021 01:17:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 389DF610A0
	for <ath11k@archiver.kernel.org>; Tue,  9 Nov 2021 01:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 389DF610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XmTtCSUsP8x+PESU/zA1dut1CzqbT2nnqtoF930MW9A=; b=bgcPzbOO6crB5D
	y5JHe1EwodMNHqzzvyfdmS5ru+YTVCi7kM15VCtcVoCxOE7TbC4QKSX8O9Uy0L3+M+OP3pM2LKfzr
	PAPAXJf1csSo+qu8qAAoGNI/q9Velpwx0vBGNvI147y/ikW1bKJS/3dUVm7sIMeaWqPUG+hn8r6m6
	HL4SfR5L3hS1MxRX0XUIILwMMz5kP0B8/ao7Qbnhh6+xbDJppStrVDS/2ZjrOAd4z+ApDuQjdCPA5
	gUx2HM//g8jla6MVtZ9bPOAPHJ3Wja1Y4q29Th4peyPTzLKH+VQexsZI92Ri3qbCr5NgsHLjU5ypn
	V6d7M3TbYCGNIVrSvUMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkFlQ-000H7m-Fh; Tue, 09 Nov 2021 01:17:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkFYA-000C1E-AY
 for ath11k@lists.infradead.org; Tue, 09 Nov 2021 01:03:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF5D5619E9;
 Tue,  9 Nov 2021 01:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636419825;
 bh=taL6sC6kBQ0kKIFnBN+DUqd0qu3vrvgE0qU8fkPqiAo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E86Q6Q2/qa69RyGG6/x8KUJ74z1v2IgdqjOb464r0WUyps4dyuxsgxP2pMCzxqRYZ
 baFTLFuArMelYAFuCMG4Ptp6WJTXyBhPXwBLsdWo4uf50uFqeQ0Y3EXhXSFvB7cMPi
 m/1mYizYq9gw64biWScYhVGgexwdE78Kvzq1xF0q+EOyfuvU6JmV6YPFSvqr9WOXyG
 SfbwRVlNNVyEB3OvGh8IZ3tZoG4jW+xANUqZaUg+1MN2KvWQNJmxfZH7o5Ng55e/ae
 wODPVS6+PtkxEh/IwDxGWf1DkhA5o5Z4bEhso8ZD1SgtZvovHJR7oNVVCXh4g3oWMk
 P1yvF9xG/4GpQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Seevalamuthu Mariappan <seevalam@codeaurora.org>,
 Ritesh Singh <ritesi@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>,
 Kalle Valo <kvalo@codeaurora.org>, Sasha Levin <sashal@kernel.org>,
 davem@davemloft.net, kuba@kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 016/101] ath11k: Align bss_chan_info structure
 with firmware
Date: Mon,  8 Nov 2021 12:47:06 -0500
Message-Id: <20211108174832.1189312-16-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108174832.1189312-1-sashal@kernel.org>
References: <20211108174832.1189312-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_170346_437096_8D7319B0 
X-CRM114-Status: GOOD (  10.45  )
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

From: Seevalamuthu Mariappan <seevalam@codeaurora.org>

[ Upstream commit feab5bb8f1d4621025dceae7eef62d5f92de34ac ]

pdev_id in structure 'wmi_pdev_bss_chan_info_event' is wrongly placed
at the beginning. This causes invalid values in survey dump. Hence, align
the structure with the firmware.

Note: The firmware releases follow this order since the feature was
implemented. Also, it is not changing across the branches including
QCA6390.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01228-QCAHKSWPL_SILICONZ-1

Signed-off-by: Ritesh Singh <ritesi@codeaurora.org>
Signed-off-by: Seevalamuthu Mariappan <seevalam@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Link: https://lore.kernel.org/r/20210720214922.118078-3-jouni@codeaurora.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 1 +
 drivers/net/wireless/ath/ath11k/wmi.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index eca86225a3413..fca71e00123d9 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1333,6 +1333,7 @@ int ath11k_wmi_pdev_bss_chan_info_request(struct ath11k *ar,
 				     WMI_TAG_PDEV_BSS_CHAN_INFO_REQUEST) |
 			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
 	cmd->req_type = type;
+	cmd->pdev_id = ar->pdev->pdev_id;
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
 		   "WMI bss chan info req type %d\n", type);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 5a32ba0eb4f57..c47adaab7918b 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -2935,6 +2935,7 @@ struct wmi_pdev_bss_chan_info_req_cmd {
 	u32 tlv_header;
 	/* ref wmi_bss_chan_info_req_type */
 	u32 req_type;
+	u32 pdev_id;
 } __packed;
 
 struct wmi_ap_ps_peer_cmd {
@@ -4028,7 +4029,6 @@ struct wmi_vdev_stopped_event {
 } __packed;
 
 struct wmi_pdev_bss_chan_info_event {
-	u32 pdev_id;
 	u32 freq;	/* Units in MHz */
 	u32 noise_floor;	/* units are dBm */
 	/* rx clear - how often the channel was unused */
@@ -4046,6 +4046,7 @@ struct wmi_pdev_bss_chan_info_event {
 	/*rx_cycle cnt for my bss in 64bits format */
 	u32 rx_bss_cycle_count_low;
 	u32 rx_bss_cycle_count_high;
+	u32 pdev_id;
 } __packed;
 
 #define WMI_VDEV_INSTALL_KEY_COMPL_STATUS_SUCCESS 0
-- 
2.33.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
