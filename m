Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67975C636D4
	for <ath11k@archiver.kernel.org>; Wed, 15 Feb 2023 17:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iCDF+bAofUO/XSXElfWU9z7r1ap0d7UjMqPU9xJ+dXI=; b=Z0NYm7WRoksXuG
	CULrM7EtJWf24pvOdy6Wrwn8xGBsw1l+lPRM9JyZDuxEPK8CMNF5BnLtKMcIZdpeVWlDg2FG84z5i
	rA0PPYL3k+DJYOOHW1q4NZhdfmfzuFJRLv81UHk9gQwvODEEmTf26VbLE7ESyq76SY7AEcN6xeqH0
	nXKud2XoufSNuNMy0l1ldWR7aNbGiiDDfc6NfY1qTInu9V9AJC7vY5xJRdOjGVjJS7NDroaYNVpDo
	pnSwR19HPg+h+guZCOtdYq9Hi1/lSra9VVbEVcRHWAoi7Uvqy5qgucH3e76vU+xiHYwy9cuvxjP7J
	n4mfUd2PI30YStS+AUKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSLiT-006iqe-RR; Wed, 15 Feb 2023 17:37:13 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSLiR-006ip4-22
	for ath11k@lists.infradead.org; Wed, 15 Feb 2023 17:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=G9D3YiOF4hNaUN5OWObMpcjVa4Z0GbPH9AWLkznpxxs=;
	t=1676482630; x=1677692230; b=lJe4nI01vuTaj7CTZJxmXcQkKAT9376oD+Qbhw7BXO1DGt3
	Hm/btW9KEK//sN8wFhZ6q1qP5tQ3WpttRS5LjQgnK1YQ0ccN6iTMQcXFJQ2h28J6CVAapA8domYNx
	yoq21rqPvlwTH5/aEBe3q45/QP69WCb2LDiWlkWz7pXe2imQH+Zv6bhwkxsXqGK3ifUvELbbedg52
	ADs0dTfVuuwNk1jWgI2633i/BSiV/xKH8e2fVJrRYSNZ+ddXcpiy1ivq9Z5ZvUAOK5U4xj8DCPTHw
	CU+zGx/iobIqBmUpVf7wUPosNVfzfxztjAdINfnsyHxWKlG44WBd+XSxLEDQOmAA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pSLiP-00D9LQ-0T;
	Wed, 15 Feb 2023 18:37:09 +0100
Message-ID: <107b5dcc63d9f421f0bd38b6fe8d1a4ae1ed0b33.camel@sipsolutions.net>
Subject: Re: [PATCH v3 2/3] wifi: mac80211: Avoid BSS color collision
 detection if its disabled
From: Johannes Berg <johannes@sipsolutions.net>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>, 
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Wed, 15 Feb 2023 18:37:08 +0100
In-Reply-To: <20230201065638.25990-3-quic_ramess@quicinc.com>
References: <20230201065638.25990-1-quic_ramess@quicinc.com>
	 <20230201065638.25990-3-quic_ramess@quicinc.com>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_093711_118118_812AE69A 
X-CRM114-Status: GOOD (  13.26  )
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

On Wed, 2023-02-01 at 12:26 +0530, Rameshkumar Sundaram wrote:
> Don't detect BSS color collision and send collision events
> to userspace if it is disabled.
> 
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
> ---
>  net/mac80211/rx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
> index e284897ba5e9..5588067b2af2 100644
> --- a/net/mac80211/rx.c
> +++ b/net/mac80211/rx.c
> @@ -3195,7 +3195,8 @@ ieee80211_rx_check_bss_color_collision(struct ieee80211_rx_data *rx)
>  	if (ieee80211_hw_check(&rx->local->hw, DETECTS_COLOR_COLLISION))
>  		return;

Also, given this, it seems you should pass this setting down to the
hardware, bss change flag, etc.?

> -	if (rx->sdata->vif.bss_conf.csa_active)
> +	if (rx->sdata->vif.bss_conf.csa_active ||
> +	    rx->sdata->vif.bss_conf.he_bss_color.collision_detection_enabled)
>  		return;

and now that I read this again - clearly that's adding a multi-link
problem. I'd rather not add more of those.

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
