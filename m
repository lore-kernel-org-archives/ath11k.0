Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51846606A32E
	for <ath11k@archiver.kernel.org>; Sat, 24 Oct 2026 21:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1TyGJlOZ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cBjrieTi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Lt9gxDPHexxR60rVzHoiJ3UBKdCPi/8/Alm7yUpMUCY=; b=1TyGJlOZAMYAeyxiM481/5aJWg
	DlUpEjZCRh464PJ5Xlra5SFb58s9e/zkQjaHGhOD47YEMLpnU8tDO1jVeJ8F4Otgjj0t9oMrC3bFe
	+OakXSUJf3JV65NwTvcA5b5F+TffjE/cOWkSkw6TMo/Lvabv3SGCjUxHaKN6fU4BhHtBHyQ3p7vsY
	xRFoHOIWDib9eMXT9bNOWOFkvN7exAt8GfppZ2NQlX1EHP0r+0mf2jInf8YmB8pTfEn8+a5WWHHW0
	o1JrBugytNeKzfhuSNDH1SSnjmzcqNg4nYEtxtBVoOsa/+6UOR8wLEA6nSW+FEEI2ybyYSJmHaCKA
	ThLWH2/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKjKN-00000000YLc-2U1W;
	Sat, 24 Oct 2026 21:30:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKjKL-00000000YLK-2UWe
	for ath11k@lists.infradead.org;
	Sat, 24 Oct 2026 21:30:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6AA96601DB;
	Sat, 24 Oct 2026 21:30:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792877456;
	b=zwtIa4D6h6QI/JxsmRDrqcL+2cu8V/zWIfLKTQQ6oNyldniectGilWxMNKP/GB439aws
	 NIEDBsb2wUm6NpmUu+ZDfWuwyub8b3HMU/XKQmZdvYHbJ1ObGTi9IzJono/FreSFe1S9U
	 p38/vc57rG0fX40/O1e+URzgTzLyu8kBq/D8dxK0GpXd+eapBFrITdTs5SR5R4uTJN1Bm
	 jx9YVudVJkdL874PhFUOnEReSpEJqwOwTcxm0lKs/6fLNdKbt7cn0dfJxVZlzNwfC2UWl
	 +r8uY3+d0qVqp0Ww0VOGfYrLUns+FwMI1/VBUHO8lg5Uz9f933roHpuscznAu0RDyhA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792877456;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Lt9gxDPHexxR60rVzHoiJ3UBKdCPi/8/Alm7yUpMUCY=;
	b=gVmukaNavuDiwbwIeKUhn8GZeUdKgDcaOqpsSj3oDNyiwQqZnFlKUcU/RjdGBrF3gNzl
	 cW9bRJCbY2srD0F37n6t/Ly56Ys0+JdY9SbrRapi/4cWQOrJ1H4e7UYvnF5TZVZfO6qmo
	 SGsSJZ51WTp5rXIa2dhw885KChpnPdPsjfPvg8u2B95piD5pSmHrWjkZBVwWttVcTPngb
	 KQRHqiaM48shPF0+uwrDj4kIuSF5v0hKsl2CYtgLihX2IhQBf/ZN9OPgZqXffazaqIU2Y
	 X5Bt6FLQA6+/2TwYWaK0BzRcowStHDhY2RfWlXrXO0EzCoKNdknW2p5GKhvs74tbolg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EB3611F01828;
	Sat, 24 Oct 2026 21:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792877456;
	bh=Lt9gxDPHexxR60rVzHoiJ3UBKdCPi/8/Alm7yUpMUCY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cBjrieTi30wKOOiSLz+pcXcZSZ0xcBgxk0xswlz9uU6xHsMKVhZwa0/QHi6PfCrIl
	 FP1ELE3jfqlPZoJK/R4+CURUf5y6e1mbczMUVIBr1FxgcP3OCoNKt6FgDOKhcMe6zD
	 +35YY72KaE0QyQiY7TGB++MZGHNERHY7bO5KZCPv46khbKsI7nVgX6KPTiwb3xu5Im
	 hCXavziSV5Ou45Ue9+hwKPO4bSKvTT03wslNAMC6kEL36VxEh1JAnU7dDLbvYWNuLD
	 SydEwC1XbFYn2LxB1tdrsvvbUCLg11Xj4RJQCwaFcc+Dz8JXPIj8eD0kfAiYldxi4z
	 QRGWVfw7NvwPQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 60D17448BD;
	Sat, 24 Oct 2026 21:30:54 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Sat, 24 Oct 2026 16:30:55 -0500
