Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335CC606A31A
	for <ath11k@archiver.kernel.org>; Wed, 28 Oct 2026 05:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KLyqso3z;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mZbBC/IH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DVH/EBIsl3QhnmFUaGRlJxxmZd3EfkXqMccMLT5dSoY=; b=KLyqso3zYYwnJC
	uHbz10Lw2QO+xp3c87lNlLqUzxtEIue59570Gm7U2+32/sEytc1tOmLiB+jFO4iDygibcs0oGSMSK
	gvJGAjedxUa4vk8/yj6TSu7B3LweJPHSbTxIJ8aErvLmYP0rzZhWSPaR6ZyzTIYxOTxt4Z+cSlPun
	9lBuqWrA+v6+CUuNxUK1Skpc/VFDPTGGsT02IB8zT6fafdwvetY4GQ6yBbsoZCrQykC3mihBepGxH
	sjhVhwDu4WYQYte2nwNNQ8W4oRt4WgU+yuR5pz+4FPzbZSdD62Zw3iHoJpnfX3oRIWkxFL596chh2
	ETDkrgcfZmTnroV3G99A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvyK-00000006M7p-3NvT;
	Wed, 28 Oct 2026 05:13:12 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvyH-00000006M4V-0OVY
	for ath11k@lists.infradead.org;
	Wed, 28 Oct 2026 05:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=DV
	H/EBIsl3QhnmFUaGRlJxxmZd3EfkXqMccMLT5dSoY=; b=mZbBC/IH74kqwctlh6
	tW+zKItZIdn0iYkGsf7wyXLdVPFqEQ+Ge77rk9ilPO3Wj+gpdzkRbjtyUIIZBCCv
	2eK6iALrcLCS1pNq9s9yToZhTLj7JBg+r4IwG4rlkKcmR3q6E8hr/zo1BGTa5ECV
	cbBig3wHV5iha5wVNZ1WSnU8Y=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3_3lYhOFqTkVqDQ--.14113S3;
	Wed, 28 Oct 2026 13:12:57 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 1/5] wifi: ath11k: validate DMA buffer release TLV lengths
Date: Wed, 28 Oct 2026 13:12:50 +0800
Message-Id: <20261028051254.147628-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028051254.147628-1-yaojiale02@163.com>
References: <20261028051254.147628-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_3lYhOFqTkVqDQ--.14113S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF4UJr47Wr4xur1UWF17Wrg_yoW8Gry7pF
	W8Ww17Cw1xWr4xJw1fAa1xZayYkanYgrW3KFWrt34fuF18CF15JFWYqFWYvFyrtr18tFyS
	vF4jgr15AF1qy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j5R6wUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRpKhGrhhFreowAA3x
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_221310_029284_16B19E96 
X-CRM114-Status: UNSURE (   8.74  )
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

The DMA buffer release parser counts nested entry and metadata TLVs, but
does not ensure their payloads cover the structures later indexed by
the direct buffer ring handler.  Short firmware TLVs can therefore lead
to out-of-bounds reads when the arrays are consumed.

Add minimum-length policies for both nested TLV types.

Fixes: 9d11b7bff950 ("ath11k: add support for spectral scan")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 08fd6795ed9e..0d4481a09501 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -161,6 +161,10 @@ static const struct wmi_tlv_policy wmi_tlv_policies[] = {
 		.min_len = sizeof(struct wmi_p2p_noa_event) },
 	[WMI_TAG_PDEV_CSA_SWITCH_COUNT_STATUS_EVENT] = {
 		.min_len = sizeof(struct wmi_pdev_csa_switch_ev) },
+	[WMI_TAG_DMA_BUF_RELEASE_ENTRY] = {
+		.min_len = sizeof(struct wmi_dma_buf_release_entry) - TLV_HDR_SIZE },
+	[WMI_TAG_DMA_BUF_RELEASE_SPECTRAL_META_DATA] = {
+		.min_len = sizeof(struct wmi_dma_buf_release_meta_data) - TLV_HDR_SIZE },
 };
 
 #define PRIMAP(_hw_mode_) \
-- 
2.34.1


