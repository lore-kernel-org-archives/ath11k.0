Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90820606A31D
	for <ath11k@archiver.kernel.org>; Wed, 28 Oct 2026 05:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KkxXTITE;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Ln/i3jtP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sh0jjqvJiEPcXO2T9p933jIcQss8YBNUV3WFM1iJF54=; b=KkxXTITEv90AY5
	pcut6T3KDn3gqq6dCprJN8jvJtxXKkkmxd9GLzv6Nsn8q9A9R6TkFr9qE/23GDM1FHWXjEFs4TGmk
	/I9l0QjzAQcG+RC2IdY08UEmbj+4QvpmE1Ods3Uq8sM2bWgL3iWMnXRFB1rqQuyiWQp0/r6kPIrYh
	Co+ETLaZzMfLbUMbvKlr7Q28J5nsqQ+2ptceXa0V7OCdo3ZxnqVkY5VPm/zYLMI+c/zBpbtnStmUl
	Ij0qXDQBzkFAkBTkYD/rjc3c1LTpPMXR1BWDtZkfe3wYFWz03GoxozwnZNgxQsYenV5sdiJ0SbggW
	WrFTsjpJ6lUOrlBw1iSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvyN-00000006MBL-133f;
	Wed, 28 Oct 2026 05:13:15 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvyK-00000006M5s-1fP8
	for ath11k@lists.infradead.org;
	Wed, 28 Oct 2026 05:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=sh
	0jjqvJiEPcXO2T9p933jIcQss8YBNUV3WFM1iJF54=; b=Ln/i3jtPT9Marz4A63
	bs8N4xcCltjaloN7wEutG0ekvQrEejmttz1gAEkPTdab4sQ+UwpQEs6S8dTJa8Mc
	287g6jX1ypbA5FG5muRhWIqApwVX+PbZtxbtAI2zTtlaaJz/80wRNqG92fNMhXPy
	NA11RVc9Q5X6LLmBCw9dRYzrQ=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3_3lYhOFqTkVqDQ--.14113S4;
	Wed, 28 Oct 2026 13:12:58 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Rajkumar Manoharan <rmanohar@codeaurora.org>,
	Sven Eckelmann <sven@narfation.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 2/5] wifi: ath11k: validate hardware mode capability TLVs
Date: Wed, 28 Oct 2026 13:12:51 +0800
Message-Id: <20261028051254.147628-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028051254.147628-1-yaojiale02@163.com>
References: <20261028051254.147628-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_3lYhOFqTkVqDQ--.14113S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7JF4xJFy3JF4xKrW7tFyDAwb_yoW8JrWDpF
	4xG3WUA348Jr47Jw1fAa1xZa45Kan5K34agFW7t34fuF18CF1rZFyYqFWYqFyrtF4UGFya
	qF4DtrW5GF98t3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jcCzZUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRpKhGrhhFretwAA3l
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_221312_908344_84619BFC 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The service-ready parser indexes hardware mode capability TLVs using the
full structure stride and reads their PHY maps without validating the
firmware-declared payload length.  A short TLV can therefore cause an
out-of-bounds read.

Add a minimum-length policy for hardware mode capability TLVs.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 0d4481a09501..8a73318704f3 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -165,6 +165,8 @@ static const struct wmi_tlv_policy wmi_tlv_policies[] = {
 		.min_len = sizeof(struct wmi_dma_buf_release_entry) - TLV_HDR_SIZE },
 	[WMI_TAG_DMA_BUF_RELEASE_SPECTRAL_META_DATA] = {
 		.min_len = sizeof(struct wmi_dma_buf_release_meta_data) - TLV_HDR_SIZE },
+	[WMI_TAG_HW_MODE_CAPABILITIES] = {
+		.min_len = sizeof(struct wmi_hw_mode_capabilities) - TLV_HDR_SIZE },
 };
 
 #define PRIMAP(_hw_mode_) \
-- 
2.34.1


