Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CA9C77B75
	for <ath11k@archiver.kernel.org>; Mon,  8 May 2023 05:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:From:Cc:To
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YD5YuIZ1OaC3Pn/INiq26PGhmrx0TFWxSPD3IMMUpN8=; b=ncyBAmJVXcMt1X
	SThCfKNHszPt6y/KTlCNp4F9oMzbEpzBPCEkyxrYpUl7KNrUUp1t6wojr4FgtNC2y7oAndIF4OKY4
	XSlvmRxvjKv1zW514qltdAYgAjGP9sSjLMG4x9Kkm2MmYMyYo/P0YcKdW+3en5xawZBOmyEfXlSAZ
	x2Fc4vEcR/KaDb3oz1L/5NtNGEGKE3y3W9CYUQo3OvfKSqTdmTJK9U6O8LvSfET9bGzTTsmr9lypF
	9luw8mt+9B8pC9TzUuUIc+YMbDrHD24aVMIlhlOYHXS8QVYdr+2rT4zIwgyUfCmSRgGJRcVh55wdU
	E3z7VO27dHH+RhDK3tjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvtLk-00HIfn-1d;
	Mon, 08 May 2023 05:23:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvtLh-00HIfR-2p
	for ath11k@lists.infradead.org;
	Mon, 08 May 2023 05:23:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2826361113;
	Mon,  8 May 2023 05:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA95C433EF;
	Mon,  8 May 2023 05:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1683523428;
	bh=uhFiOM9o8x/BsOIAZg+6sZzmQ135mwt1e6bwoLW8YUQ=;
	h=Subject:To:Cc:From:Date:From;
	b=c4OC7TtVYWOqlZXdbr4FG4Pg8UPY1pCCHxfG6gOy6hmd612RQlPy5099LtFjRJaXM
	 1RnEuaghQHwxa3TNSsHY7HSXhO52u8zFMJi4ODLDoE6aPUMs790TJT4opREPlK9HVa
	 dL5E60ipjktdoj+piN4NvrjRGlBbNeMJYf4MHVms=
Subject: Patch "wifi: ath11k: synchronize ath11k_mac_he_gi_to_nl80211_he_gi()'s return type" has been added to the 6.1-stable tree
To: ath11k@lists.infradead.org,davem@davemloft.net,edumazet@google.com,gregkh@linuxfoundation.org,jirislaby@kernel.org,kuba@kernel.org,kvalo@kernel.org,mliska@suse.cz,pabeni@redhat.com,quic_jjohnson@quicinc.com,quic_kvalo@quicinc.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 08 May 2023 07:23:35 +0200
Message-ID: <2023050834-july-lullaby-f863@gregkh>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_222350_006658_A385A92E 
X-CRM114-Status: GOOD (  14.93  )
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


This is a note to let you know that I've just added the patch titled

    wifi: ath11k: synchronize ath11k_mac_he_gi_to_nl80211_he_gi()'s return type

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     wifi-ath11k-synchronize-ath11k_mac_he_gi_to_nl80211_he_gi-s-return-type.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From dd1c2322694522f674c874f5fa02ac5ae39135dd Mon Sep 17 00:00:00 2001
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Date: Mon, 31 Oct 2022 12:43:41 +0100
Subject: wifi: ath11k: synchronize ath11k_mac_he_gi_to_nl80211_he_gi()'s return type

From: Jiri Slaby (SUSE) <jirislaby@kernel.org>

commit dd1c2322694522f674c874f5fa02ac5ae39135dd upstream.

ath11k_mac_he_gi_to_nl80211_he_gi() generates a valid warning with gcc-13:
  drivers/net/wireless/ath/ath11k/mac.c:321:20: error: conflicting types for 'ath11k_mac_he_gi_to_nl80211_he_gi' due to enum/integer mismatch; have 'enum nl80211_he_gi(u8)'
  drivers/net/wireless/ath/ath11k/mac.h:166:5: note: previous declaration of 'ath11k_mac_he_gi_to_nl80211_he_gi' with type 'u32(u8)'

I.e. the type of the return value ath11k_mac_he_gi_to_nl80211_he_gi() in
the declaration is u32, while the definition spells enum nl80211_he_gi.
Synchronize them to the latter.

Cc: Martin Liska <mliska@suse.cz>
Cc: Kalle Valo <kvalo@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Link: https://lore.kernel.org/r/20221031114341.10377-1-jirislaby@kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/net/wireless/ath/ath11k/mac.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -163,7 +163,7 @@ void ath11k_mac_drain_tx(struct ath11k *
 void ath11k_mac_peer_cleanup_all(struct ath11k *ar);
 int ath11k_mac_tx_mgmt_pending_free(int buf_id, void *skb, void *ctx);
 u8 ath11k_mac_bw_to_mac80211_bw(u8 bw);
-u32 ath11k_mac_he_gi_to_nl80211_he_gi(u8 sgi);
+enum nl80211_he_gi ath11k_mac_he_gi_to_nl80211_he_gi(u8 sgi);
 enum nl80211_he_ru_alloc ath11k_mac_phy_he_ru_to_nl80211_he_ru_alloc(u16 ru_phy);
 enum nl80211_he_ru_alloc ath11k_mac_he_ru_tones_to_nl80211_he_ru_alloc(u16 ru_tones);
 enum ath11k_supported_bw ath11k_mac_mac80211_bw_to_ath11k_bw(enum rate_info_bw bw);


Patches currently in stable-queue which might be from jirislaby@kernel.org are

queue-6.1/linux-vt_buffer.h-allow-either-builtin-or-modular-fo.patch
queue-6.1/net-wwan-t7xx-do-not-compile-with-werror.patch
queue-6.1/bonding-gcc13-synchronize-bond_-a-t-lb_xmit-types.patch
queue-6.1/wifi-ath11k-synchronize-ath11k_mac_he_gi_to_nl80211_he_gi-s-return-type.patch
queue-6.1/thunderbolt-use-correct-type-in-tb_port_is_clx_enabled-prototype.patch
queue-6.1/wireguard-timers-cast-enum-limits-members-to-int-in-prints.patch

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
