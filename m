Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F30606A330
	for <ath11k@archiver.kernel.org>; Sun,  8 Nov 2026 00:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L5KadHtq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Buuwer1t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=HWi1jiRSnRJfgQ0tDiZtUVXuEEGoRZ0gMq3cRtHXy3I=; b=L5KadHtqph754PoHoVUHB+PVAP
	zolTvHcGKtd79pxhRNQK0byF1cFP851v+tGSFi23nSLHkX6DkJEVwTWrsmGBX5c7mCDczoetKtK7l
	v6PMDdjthXRsicMkd+Vcv6x3vMbmvM1Q4fbZtt4tL6Uqu+K5Z5g25o05RTWml1oCHGEkljdRe/0Ok
	D5ITuEFCsUasubSzatCa5KluXZc1/tbw4adyPdeAM05G2bWnJ2tb7Pq0kN9zQcTlPw1aGdQiLd78D
	hfTvnioLqjBUG/tbCF98LAN96JQ/UtMQRPOjKghBYu93jOz4y390wAa574dXMPZu30LCDQqxvnMkX
	myxhDgdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPqMw-0000000FWaf-0KOe;
	Sun, 08 Nov 2026 00:02:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPqMu-0000000FWaZ-37qe
	for ath11k@lists.infradead.org;
	Sun, 08 Nov 2026 00:02:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2643441713;
	Sun,  8 Nov 2026 00:02:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794096163;
	b=Eyg/kFTiQvFa73P0GZzV4w75sNEwlXyBdZ4cQQKLcIdmnCiTV9HD2qHocU+SNh3A5kks
	 Io2Hav3rTSHAY3OFrZTNz3ms+C7fXoAKNpqKY60zFBT5FyUkazO3SuSyksgUvvLxwFftz
	 w/bOWnujUZDZNncBkXPgy9V25CZmBL5CCqpiwllfBb5litlBo8LY78GYOii/ay5N9wJk1
	 hXhEvwFwQSrPN7laz31ZpDFdXSVRd6h45aRgMg9GQfDsf+xdfaBO3FD3AoP8oVEuIUhzz
	 FF8Ot0pFSloRpwcRcQ3jlB8lFnJsOyfzv+9Hd2fI1Dh6kw2MSEp5lducvJDAA6JdvKg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794096163;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HWi1jiRSnRJfgQ0tDiZtUVXuEEGoRZ0gMq3cRtHXy3I=;
	b=TkZ8QgYvIMq3tJi49QQbVec0EtzNh9OFutJC7558sX2l5KqreSP0W0gEwKqQS5ZcPxEk
	 /Vm6GoGlI0Q3Y6IRBVi0qI6BvD9O9oaLae1sAlxhc5KHBg3cn93UT1k7GjkU7R1mbTfos
	 q8SoBUzcY6kFSszWJ4aTzlDiqKrW/dau8BPL/DRsZ9Z3QcVtFWUts7BTwiciLmr6Bkd00
	 NVjckQ6gDpoMJwXJnVdEVUXGBtJ83rRjR9SdePqYQjvYix7VIMxOrqOjEmuKDMXPeUNiS
	 9XhF1/wb74QuiVBudu1SulL21xhSiDMXaFktZ3mRKXLwdwkuumUdFn5zyx3IpJH9EPw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6BF511F0089F;
	Sun,  8 Nov 2026 00:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794096163;
	bh=HWi1jiRSnRJfgQ0tDiZtUVXuEEGoRZ0gMq3cRtHXy3I=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Buuwer1tx3sN+orGE+9oCNn6Jr7TdkEa3T7EdZOL1ao5yTFT2iSPE6OhJKrRxrVlr
	 Tg7ArKNQ8nwVwHiwKI9tc/khfuhYJ3OPBYMQIHOgWgmJUBXE0hEBmAOOb4ccTqy8RT
	 riQoY/EmcqdhUZLJzz5fwvxjYFf1jSuV4z43Qd2IQT5bguwaZ6irusgsf6X3FYHBsh
	 2wSZ241zNSkzp7IPt+aZysGH4B2m8RivSn6meZVAGZxAPgXUiuPSxz/iaD4ubbt2sv
	 f5MMKsNb+FbbWTQ/6WlmMpMcqrVput0plOZEdSIIMiTpRsaeyGFpLekVPRxjXf5Aqe
	 gRe48AnnFRDBQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BE9F547D5F;
	Sun,  8 Nov 2026 00:02:41 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 18:02:42 -0600
