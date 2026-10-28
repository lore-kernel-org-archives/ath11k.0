Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C71606A31A
	for <ath11k@archiver.kernel.org>; Wed, 28 Oct 2026 05:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B1JDtF95;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pwDPu8yW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/wHSs0gLvrAt4F4FoIF3bDJZjHw1fnJYQTvBcgzYbZw=; b=B1JDtF95K8BP0+
	zoDNr37T6oJogM97LwmkGm4Z3Gt7lolHzftO9f3NWssZ5Hxz6xqrN+TEjrxksM/vbuiw9KfS9mbuH
	fQvj/okhv3cqgfeVCOCngIL4p6RK5IyNwqvI7aGu//k1fkKQoA1SqTd2B26/8pkqCfrBtGv1rwMql
	BDTnA7YCD2uxpz/5e9ffsVe7ivzRUn3lIrx7xF06QbbgaAhH3pbaecYZIw7OIDctCObVqxea3MKPi
	fdbX/+5KhUKbrwKjD2JlozdVj7zXgX1N5dKMcFLI7/wrCU2jDb303LN0/8YGmDnuuZIFIo1E9Ac7s
	zUctc8iLtaXJrsJtbYXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvyI-00000006M6D-24eo;
	Wed, 28 Oct 2026 05:13:10 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvyF-00000006M4X-0Zgk
	for ath11k@lists.infradead.org;
	Wed, 28 Oct 2026 05:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=/w
	HSs0gLvrAt4F4FoIF3bDJZjHw1fnJYQTvBcgzYbZw=; b=pwDPu8yWZg7ecDhl+r
	OmjVleK/AUHO3EyrvQJ8Wjb151RnBZtQwg9x6VrXN+W+9to0Z7rdnKel+IquA8o+
	Ly5Qxs+4Uza5gFqiRUSqvnaqtnsxlvsCb1wNtWqBeSP9eKe/x1jfSl6gpmg/2ZJh
	TbnkQmRHrmX+B2qcy09CYLnBk=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3_3lYhOFqTkVqDQ--.14113S5;
	Wed, 28 Oct 2026 13:12:59 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 3/5] wifi: ath11k: validate DMA ring capability TLVs
Date: Wed, 28 Oct 2026 13:12:52 +0800
Message-Id: <20261028051254.147628-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028051254.147628-1-yaojiale02@163.com>
References: <20261028051254.147628-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_3lYhOFqTkVqDQ--.14113S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7XFyUWFyDWw15WFyDAFWDurg_yoW8Jr43pF
	4Ig3W7C34rXr47Jw4fAa1xZa45Kan5t3ya9FWUJ34fuF4kCF1rZF90qFWYvFyrtF4UGF1a
	qFWqgrW5Ar90y3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jfR6wUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzhtKhGrhhFsXVAAA3M
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_221307_815165_0D759876 
X-CRM114-Status: UNSURE (   8.78  )
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

The service-ready parser counts DMA ring capability TLVs and later
indexes the firmware array using the full structure stride.  It does not
validate that each TLV payload covers that structure, so a short element
can cause out-of-bounds reads.

Add a minimum-length policy for DMA ring capability TLVs.

Fixes: bd6478559e27 ("ath11k: Add direct buffer ring support")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 8a73318704f3..c5c667828530 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -167,6 +167,8 @@ static const struct wmi_tlv_policy wmi_tlv_policies[] = {
 		.min_len = sizeof(struct wmi_dma_buf_release_meta_data) - TLV_HDR_SIZE },
 	[WMI_TAG_HW_MODE_CAPABILITIES] = {
 		.min_len = sizeof(struct wmi_hw_mode_capabilities) - TLV_HDR_SIZE },
+	[WMI_TAG_DMA_RING_CAPABILITIES] = {
+		.min_len = sizeof(struct wmi_dma_ring_capabilities) - TLV_HDR_SIZE },
 };
 
 #define PRIMAP(_hw_mode_) \
-- 
2.34.1


