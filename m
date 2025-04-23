Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D92C369CB
	for <ath11k@archiver.kernel.org>; Wed, 23 Apr 2025 07:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KDJP5Qn3UEiAJaZjjIrFJCVTT22Io4uHa0igS5slpnw=; b=fhJZvY89iL0gOQiywpqXlwX+YF
	93Kn7OjAiyIsr0VbTDRBO0v6U8Y6+guvwqdkYiyk/h92YHhes85eHZWcS+C3xm3ppu90IqwonpNpv
	0I2t5fUtgpf2Jg3Do9aBhwUc8kvRG7+A9zntI297Z9kScjQq3prws/Ly75uTXz0OlqvQ3EtGNtQkS
	lN+hy7lMI8qO9n5mBhEWc0axYdBzOSYyAecKIKaib63BIcpit+SKPI9ngmaDgHIr7evd1MLZTI1NZ
	1AYIClM8M/pfrMkgKdnMvDAQGg2BSKHhvgNrItNSHKxJTZYrR9XW/q8ba4Hbyp6CgwJeynU4lXM91
	BE7d0fIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UEh-00000009SYI-00mD;
	Wed, 23 Apr 2025 07:09:35 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7U5o-00000009Qw1-214V
	for ath11k@lists.infradead.org;
	Wed, 23 Apr 2025 07:00:25 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745391612; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TInrorSFPtqNW/fkRyR/3NODyVVQkunfMb+wsVeuS+8O4OprLJN8rbBgmSUfvjaVtij2+75gwYOAq/y628lOK4RaWCHGR/fMuD6UwLDI/R3ctvm8SVajWXGilIWGBQFiIJylJ9p9cqGMyi/hXTTPB1H1WFJiV7Muo7lv20OdccE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745391612; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KDJP5Qn3UEiAJaZjjIrFJCVTT22Io4uHa0igS5slpnw=; 
	b=VUxQ8obJB+bM2rMqFDOCko6eApE+LUpsaxEn+MwvCA9KChQjWOuW1hWV1xCC3J/9eK1F6mzXt052ekfPXN0FsfEWEpVIpJAm9gsWlkxNzrpanniQpSA/jWhGqm8mES0Pdziejblp0JVFw3pwowa32rKTfe2obkOCv3ywpq/fEZo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745391612;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=KDJP5Qn3UEiAJaZjjIrFJCVTT22Io4uHa0igS5slpnw=;
	b=EGgXWLfey4t/fkwrFOYfmB3Wz2zzYT2fr3wVe7Ya9/KBTOisXzIP7ZfkqeeahfF6
	NBffld8aJj0IH+DGfvsuiwwgPKd56NubRVVNASTH8i9Z/fGp8yAvuln/XD5TfZb3gn3
	XoLywY3xK5vCVQzdVap60A49Fb/bO74H6ReGdZS4=
Received: by mx.zohomail.com with SMTPS id 1745391609414832.9878950586883;
	Wed, 23 Apr 2025 00:00:09 -0700 (PDT)
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
To: quic_bqiang@quicinc.com,
	Jeff Johnson <jjohnson@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Anilkumar Kolli <quic_akolli@quicinc.com>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	kernel@collabora.com,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] wifi: ath11k: Fix memory reuse logic
Date: Wed, 23 Apr 2025 11:59:30 +0500
Message-ID: <20250423065931.4017574-1-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_000024_580948_655D77B3 
X-CRM114-Status: GOOD (  17.96  )
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

After resume the firmware asks for 2 segments again with first segment
of 6799360 and vaddr is not NULL. We compare the type and size with
previous type and size to know if it can be reused or not.
Unfortunately, we detect that it cannot be reuses and this first smaller
segment is freed. Then we continue to allocate 6799360 size memory from
dma which fails and we call ath11k_qmi_free_target_mem_chunk() which
frees the second smaller segment as well. Later success is returned to
firmware which asks for 22 smaller segments again. But as we had freed 2
segments already, we'll allocate the first 2 new smaller segments again
and reuse the remaining 20. Hence we aren't reusing the all 22 small
segments, but only 20.

This patch is correcting the skip logic when vaddr is set, but size/type
don't match. In this case, we should use the same skip and success logic
as used when dma_alloc_coherent fails without freeing the memory area.

We had got reports that memory allocation in this function failed at
resume [1] which made us debug why the reuse logic is wrong. Those
failures weren't because of the bigger chunk allocation failure as they
are skipped. Rather these failures were because of smaller chunk
allocation failures. This issue is in the kernel side as because of
memory pressure or fragmentation, the dma memory allocation fails. This
patch fixes freeing and allocation of 2 smaller chunks.

Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
[1] https://lore.kernel.org/all/b30bc7f6-845d-4f9d-967e-c04a2b5f13f5@collabora.com

Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
Changes since v1:
- Update description

Fixes: 5962f370ce41 ("ath11k: Reuse the available memory after firmware reload")
I think we should keep fixes tag as ^ claimed that its adding reuse
support. But it left a bug in reuse which we are fixing.

Feel free to add it or leave it as it is.
---
 drivers/net/wireless/ath/ath11k/qmi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 47b9d4126d3a9..3c26f4dcf5d29 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1990,8 +1990,16 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
 		 */
 		if (chunk->vaddr) {
 			if (chunk->prev_type == chunk->type &&
-			    chunk->prev_size == chunk->size)
+			    chunk->prev_size == chunk->size) {
 				continue;
+			} else if (ab->qmi.mem_seg_count <= ATH11K_QMI_FW_MEM_REQ_SEGMENT_CNT) {
+				ath11k_dbg(ab, ATH11K_DBG_QMI,
+					   "size/type mismatch (current %d %u) (prev %d %u), try later with small size\n",
+					    chunk->size, chunk->type,
+					    chunk->prev_size, chunk->prev_type);
+				ab->qmi.target_mem_delayed = true;
+				return 0;
+			}
 
 			/* cannot reuse the existing chunk */
 			dma_free_coherent(ab->dev, chunk->prev_size,
-- 
2.43.0


