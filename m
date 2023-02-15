Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA365C636CC
	for <ath11k@archiver.kernel.org>; Wed, 15 Feb 2023 17:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ioZ9VYkXH1RuKdVo5Sc7n8xKGxYWrMkRGsCPyQgTaZU=; b=JvRhROaNaDw3Pq
	+uJS1m29tMxE3T3Guw6qwOQ6wMaXCeXtcg8iiRJiD22cbMhxYRgLQXuceDAkXLN74P0B68lX94cIl
	H1B1jSBRguuwiqkLqFau6DG4kmj8Kr6OizvZ4VIPqhV4S7Csjd87Ql4yVtlmwqrEJ0wxrJ6IKzzVt
	WRwcvdX3yeeJn7y52ZSaDW0HlkpeV1WGG89yinkJ5X+8fcCb0x6901hHnueVW8GEoee/Ya2AD9IgP
	tpWmI3VhM+7L+6E3XcKaKOPuEwLmA69tAJwg3dyamOF8FOoq3sNh5bj4geo3zShTlcrFf/oUJXy9r
	/vSY7xTh+CimEXgODo2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSLhC-006iQ9-TR; Wed, 15 Feb 2023 17:35:54 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSLh9-006iOx-JI
	for ath11k@lists.infradead.org; Wed, 15 Feb 2023 17:35:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=Yxxd4SRBeMcxv/d15Lefe27giEN1CCN93R+1EThdVBw=;
	t=1676482551; x=1677692151; b=tNh7Gg4XL5Pus7QiKrp7K1PGFuR+xlvYDMdf8waa9mTTR11
	QN1csIP/9VqoupnJCCeqYh7W9TarV/VvgjN0bqVnOWeeKPf9yF52kbPyne+s4JWduZkJQ+kRQji3n
	yPEY0aqoP2vzEVtpzhbSKiTj/7ofG6zAIg91IhkT5ni4YpbKYREeE9OYyg9ikjHGqqfn2b50gKxP+
	IDScNcwAHg8druO101jlk5IWYq9VU+Apf+kl9J0d/aWoRXDww8fUAHWGzex5jY+A8MyImWID0LKlP
	jPJvQC1ysRRs6+NdqK+WZ6u7ZTtNJJZFEjSdklrBZQXDzgnV9eFWyxIglCVX+IdQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pSLh7-00D9K3-2H;
	Wed, 15 Feb 2023 18:35:49 +0100
Message-ID: <5dadf98596e71485155225368c68eb71ee69e89e.camel@sipsolutions.net>
Subject: Re: [PATCH v3 2/3] wifi: mac80211: Avoid BSS color collision
 detection if its disabled
From: Johannes Berg <johannes@sipsolutions.net>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>, 
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Wed, 15 Feb 2023 18:35:48 +0100
In-Reply-To: <20230201065638.25990-3-quic_ramess@quicinc.com>
References: <20230201065638.25990-1-quic_ramess@quicinc.com>
	 <20230201065638.25990-3-quic_ramess@quicinc.com>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_093551_651266_D6076239 
X-CRM114-Status: GOOD (  12.46  )
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
>  
> -	if (rx->sdata->vif.bss_conf.csa_active)
> +	if (rx->sdata->vif.bss_conf.csa_active ||
> +	    rx->sdata->vif.bss_conf.he_bss_color.collision_detection_enabled)
>  		return;

And this kind of answers my question on the previous patch ...

???

johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