Subject: [PATCH] wifi: ath11k: serialize updates of the AHB CE interrupt
 enable registers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-ath11k-ahb-ce-ie-lock-v1-1-4bf2cc474c6e@gmail.com>
X-B4-Tracking: v=1; b=H4sIACG872oC/yXM0QqDMAyF4VeRXC/Q1KGwV5FdpF202YZK68ZAf
 PdFvfw4nH+FIlmlwK1aIctXi06jgS4VxMTjIKgPM3jnGyLXIi+J6IWcAkYbBd9TNNZ94Ma3jus
 r2HfO0uvv6Hb30+UTnhKXPQbb9gd1MqoueQAAAA==
X-Change-ID: 20261107-ath11k-ahb-ce-ie-lock-a3fba6270a34
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794096161; l=4945;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=f55mKIhjRDjKmv7VLGI3KY4Ua1+TgC1Bejx8DYIGEbo=;
 b=emDSlfFZPqqTPIkbaTAcKUKXKl48pgHtm4foTh6rZx1GgJzoEmTMvbKEQrP1qjqLatIO3wxGE
 H/hiyU3Vm9EB2vD/ugAwAmataheTx1Gk3WMY+0EDTfKnPfbIBLUI6x8
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Reply-To: christophergriffin05@gmail.com
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christopher Griffin <christophergriffin05@gmail.com>

ath11k_ahb_ce_irq_enable() and ath11k_ahb_ce_irq_disable() set or clear
a CE's bits in the CE interrupt enable registers with a read-modify-
write. All CEs share these registers, and the updates run without a
lock from each CE's interrupt handler (disable) and tasklet (enable).

While all CE interrupts are handled on one CPU, this does no harm: a
handler that runs in the middle of a tasklet's update only clears a
bit, and the tasklet's write can at worst enable that CE again early.
Once the CE interrupts are spread over CPUs, by irqbalance or by hand,
two CPUs can update a register at the same time and one CE's enable
bit is lost. That CE never interrupts again.