Subject: [PATCH ath-next 2/2] wifi: ath11k: don't take a monitor PPDU ID of
 0 for no change
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261024-ath11k-monitor-buffers-v1-2-ff155feca2f6@gmail.com>
References: <20261024-ath11k-monitor-buffers-v1-0-ff155feca2f6@gmail.com>
In-Reply-To: <20261024-ath11k-monitor-buffers-v1-0-ff155feca2f6@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792877453; l=2187;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=mWyrYADTKRJAnEcFm7KXNuli5w0DYkuiREx7rbQbq5M=;
 b=rNMjczzUXb7VnePkgWQlGNDVjyS/uUQGAAxfonLR0tVE0T+VvDwjw6oitt9CT3bOQhzGyeDRy
 jOhe4GllrKFCkR6gg6ylcqv2nf3JaafrQteIhEFlZ8Vwtqx6WYI0g4n
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christopher Griffin <christophergriffin05@gmail.com>

ath11k_dp_rx_mon_comp_ppduid() returns the PPDU ID it moved *ppdu_id
to, and ath11k_dp_rx_mon_mpdu_pop() takes a return of 0 for "no
change". When the destination ring's PPDU ID wraps to 0, it moves
*ppdu_id to 0 and returns 0, so mpdu_pop goes on and chains the MPDU.
The caller, ath11k_dp_rx_mon_dest_process(), then sees its ppdu_id
changed and breaks out with that chain neither delivered nor freed.

On an IPQ8074 with a monitor interface on each radio this lost 37 MPDU
chains in 47 minutes (2.8 million MPDUs); with this change, none in 46
minutes at the same load (3.2 million).

Return whether the PPDU ID changed.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index f0bff6c16..64fc83ee5 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -4656,15 +4656,13 @@ static void ath11k_hal_rx_msdu_list_get(struct ath11k *ar,
 	*num_msdus = i;
 }
 
-static u32 ath11k_dp_rx_mon_comp_ppduid(u32 msdu_ppdu_id, u32 *ppdu_id,
-					u32 *rx_bufs_used)
+static bool ath11k_dp_rx_mon_comp_ppduid(u32 msdu_ppdu_id, u32 *ppdu_id,
+					 u32 *rx_bufs_used)
 {
-	u32 ret = 0;
-
 	if ((*ppdu_id < msdu_ppdu_id) &&
 	    ((msdu_ppdu_id - *ppdu_id) < DP_NOT_PPDU_ID_WRAP_AROUND)) {
 		*ppdu_id = msdu_ppdu_id;
-		ret = msdu_ppdu_id;
+		return true;
 	} else if ((*ppdu_id > msdu_ppdu_id) &&
 		((*ppdu_id - msdu_ppdu_id) > DP_NOT_PPDU_ID_WRAP_AROUND)) {
 		/* mon_dst is behind than mon_status
@@ -4672,9 +4670,9 @@ static u32 ath11k_dp_rx_mon_comp_ppduid(u32 msdu_ppdu_id, u32 *ppdu_id,
 		 */
 		*rx_bufs_used += 1;
 		*ppdu_id = msdu_ppdu_id;
-		ret = msdu_ppdu_id;
+		return true;
 	}
-	return ret;
+	return false;
 }
 
 static void ath11k_dp_mon_get_buf_len(struct hal_rx_msdu_desc_info *info,

-- 
2.43.0



