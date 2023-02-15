Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A07C636D4
	for <ath11k@archiver.kernel.org>; Wed, 15 Feb 2023 17:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pMEKGzan2biWIAfPb7f1n4xe1MvVOMJXUY4tVInduvw=; b=UGNbLxcssp/ZUg
	mNg+RIzDCZXEWfqlfjRg8v/rg7sBi5/XdB2GRbwdqaSy7IPFSXb1WP2lcpuzPkOdhaMrMkiA96RPi
	RlLdZiiJ4ZZsccTlxW9joVUcsMJIMRXaNHfGJSltFbVrmdv63q5MZ2Z2UXfXFbcgt6ZcxA97Otsm4
	Qc/v+S5jC34Hy00sNQC8XYvx968V3ev+MzodmTk8ea8tH3QxhJnVpOKO8dMpL2xihHvYB4N2Fc2GG
	COmbRMcbAT9d3oVdA0uEX4+s43CunNZqfMs8qTPOYhicMCkW8VDCbIsv0T8fNgBrU4iTv6U/SmQ/H
	teKYGtuLfjikmrsX6G/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSLjA-006j6E-Um; Wed, 15 Feb 2023 17:37:56 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSLj8-006j5H-Eg
	for ath11k@lists.infradead.org; Wed, 15 Feb 2023 17:37:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=zd92LPo7R+krbsALRLGyUaaTkdnACGv/4SBRzWXgf3U=;
	t=1676482674; x=1677692274; b=uzQS9oLoJOWnYARTFnOzM4hGoUT/gufz9ZTmrlNrpB4zthe
	cDUfuEhUTJ83PnxPn03oYZ3w8Gk8YxozgOpdjcVZAMtMVsU3gp6lna4SsfPDNPNJJ7N0muiu1MDPu
	pIE9VD8u3lMrE6afSGbdtfRpypeDTSDksIxE6n55U2ZFdCS0ymAtFbBboyDW7DBG82gFn9M534jsS
	76SMvgqichM11RfiDTSfWuM0X4UOXahIDSQ9mHrcJRySHkwzH4k+7ZHr1Zb7vcANokqJK0n6gQSGf
	HPNyghRc5tbMdY2fMfx6Fu0xltkwGaosCY7uocZu//CkeyTIBcsyzgaLV3IOst4w==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pSLj6-00D9MO-13;
	Wed, 15 Feb 2023 18:37:52 +0100
Message-ID: <3dbd12c5c46b28c36504a0ebaf7d3b13bc2f141e.camel@sipsolutions.net>
Subject: Re: [PATCH v3 3/3] wifi: ath11k: add support to enable/disable BSS
 color collision detection
From: Johannes Berg <johannes@sipsolutions.net>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>, 
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Wed, 15 Feb 2023 18:37:51 +0100
In-Reply-To: <20230201065638.25990-4-quic_ramess@quicinc.com>
References: <20230201065638.25990-1-quic_ramess@quicinc.com>
	 <20230201065638.25990-4-quic_ramess@quicinc.com>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_093754_512047_A49AB022 
X-CRM114-Status: GOOD (  12.53  )
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
> Enable/Disable BSS color collision detection based on user
> configuration of collision detection and BSS color feature
> itself.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01228-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/mac.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 9e923ecb0891..6d5290996d9f 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -3112,6 +3112,7 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
>  	u8 rateidx;
>  	u32 rate;
>  	u32 ipv4_cnt;
> +	bool color_collision_detect;
>  
>  	mutex_lock(&ar->conf_mutex);
>  
> @@ -3370,10 +3371,12 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
>  
>  	if (changed & BSS_CHANGED_HE_BSS_COLOR) {

You never set this flag in the prior change, and it also doesn't even
*mean* the BSS color _detection_ changed ..??

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