On an IPQ8074 AP, moving the CE1 interrupt to another CPU under load
made WMI commands time out 14 seconds later ("failed to request fw
stats: -110"). The firmware then asserted in hif_ce.c, and after each
recovery the same happened again; the third recovery ended in a kernel
oops.

Take a spinlock around the updates.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

The change, this message and the test were written with Claude, an AI
coding assistant.

Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
---
Found on an Arista C-360 (IPQ8074) while spreading interrupts over the
CPUs for a throughput test. With the change, the same CE1 interrupt
move ran under two-radio load for several minutes (78k CE1 interrupts
on CPU3) without a WMI timeout; without it the firmware asserted within
a minute. irqbalance would hit the same race.
---
 drivers/net/wireless/ath/ath11k/ahb.c | 9 +++++++++
 drivers/net/wireless/ath/ath11k/ahb.h | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 27d01411b6e9c..6d600c787596a 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -271,15 +271,18 @@ static void ath11k_ahb_clearbit32(struct ath11k_base *ab, u8 bit, u32 offset)
 
 static void ath11k_ahb_ce_irq_enable(struct ath11k_base *ab, u16 ce_id)
 {
+	struct ath11k_ahb *ab_ahb = ath11k_ahb_priv(ab);
 	const struct ce_attr *ce_attr;
 	const struct ce_ie_addr *ce_ie_addr = ab->hw_params.ce_ie_addr;
 	u32 ie1_reg_addr, ie2_reg_addr, ie3_reg_addr;
+	unsigned long flags;
 
 	ie1_reg_addr = ce_ie_addr->ie1_reg_addr + ATH11K_CE_OFFSET(ab);
 	ie2_reg_addr = ce_ie_addr->ie2_reg_addr + ATH11K_CE_OFFSET(ab);
 	ie3_reg_addr = ce_ie_addr->ie3_reg_addr + ATH11K_CE_OFFSET(ab);
 
 	ce_attr = &ab->hw_params.host_ce_config[ce_id];
+	spin_lock_irqsave(&ab_ahb->ce_ie_lock, flags);
 	if (ce_attr->src_nentries)
 		ath11k_ahb_setbit32(ab, ce_id, ie1_reg_addr);
 
@@ -288,19 +291,23 @@ static void ath11k_ahb_ce_irq_enable(struct ath11k_base *ab, u16 ce_id)
 		ath11k_ahb_setbit32(ab, ce_id + CE_HOST_IE_3_SHIFT,
 				    ie3_reg_addr);
 	}
+	spin_unlock_irqrestore(&ab_ahb->ce_ie_lock, flags);
 }
 
 static void ath11k_ahb_ce_irq_disable(struct ath11k_base *ab, u16 ce_id)
 {
+	struct ath11k_ahb *ab_ahb = ath11k_ahb_priv(ab);
 	const struct ce_attr *ce_attr;
 	const struct ce_ie_addr *ce_ie_addr = ab->hw_params.ce_ie_addr;
 	u32 ie1_reg_addr, ie2_reg_addr, ie3_reg_addr;
+	unsigned long flags;
 
 	ie1_reg_addr = ce_ie_addr->ie1_reg_addr + ATH11K_CE_OFFSET(ab);
 	ie2_reg_addr = ce_ie_addr->ie2_reg_addr + ATH11K_CE_OFFSET(ab);
 	ie3_reg_addr = ce_ie_addr->ie3_reg_addr + ATH11K_CE_OFFSET(ab);
 
 	ce_attr = &ab->hw_params.host_ce_config[ce_id];
+	spin_lock_irqsave(&ab_ahb->ce_ie_lock, flags);
 	if (ce_attr->src_nentries)
 		ath11k_ahb_clearbit32(ab, ce_id, ie1_reg_addr);
 
@@ -309,6 +316,7 @@ static void ath11k_ahb_ce_irq_disable(struct ath11k_base *ab, u16 ce_id)
 		ath11k_ahb_clearbit32(ab, ce_id + CE_HOST_IE_3_SHIFT,
 				      ie3_reg_addr);
 	}
+	spin_unlock_irqrestore(&ab_ahb->ce_ie_lock, flags);
 }
 
 static void ath11k_ahb_sync_ce_irqs(struct ath11k_base *ab)
@@ -1183,6 +1191,7 @@ static int ath11k_ahb_probe(struct platform_device *pdev)
 	}
 
 	ab->hif.ops = hif_ops;
+	spin_lock_init(&ath11k_ahb_priv(ab)->ce_ie_lock);
 	ab->pdev = pdev;
 	ab->hw_rev = hw_rev;
 	ab->fw_mode = ATH11K_FIRMWARE_MODE_NORMAL;
diff --git a/drivers/net/wireless/ath/ath11k/ahb.h b/drivers/net/wireless/ath/ath11k/ahb.h
index 8c1eb1e8e6b13..91bd097ccb900 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.h
+++ b/drivers/net/wireless/ath/ath11k/ahb.h
@@ -23,6 +23,8 @@ struct ath11k_base;
 
 struct ath11k_ahb {
 	struct rproc *tgt_rproc;
+	/* protects the CE interrupt enable registers, shared by all CEs */
+	spinlock_t ce_ie_lock;
 	struct {
 		struct device *dev;
 		struct iommu_domain *iommu_domain;

---
base-commit: ad6bdd5f9030dbcf29a67f40ccdb3fa57afecff5
change-id: 20261107-ath11k-ahb-ce-ie-lock-a3fba6270a34

Best regards,
--  
Christopher Griffin <christophergriffin05@gmail.com>



