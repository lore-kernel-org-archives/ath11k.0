Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2ECC369D1
	for <ath11k@archiver.kernel.org>; Fri, 25 Apr 2025 05:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o3l6CrpNH86FpEPGZLgURyPz2oQxBJvhawZgSLwDJCc=; b=gHqnKtmkME9vd/bENRA3gx5wdE
	P1cmXE6b3d+Voz9PdeW10LNizaoXUXNyJQbdSzSSMbkDAoZmcoC/MWSk5kIfkvJtVrc9DBA2gAHRk
	mWGus8JHEQZnTIFdQsgV3Q/4VTPEg6Jf5OAcHlepLXpqI/vjFbEUYBvETztwCctYeIM2ubZtcbJbW
	Qj/Lz2Guu/6/MvJzaycji3RkmWC64OW7nYjGYVvTus2w3Vm0P2Eu6j8PgLUPFZlQoCxtXEA0iTTr4
	2y0nIq95ZmZwciy+hPSknc0K/O5FyK+bKqIu8QwP4GjpF+bAqpEvsN34DYxiFc3JEUiCja9JFlaRC
	Rm7jA5ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Bz3-0000000G1Gb-2hqP;
	Fri, 25 Apr 2025 05:52:21 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Bz0-0000000G1Ft-3Y03
	for ath11k@lists.infradead.org;
	Fri, 25 Apr 2025 05:52:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745560321; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KTXucKr5RR5xKXlq5M9P1wpXubg0IMsyCKYkbc0rfeizZxRx7+ZM6YM1Y3rTFVVH61Pzs6TjAw8if4p5nnj6Idafu3Rej+A3DGMIFruYjKhjr4AIszaM4opYEhwZ5/9I4Ai3M6erPoYR6qDU56WfkwsrH8rc2bfnjzKPXVQ57DI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745560321; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=o3l6CrpNH86FpEPGZLgURyPz2oQxBJvhawZgSLwDJCc=; 
	b=jf3V+CtLYmdqYnRaCNtQLVvtEBZnB7SWOLEELf/Xj4sZ/7foKnoCukMIQV4CP6if+a3u1K8Z0KN4khA7RqPO2XqsxOWGFCM/QmW73e89Lspq/rsLc1cHWc1xMCxDXcaQ8Y312DyJglhqZjJwf6TsSn5M8ozJXBQTdFFZqpX3YI4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745560321;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=o3l6CrpNH86FpEPGZLgURyPz2oQxBJvhawZgSLwDJCc=;
	b=h66zxItYgoEDNK8fmWa7AAeR5XBFejpRlw6GzbnP4tO9vffO5W9p6Yu4slTvee4U
	70JGTZYuQVOEfRJm6muNYraiz0CjCiIHMZmuDP+IrmLOxPKXJxIHegFpMPU8BEzE0+X
	vJc1sSOPg96p5oKSyaxg1rnzKs743t8x6nNKrU0w=
Received: by mx.zohomail.com with SMTPS id 1745560318274237.55482610129525;
	Thu, 24 Apr 2025 22:51:58 -0700 (PDT)
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
To: quic_bqiang@quicinc.com,
	jeff.johnson@oss.qualcomm.com,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	kernel@collabora.com,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] wifi: ath11k: Fix MHI target memory reuse logic
Date: Fri, 25 Apr 2025 10:51:40 +0500
Message-ID: <20250425055141.2041712-1-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_225218_945741_4E5D51C8 
X-CRM114-Status: GOOD (  12.52  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Firmware requests 2 segments at first. The first segment is of 6799360
whose allocation fails due to dma remapping not available. The success
is returned to firmware. Then firmware asks for 22 smaller segments
instead of 2 big ones. Those get allocated successfully. At suspend/
hibernation time, these segments aren't freed as they will be reused
by firmware after resuming.

After resuming, the firmware asks for the 2 segments again with the
first segment of 6799360 size. Since chunk->vaddr is not NULL, the
type and size are compared with the previous type and size to know if
it can be reused or not. Unfortunately, it is detected that it cannot
be reused and this first smaller segment is freed. Then we continue to
allocate 6799360 size memory which fails and ath11k_qmi_free_target_mem_chunk()
is called which frees the second smaller segment as well. Later success
is returned to firmware which asks for 22 smaller segments again. But
as we had freed 2 segments already, we'll allocate the first 2 new
smaller segments again and reuse the remaining 20. Hence 20 small
segments are being reused instead of 22.

Add skip logic when vaddr is set, but size/type don't match. Use the
same skip and success logic as used when dma_alloc_coherent() fails
without freeing the memory area. The following error are being fixed at
resume:

	kernel: ath11k_pci 0000:03:00.0: failed to allocate dma memory for qmi (524288 B type 1)
	ath11k_pci 0000:03:00.0: failed to allocate qmi target memory: -22

Those failures aren't because of the bigger chunk allocation failure as
they are skipped. Rather these failures are because of smaller chunk
allocation failures. This patch fixes freeing and allocation of 2 smaller
chunks.

Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6

Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
Changes since v1:
- Update description

Changes since v2:
- Update description
---
 drivers/net/wireless/ath/ath11k/qmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 47b9d4126d3a9..2782f4723e413 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1993,6 +1993,15 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
 			    chunk->prev_size == chunk->size)
 				continue;
 
+			if (ab->qmi.mem_seg_count <= ATH11K_QMI_FW_MEM_REQ_SEGMENT_CNT) {
+				ath11k_dbg(ab, ATH11K_DBG_QMI,
+					   "size/type mismatch (current %d %u) (prev %d %u), try later with small size\n",
+					    chunk->size, chunk->type,
+					    chunk->prev_size, chunk->prev_type);
+				ab->qmi.target_mem_delayed = true;
+				return 0;
+			}
+
 			/* cannot reuse the existing chunk */
 			dma_free_coherent(ab->dev, chunk->prev_size,
 					  chunk->vaddr, chunk->paddr);
-- 
2.43.0


