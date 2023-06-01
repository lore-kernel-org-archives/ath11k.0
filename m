Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11340C77B7A
	for <ath11k@archiver.kernel.org>; Thu,  1 Jun 2023 10:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ky9m/N9EW6xUqgu0cFukFEyISiIAmkHyf8z1bnrLqVU=; b=y2SC+VBdYxt8SA
	7JjN5IURTPB9pamaLqW99C2iLNARVbtTmNEEch5TQEof7bCWyP7yY4kVSdfNYnbJzjdnEPq28XJzQ
	7za2eisD+12b6ZL6DUe0JT4+raaOLszavJuYgCPvLU1NA8lgzcBeyUxce7IBa9FTTkn+6+bNA84CO
	H6F5cJXyUozG465VZFzpJrjSgRrY84GFB7Nnk1OSfPi01QCDpXZ5q+iVL8z4KtxCzpLOOzRQgSSiz
	cQc/oybKwRjDWpVdiClU9Zq92tqvHgeTIE4hfYqgIzOYphROBmJKCOvoR5AXZgJcGOVgn0X6csMVi
	+vF0LgBtEKO9+MDNdxmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4fY0-0030lw-1C;
	Thu, 01 Jun 2023 10:28:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4fXw-0030jK-30
	for ath11k@lists.infradead.org;
	Thu, 01 Jun 2023 10:28:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4104560E9C;
	Thu,  1 Jun 2023 10:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2129C433EF;
	Thu,  1 Jun 2023 10:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685615323;
	bh=KRUWyi7px/1mj9hDeaRWyHxzW0DXlU/q5rjD+k9eiEU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=fvCqcw0kbH5TaIZtSXdySw6jZzrLVX2EakMYkauuNh6beNP8+BNdNbSjemVAaUkZx
	 Jzvzb+DXGJIf+4c5HjZehTfJwxUJRJ2e2TH7OnIg9hBBnrdX6M+0FmpIYlbV/Q8fiP
	 aNEr3EhBhEaqyHEkgPh4v8NoIuajTR6TjwtVXgNmvyfxco3o/ryrAep1bJ+eTrXT9M
	 WX/RFT4rFeT8FPhx0hWeYRZpZvg/l9xdMsQOcqVbUF+TlUSNg0O9aY61gbQtXJBjR0
	 HZdiflLuzszgAD21AWI82f7Ut7QJULxYwmAjccrBjPioacU3+4AYpdURyGYuOqW0YP
	 KWG89ZYNi9k8w==
From: Kalle Valo <kvalo@kernel.org>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Govindaraj Saminathan <quic_gsaminat@quicinc.com>
Subject: Re: [PATCH v4 2/4] wifi: ath11k: optimize ath11k_tm_cmd_get_version
References: <20230517135934.16408-1-quic_rajkbhag@quicinc.com>
	<20230517135934.16408-3-quic_rajkbhag@quicinc.com>
Date: Thu, 01 Jun 2023 13:28:35 +0300
In-Reply-To: <20230517135934.16408-3-quic_rajkbhag@quicinc.com> (Raj Kumar
	Bhagat's message of "Wed, 17 May 2023 19:29:32 +0530")
Message-ID: <878rd3jx2k.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_032845_017644_BB484CBA 
X-CRM114-Status: GOOD (  16.96  )
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

Raj Kumar Bhagat <quic_rajkbhag@quicinc.com> writes:

> From: Govindaraj Saminathan <quic_gsaminat@quicinc.com>
>
> Currently ath11k_tm_cmd_get_version() uses local variable ret.
> optimize ath11k_tm_cmd_get_version() to avoid local variable use.
>
> Tested-on : IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Govindaraj Saminathan <quic_gsaminat@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/testmode.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/testmode.c b/drivers/net/wireless/ath/ath11k/testmode.c
> index ebeca5eb6a67..f562f860ebf3 100644
> --- a/drivers/net/wireless/ath/ath11k/testmode.c
> +++ b/drivers/net/wireless/ath/ath11k/testmode.c
> @@ -24,7 +24,6 @@ static const struct nla_policy ath11k_tm_policy[ATH11K_TM_ATTR_MAX + 1] = {
>  static int ath11k_tm_cmd_get_version(struct ath11k *ar, struct nlattr *tb[])
>  {
>  	struct sk_buff *skb;
> -	int ret;
>  
>  	ath11k_dbg(ar->ab, ATH11K_DBG_TESTMODE,
>  		   "testmode cmd get version_major %d version_minor %d\n",
> @@ -36,18 +35,12 @@ static int ath11k_tm_cmd_get_version(struct ath11k *ar, struct nlattr *tb[])
>  	if (!skb)
>  		return -ENOMEM;
>  
> -	ret = nla_put_u32(skb, ATH11K_TM_ATTR_VERSION_MAJOR,
> -			  ATH11K_TESTMODE_VERSION_MAJOR);
> -	if (ret) {
> -		kfree_skb(skb);
> -		return ret;
> -	}
> -
> -	ret = nla_put_u32(skb, ATH11K_TM_ATTR_VERSION_MINOR,
> -			  ATH11K_TESTMODE_VERSION_MINOR);
> -	if (ret) {
> +	if (nla_put_u32(skb, ATH11K_TM_ATTR_VERSION_MAJOR,
> +			ATH11K_TESTMODE_VERSION_MAJOR) ||
> +	    nla_put_u32(skb, ATH11K_TM_ATTR_VERSION_MINOR,
> +			ATH11K_TESTMODE_VERSION_MINOR)) {
>  		kfree_skb(skb);
> -		return ret;
> +		return -ENOBUFS;
>  	}

When optimising something it's always good to provide numbers to show
the improvement. But I can't see how this really improves anything so I
dropped this patch 2.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
