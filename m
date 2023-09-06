Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3C5EB8FAF
	for <ath11k@archiver.kernel.org>; Wed,  6 Sep 2023 09:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fq1UVCzwTtVq6mEU7L439uLjRuZXazbuwLSYCIE5ZZ0=; b=bHxMN9lmRBo5Ne
	q21oDD9NTxai76HmWFZSTdFHavb5hGDX5cAoQ2N4hp1UCE4792Ldpkmr5l41FMvIGf9MoGu6DO7Id
	2WtXW6nTBxtNDBHVPyrAcyuqcUl9c89U4TyV+n4kQ/ofYEfinGPwKqrSgHzmhJ+nSfF7RXla1dc7B
	kzIBh2pdiH6lLI0MOyoV+ZJLClHUhzqiUkBaVEhDCfeLNSzv/q2EwHKI+BIvecj0edePn5wrfHPUL
	6T9JLqIkRSeY6c1IlIFclo1XMTkVaJmKw0PrRm+GS8KwADeJFCSDHe7lsB8YIxTbUl2Ciw7bXYdlW
	tESenv+iCoO5ySuk0Iug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdoys-007xK9-0F;
	Wed, 06 Sep 2023 09:37:50 +0000
Received: from forward101a.mail.yandex.net ([178.154.239.84])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdoyo-007xGs-1Q
	for ath11k@lists.infradead.org;
	Wed, 06 Sep 2023 09:37:49 +0000
Received: from mail-nwsmtp-smtp-production-main-51.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-51.vla.yp-c.yandex.net [IPv6:2a02:6b8:c22:d84:0:640:51d4:0])
	by forward101a.mail.yandex.net (Yandex) with ESMTP id A979742322;
	Wed,  6 Sep 2023 12:37:35 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-51.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id YbUwVB1WliE0-QJNhyVH5;
	Wed, 06 Sep 2023 12:37:35 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1693993055; bh=H9mtoWSF8K60E7Mct4idhTBiYLlmvfyM4sv1+L+IpAI=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=MbhDm+Pjm0kb+kycMJ9lg4+5kLFL1kqT9XXSDKtRQ5AzjoqEAG66ohjAJhyY2U87L
	 bKb5a/SU7EsbvpI0wBWFnqPk4TcnNFoMgTuxWO0H8CZrGM40Hn7DoYLJENBvLJWg6W
	 Ltm97bndnp17jlnfRIkLV8KlNV4B/QGmmPPMMH90=
Authentication-Results: mail-nwsmtp-smtp-production-main-51.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	lvc-project@linuxtesting.org,
	ath11k@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] wifi: ath11k: drop NULL pointer check in ath11k_update_per_peer_tx_stats()
Date: Wed,  6 Sep 2023 12:36:55 +0300
Message-ID: <20230906093704.14001-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_023747_032937_19252A1D 
X-CRM114-Status: UNSURE (   6.32  )
X-CRM114-Notice: Please train this message.
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

Since 'user_stats' is a fixed-size array of 'struct htt_ppdu_user_stats'
in 'struct htt_ppdu_stats', any of its member can't be NULL and so
relevant check may be dropped.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 62bc98852f0f..146201d8dba2 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1388,9 +1388,6 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 	u8 tid = HTT_PPDU_STATS_NON_QOS_TID;
 	bool is_ampdu = false;
 
-	if (!usr_stats)
-		return;
-
 	if (!(usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_RATE)))
 		return;
 
-- 
2.41.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
