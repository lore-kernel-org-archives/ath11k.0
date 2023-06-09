Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D91C7EE43
	for <ath11k@archiver.kernel.org>; Fri,  9 Jun 2023 14:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RCFwHt0TtCiyVgFr3EI/n8IJJkJBLIkQ7699ZGb4PFY=; b=w/ra89QSddkl83
	vTs70aUsCXDh3LfRfimB1v0MfxR3pvjka8T+Wapj/5KTSUiT38Xqd8uTw6YpFS0wroYmC5JKnw5Kv
	GBz8ah6dtM1SjXSQBNSu+0do1cQlZWCEYgDhUVrhC2DcBRWXHoTF8K2W876egsKS6i/HZao0eYm92
	l5hTmn7wTQSbj0umbduux8d3r8T8Ov6LemA907vu7eayUd228E8Ph/oNiOfgtysOy19aIGwRNeogm
	9oSzsMmQAxeA803AvLLWJKXVGhTBQbhayNExK7CDX0ghVEFY/8WNpR0i22hbobSXiO0boyUwVshy4
	H22oaOyRSo1xx8k5SqpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7d2o-00DFXB-21;
	Fri, 09 Jun 2023 14:24:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7d2k-00DFVC-2B
	for ath11k@lists.infradead.org;
	Fri, 09 Jun 2023 14:24:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3EC46612E3
	for <ath11k@lists.infradead.org>; Fri,  9 Jun 2023 14:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA99C433EF;
	Fri,  9 Jun 2023 14:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686320685;
	bh=jIN69rmyKd1i+FPpiYUgL+PYo8ShEjVnI6dEfceWgYE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jA+kUS/9jDAmdoDDrAwqDV9BG53cJ/gxwZYmrqnOE014Pd/FmEKq28gd4EHvS1vJ0
	 2mIh6hBbD/MDwIV08DEMwMdbJJOOATqFbQ1qjcF/fTakYtsjcvx6p37TukRg5x3MmO
	 JTusRy/JtJBS4ndvrOGcWia7kAxpuWbfnhOCFUDknJ6s5dI3a/FZmlnTn9PtHiM611
	 Q3KJ1q7kgh5/yda+mUsU39bR2A3xERCcc9Wv0rRsprjhgamb23AszLyCgHPhBG0GEr
	 xzhEet9Qa3yU1RyXRssf9Sy9FHKwdAp3YgOWC6UHbLU3fTAfMVppCRQLdOS4T4hWNb
	 ZQM8ontT/W80A==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 02/15] wifi: ath11k: print debug level in debug messages
Date: Fri,  9 Jun 2023 17:24:27 +0300
Message-Id: <20230609142440.24643-3-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230609142440.24643-1-kvalo@kernel.org>
References: <20230609142440.24643-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_072446_799414_37ADFE59 
X-CRM114-Status: GOOD (  13.10  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

To make it easier understand the context of a debug message print the debug
level before the actual message. An example:

[21867.231900] ath11k_pci 0000:06:00.0: wmi processed regulatory ext channel list

The tracepoint call is not modified, it's better to userspace print the debug
level if needed.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/debug.c |  2 +-
 drivers/net/wireless/ath/ath11k/debug.h | 42 +++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index 958d87429062..f5c8a34c8802 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -66,7 +66,7 @@ void __ath11k_dbg(struct ath11k_base *ab, enum ath11k_debug_mask mask,
 	vaf.va = &args;
 
 	if (ath11k_debug_mask & mask)
-		dev_printk(KERN_DEBUG, ab->dev, "%pV", &vaf);
+		dev_printk(KERN_DEBUG, ab->dev, "%s %pV", ath11k_dbg_str(mask), &vaf);
 
 	trace_ath11k_log_dbg(ab, mask, &vaf);
 
diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index 0a9418c36bf4..2dd84d8ed5a5 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -28,6 +28,48 @@ enum ath11k_debug_mask {
 	ATH11K_DBG_DP_RX	= 0x00004000,
 };
 
+static inline const char *ath11k_dbg_str(enum ath11k_debug_mask mask)
+{
+	switch (mask) {
+	case ATH11K_DBG_AHB:
+		return "ahb";
+	case ATH11K_DBG_WMI:
+		return "wmi";
+	case ATH11K_DBG_HTC:
+		return "htc";
+	case ATH11K_DBG_DP_HTT:
+		return "dp_htt";
+	case ATH11K_DBG_MAC:
+		return "mac";
+	case ATH11K_DBG_BOOT:
+		return "boot";
+	case ATH11K_DBG_QMI:
+		return "qmi";
+	case ATH11K_DBG_DATA:
+		return "data";
+	case ATH11K_DBG_MGMT:
+		return "mgmt";
+	case ATH11K_DBG_REG:
+		return "reg";
+	case ATH11K_DBG_TESTMODE:
+		return "testmode";
+	case ATH11k_DBG_HAL:
+		return "hal";
+	case ATH11K_DBG_PCI:
+		return "pci";
+	case ATH11K_DBG_DP_TX:
+		return "dp_tx";
+	case ATH11K_DBG_DP_RX:
+		return "dp_rx";
+
+	/* no default handler to allow compiler to check that the
+	 * enum is fully handled
+	 */
+	}
+
+	return "<?>";
+}
+
 __printf(2, 3) void ath11k_info(struct ath11k_base *ab, const char *fmt, ...);
 __printf(2, 3) void ath11k_err(struct ath11k_base *ab, const char *fmt, ...);
 __printf(2, 3) void ath11k_warn(struct ath11k_base *ab, const char *fmt, ...);
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
