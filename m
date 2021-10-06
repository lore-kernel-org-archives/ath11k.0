Return-Path: <SRS0=PBC3=O2=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF3CC433EF
	for <ath11k@archiver.kernel.org>; Wed,  6 Oct 2021 18:08:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD02F61027
	for <ath11k@archiver.kernel.org>; Wed,  6 Oct 2021 18:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD02F61027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N138P1VKOJgKheCRsqRxnkQx18z86bjtWV+g9Qm1qGg=; b=dp74gcN7ILPBaI
	Rxuf0rG1r6qJmHWbprf5ivCjNicXOSJini+/w2I97IZCnBh1m4WZ1MEp1hLv7Q/wC1yUfgllYG8Kr
	FQaYee6WijYs0T5UNffJ5AywQ5KMxC3OQ+zfBVK0V9CcDvWw1a74B8P49jTsn1Wb+x5QrjVtFWlnk
	pWAvtf0nOgFOPASQhiFRKhdDXXoZQQfkju2Nd3S0cIj696xgMeCdzEy8guQHed3e5s6UhEClI/SbN
	lmEKrROb2MPr6jxY1gnK7M/mAX5uYzcjaGhudwcMIq/gQdPxv18fuydHe8mfRrsQfD8B0bkxywY33
	rlqo3vDaY5JvtAc68rHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYBKk-00FIZP-6S; Wed, 06 Oct 2021 18:08:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYBKi-00FIZ1-2p
 for ath11k@lists.infradead.org; Wed, 06 Oct 2021 18:08:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F174961039;
 Wed,  6 Oct 2021 18:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633543679;
 bh=4H3UbAzOvhL7VvGwxsIUhSjoYwJuXz+t9/UCE0IhIcA=;
 h=Date:From:To:Cc:Subject:From;
 b=A/Y1PTcGhYR2SWXNRvxtC7lddnL5VsWZ80djNr0oiFXb2HltlVb9hQaiTTsd0abpP
 xmBVlcixn0lMZHFcOMtx1M9eLLABaseXSlE9NIlqoM/SGyD55xAVlkBH7l7x306x6d
 2bNEQOklusyFgJqhpk8aJYWAlKG3FeXVAkbiejBlbu7SazegjcXXZaF1xUoHL5Htop
 wqo8U+OEM0a12bY2L4xO4Ok9zYzIuHOgOG7Xkxkt2daPpUfRjIibM6mA7ww1vCSClN
 g4VOrH6k+fbV6eRET7p6upCT5/3dt+85rKjoQgSIlVdTM6W9n7ENm2bLh+pkxdUlwF
 pI+trbHwr/emw==
Date: Wed, 6 Oct 2021 13:12:04 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH][next] ath11k: Use kcalloc() instead of kzalloc()
Message-ID: <20211006181204.GA913553@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_110800_167821_69C30FC6 
X-CRM114-Status: UNSURE (   8.00  )
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

Use 2-factor multiplication argument form kcalloc() instead
of kzalloc().

Link: https://github.com/KSPP/linux/issues/162
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 6c253eae9d06..0bbda81117df 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -4046,8 +4046,8 @@ static int ath11k_wmi_tlv_mac_phy_caps_parse(struct ath11k_base *soc,
 
 	len = min_t(u16, len, sizeof(struct wmi_mac_phy_capabilities));
 	if (!svc_rdy_ext->n_mac_phy_caps) {
-		svc_rdy_ext->mac_phy_caps = kzalloc((svc_rdy_ext->tot_phy_id) * len,
-						    GFP_ATOMIC);
+		svc_rdy_ext->mac_phy_caps = kcalloc(svc_rdy_ext->tot_phy_id,
+						    len, GFP_ATOMIC);
 		if (!svc_rdy_ext->mac_phy_caps)
 			return -ENOMEM;
 	}
@@ -4447,8 +4447,8 @@ static struct cur_reg_rule
 	struct cur_reg_rule *reg_rule_ptr;
 	u32 count;
 
-	reg_rule_ptr =  kzalloc((num_reg_rules * sizeof(*reg_rule_ptr)),
-				GFP_ATOMIC);
+	reg_rule_ptr = kcalloc(num_reg_rules, sizeof(*reg_rule_ptr),
+			       GFP_ATOMIC);
 
 	if (!reg_rule_ptr)
 		return NULL;
-- 
2.27.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
