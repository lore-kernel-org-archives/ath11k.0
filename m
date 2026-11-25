Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537FB606A321
	for <ath11k@archiver.kernel.org>; Wed, 25 Nov 2026 09:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KJi3POc7;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=Ds3KC7mw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3NO5y6ayBAJg4ntaAXlveYpYKcCNROKO20ivtZtEcH0=; b=KJi3POc7ircwegKYBtucNJyFwo
	DeGlhv2E4D09KUAwyzF8620rklOEwCtRGekgPhIQ6ty2nDFTDPVlXedNePE/iowP1+8RRGs2DJgxz
	rx3DUmz0WMJSfHuKYhAeNW2F33zUp1ZP55K58ZiwimUYW8X7PDAaSTn3E2jCZgxg8WnyOusigmiIR
	1mfEB83aosCIDlq+Y81gca3WHj+s8xX1AIs8nKnHDftneZF+p45aqpMt1HcOLyYOGEl+f5ULMhXZz
	O8RBsEMRR27V+kxtkjCgTHgsidMtA38kWa7f7I10L5RA31IGJvTeCJ4CE1kZ2aDqsJJ31XniHCvcO
	D3ksa+Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8uk-00000009D3p-47xj;
	Wed, 25 Nov 2026 09:03:43 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8uf-00000009D1w-1uMP
	for ath11k@lists.infradead.org;
	Wed, 25 Nov 2026 09:03:41 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 67B88801EC;
	Wed, 25 Nov 2026 10:03:34 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mexDO8_o3FpM; Wed, 25 Nov 2026 10:03:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1795597413; bh=LdIdjHEjBPym/Go2AUDixRle9Ee2BldDbNoa59zdqNs=;
	h=From:To:Cc:Subject:Date;
	b=Ds3KC7mwnAuzZAB5y2IW0QkqT0hT8ZrlPF9nW5L4rZNJ6EzpStfbQrm+6emmgsLaP
	 a6I2GkpLEPr92ZUfv9q1Frk4aL89fu9OcsW83JkwvmEzcjVjMCrina2pkgZn6INlTa
	 5wk2KhAq2IjcI1qvOX8f3sM1qtJspaNtR5sie/pmxydMRIyWtnX8vTdeLiRNrygvRu
	 7NC8cD2Mk+SpfsIdYadDu/FlTMsqPb58QET/fhNx5EuTds37PIqFHMxZYGBeOBJFRa
	 hFtkjE1u/ZU0trgcDkzaBelMUVXgjI2Ne0UcSRo9BPtdkK+nETg/xK+cwej4XrqXTG
	 GEPkJacGrRcZw==
From: Florian Maurer <fmaurer@disroot.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Florian Maurer <fmaurer@disroot.org>
Subject: [PATCH ath-next] wifi: ath11k: invalidate the REO queue SSN when RX aggregation stops
Date: Wed, 25 Nov 2026 09:03:20 +0000
Message-ID: <20261125090320.3890628-1-fmaurer@disroot.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_010337_766014_85EDDF7B 
X-CRM114-Status: GOOD (  11.38  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit fe201947f8bd ("ath11k: update bawindow size in delba
process"), stopping RX aggregation no longer deletes the REO queue of
the TID, so that frames sent without a new ADDBA are not dropped as
invalid. The queue is shrunk to a window of 1 but keeps its window head
and its SSN-valid bit. If the peer then restarts its sequence numbers
without a new ADDBA, REO drops its frames as old until they pass that
head again, for up to 2047 frames.

This happens in an 802.11s mesh when a peer restarts or rejoins without
HT: mac80211 stops the RX sessions ("wifi: mac80211: mesh: tear down BA
sessions when the peer link goes down"), and the peer starts again from
sequence number 0. In AP/STA mode a restarted peer reassociates and gets
a new queue.

Clear the SSN-valid bit when stopping, so that the queue is in the same
state as a newly set up one (ath11k_hal_reo_qdesc_setup()).
ath11k_dp_peer_rx_pn_replay_config() already clears it on active queues
when a pairwise key is installed.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Fixes: fe201947f8bd ("ath11k: update bawindow size in delba process")
Signed-off-by: Florian Maurer <fmaurer@disroot.org>
---
Tested on a Xiaomi AX3600 (OpenWrt, 6.18 backports) as the node that
keeps the station in an open 802.11s mesh, with the mac80211 patch [1]:
 - peer rejoins without HT: replies in the first 50 s 0/50 without this
   patch, 48-49/50 with it (4/4 runs each); HT20 rejoins unchanged
 - an ath10k neighbour reboots: its frames were dropped for 4.5 min to
   over 20 min without both patches (3/3), and got through right after
   its boot with them (2/2)
No firmware crash or REO command failure. Not tested: encrypted mesh
(the key install already clears the bit), AP/STA, other ath11k chips.
ath12k_dp_rx_ampdu_stop() has the same pattern; I have no ath12k
hardware to test it.

[1] https://lore.kernel.org/r/20261120142515.463101-1-fmaurer@disroot.org/

 drivers/net/wireless/ath/ath11k/dp_rx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a5..f3108aa992bc 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -955,6 +955,9 @@ static int ath11k_peer_rx_tid_reo_update(struct ath11k *ar,
 	if (update_ssn) {
 		cmd.upd0 |= HAL_REO_CMD_UPD0_SSN;
 		cmd.upd2 = FIELD_PREP(HAL_REO_CMD_UPD2_SSN, ssn);
+	} else {
+		/* drop the old window head, as for a newly set up queue */
+		cmd.upd0 |= HAL_REO_CMD_UPD0_SVLD;
 	}
 
 	ret = ath11k_dp_tx_send_reo_cmd(ar->ab, rx_tid,

base-commit: 18d0bedbb5f0538396cb7f763ed9cd1dd69c5b23
-- 
2.47.3


