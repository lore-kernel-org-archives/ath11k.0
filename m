Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B37C433F5
	for <ath11k@archiver.kernel.org>; Mon, 30 May 2022 14:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X5t+U8I7mgnRPtoMi0YJUYkUWps3xE/HTF+bwfRlqyc=; b=LA7LVnDlP4T2NX
	z7VXd0rQYCpJwyjQarKHKVQY0yQbCtqGVWIvGxvOMgDDGhGHMOQy4Hgn/lX42qBS278kunwstGb3Z
	7srkN6Mjf5vhLecmeXCP80faeMAl2YiQa+SUoUvY2Kj9GtiNUFY3m4Px2ns34BeT3rRMts5jvTnTR
	TadlG+xhOIw1gz9YAWhrVYVY9+FsmgiKCfTKjWRBr2zMe9b5DL6BpmSs1GQ97j4AmWMgQkavlcJvR
	4Tc5XJ7B0o342fBgBSTGZFd6B23TqpvaEq7Zk1EXkW3es5S/QA7S5NaTih0Osn0vPY6CNxVNx6h0s
	k5qUyMWuytI3YIPyDqIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvgbi-007K5P-Tg; Mon, 30 May 2022 14:42:58 +0000
Received: from ns.iliad.fr ([212.27.33.1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvgLc-007CFI-Gt
	for ath11k@lists.infradead.org; Mon, 30 May 2022 14:26:23 +0000
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id 440C42008F;
	Mon, 30 May 2022 16:19:06 +0200 (CEST)
Received: from sakura (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id 3B13620054;
	Mon, 30 May 2022 16:19:06 +0200 (CEST)
Message-ID: <c1c3472427080716c69ad99ebe5d1954db44f03f.camel@freebox.fr>
Subject: Re: [PATCH v7 4/9] ath11k: Add register access logic for WCN6750
From: Maxime Bizon <mbizon@freebox.fr>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>, 
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 robh@kernel.org,  mka@chromium.org
Date: Mon, 30 May 2022 16:19:06 +0200
In-Reply-To: <c57e8791-b6ce-0752-52ca-a1cb938187d7@quicinc.com>
References: <20220429170502.20080-1-quic_mpubbise@quicinc.com>
	 <20220429170502.20080-5-quic_mpubbise@quicinc.com>
	 <bd6d97a4cc6665d0ee632444f75e3480160387ec.camel@freebox.fr>
	 <c57e8791-b6ce-0752-52ca-a1cb938187d7@quicinc.com>
Organization: Freebox
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Mon May 30 16:19:06 2022 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_072620_762031_8722E5A6 
X-CRM114-Status: GOOD (  11.47  )
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
Reply-To: mbizon@freebox.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


On Thu, 2022-05-26 at 09:12 +0530, Manikanta Pubbisetty wrote:

> 
> Thanks for letting me know about this, IIRC I don't remember 
> encountering this problem in my testing. Just for my understanding,
> have you reverted this change and confirmed that these errors go away
> ?

I first confirmed the register location was indeed incorrect, then I
fixed it like this:

--- a/drivers/net/wireless/ath/ath11k/pcic.c
+++ b/drivers/net/wireless/ath/ath11k/pcic.c
@@ -143,7 +143,7 @@ EXPORT_SYMBOL(ath11k_pcic_init_msi_config);
 static inline u32 ath11k_pcic_get_window_start(struct ath11k_base *ab,
 					       u32 offset)
 {
-	u32 window_start = 0;
+	u32 window_start = ATH11K_PCI_WINDOW_START;
 
 	if ((offset ^ HAL_SEQ_WCSS_UMAC_OFFSET) < ATH11K_PCI_WINDOW_RANGE_MASK)
 		window_start = ab->hw_params.dp_window_idx * ATH11K_PCI_WINDOW_START;
@@ -170,8 +170,12 @@ void ath11k_pcic_write32(struct ath11k_base *ab, u32 offset, u32 value)
 		iowrite32(value, ab->mem  + offset);
 	} else if (ab->hw_params.static_window_map) {
 		window_start = ath11k_pcic_get_window_start(ab, offset);
-		iowrite32(value, ab->mem + window_start +
-			  (offset & ATH11K_PCI_WINDOW_RANGE_MASK));
+		if (window_start == ATH11K_PCI_WINDOW_START &&
+                    ab->pci.ops->window_write32)
+			ab->pci.ops->window_write32(ab, offset, value);
+		else
+			iowrite32(value, ab->mem + window_start +
+				  (offset & ATH11K_PCI_WINDOW_RANGE_MASK));
 	} else if (ab->pci.ops->window_write32) {
 		ab->pci.ops->window_write32(ab, offset, value);
 	}
@@ -200,8 +204,12 @@ u32 ath11k_pcic_read32(struct ath11k_base *ab, u32 offset)
 		val = ioread32(ab->mem + offset);
 	} else if (ab->hw_params.static_window_map) {
 		window_start = ath11k_pcic_get_window_start(ab, offset);
-		val = ioread32(ab->mem + window_start +
-			       (offset & ATH11K_PCI_WINDOW_RANGE_MASK));
+		if (window_start == ATH11K_PCI_WINDOW_START &&
+		    ab->pci.ops->window_read32)
+			val = ab->pci.ops->window_read32(ab, offset);
+		else
+			val = ioread32(ab->mem + window_start +
+				       (offset & ATH11K_PCI_WINDOW_RANGE_MASK));
 	} else if (ab->pci.ops->window_read32) {
 		val = ab->pci.ops->window_read32(ab, offset);
 	}

-- 
Maxime




-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
