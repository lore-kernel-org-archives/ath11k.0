Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9247EC4708E
	for <ath11k@archiver.kernel.org>; Thu,  5 Jan 2023 19:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p51cpRkOaFjZ1p3lph1B1brgHkYxa8coDfTcNyiwIHQ=; b=xLACsXu/1lBqSx
	KIIg7eZ5d7iGCQNbr0LViDJ+tIb19UogogCz7V9rOTX5Z81Ojcw16RFd3nPrJvhghh5orb8FvWBRk
	PxjKPcOW3tDgeDG5x7bxj0em5gYZ8Q03odCuhX33ClAZUhW7ieBaclnYGenjlCj12hDQboP+VBbIt
	l5DgzOFnF3fE44PXpCW2ZwpXDxRk6mIM7y16jXp3+D22x9GU5UgOJTrOcQrTsEfDwqbxCDgOhXbmD
	8CMNWC6/A2Gx6LMeUJSu/GXiV1wDV7FdM/aJhpTa/rmeF20J9K1rgTFQ156rWo31PXCFS1fMmhKvq
	wxtb4wCiJLpB0O/z1KYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVY5-00DxFE-Jf; Thu, 05 Jan 2023 19:05:09 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDImC-004DRq-Q8
	for ath11k@lists.infradead.org; Thu, 05 Jan 2023 05:26:54 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id d9-20020a4aa589000000b004af737509f4so6913729oom.11
        for <ath11k@lists.infradead.org>; Wed, 04 Jan 2023 21:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OejcpZVMfMg3HPzlGve79DiPK6ngwBTotFLTcHuW0S0=;
        b=J6UJsKf/o83rMEvTny2BngrmRZsqGt+0e84OD41ne1VVCEZHscE+TS70G/Mlm5uvoc
         9i9uE2bQWTWmP1jE3MMcEGYgbfp54Z1XQvi1BcCDBhA77hvZYTubLqQavXuI2ETnP9Gg
         LhW50GGL2fAHsBr/50pXJ2zw4lDWVge8aILzWLY/cJ/FSo1weiSTAvUtwgAyDmpBwDlX
         nSqKmObiT1GXe0uAEYKK9bccQAuwM//Mom226qhJ/6++HYXiYU5ToL8l1qjsWWIP84Da
         LmlsNlOZ5BVL67/cR4Ibd986+k8QuHJTQhBocivE4jTaWCGAUBwmjS4/wlmPwzl0mEki
         DC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OejcpZVMfMg3HPzlGve79DiPK6ngwBTotFLTcHuW0S0=;
        b=D3huP9Vv+CTuoZ3yTKNyNcpx0xXNrJddsJLV0brASohW51sX+d50Vg3UYgXdseN/A/
         6Pu/2KzPhzeoJ/aMFS1dw/Q7w6myHXUD80JkQr2OCN6PsjWWrzrhdQmCETLylHmrSgqn
         9Bbzej7ia4jXNnKsWBR0FNR1IOwqSez19qK8ibw2Wy6g3zZm5NV/gPR2o7owvyO8Zpyg
         GBCJrmICGvI5sYiUsz6dXvtqaTJ45A3uUL77TS3Vj3IKwAlSYzsGiiG1K0+31uWsuDDY
         NtQdNbH7Zh4xMzxv8ItnQMKUokmcLEawcJI0xOP1rjiadUvuOqGFOkwGHYND4GktAxDD
         QFnQ==
X-Gm-Message-State: AFqh2kquozpmOdfeD/f5WvnyJ5Ozyhzsl4nDHT76YLxTVz3Sqz8yDdK1
	pRVYQ57Dv51nWoeTjgMNUVo=
X-Google-Smtp-Source: AMrXdXttu0b/leqvQ8POfETF0m7gdR0UtPXKHCzV8TzDzqgpBV5fm3PJMcTXvidr7VJaAL6mzGGkOQ==
X-Received: by 2002:a4a:df0d:0:b0:4a3:e7ac:d31b with SMTP id i13-20020a4adf0d000000b004a3e7acd31bmr26779114oou.5.1672896410090;
        Wed, 04 Jan 2023 21:26:50 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f13-20020a4ab64d000000b004ce5d00de73sm12342587ooo.46.2023.01.04.21.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 21:26:49 -0800 (PST)
Date: Wed, 4 Jan 2023 21:26:47 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: johannes@sipsolutions.net, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH] wifi: mac80211: change initialize for sk_buff in
 ieee80211_tx_dequeue()
Message-ID: <20230105052647.GA2477583@roeck-us.net>
References: <20221212083607.21536-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221212083607.21536-1-quic_wgong@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_212652_958793_8FB76868 
X-CRM114-Status: GOOD (  19.72  )
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

On Mon, Dec 12, 2022 at 03:36:07AM -0500, Wen Gong wrote:
> The sk_buff is only set to NULL when initialize, sometimes it will goto
> label "begin" after ieee80211_free_txskb(), then it points to a sk_buff
> which is already freed. If it run into the "goto out" after arrived to
> label "begin", then it will return a sk_buff which is freed, it is a
> risk for use-after-free.
> 
> Fixes: ded4698b58cb ("mac80211: run late dequeue late tx handlers without holding fq->lock")
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

I don't see any progress on this patch. Is there a problem with it ?
Did it get lost ?

Thanks,
Guenter

> ---
>  net/mac80211/tx.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> 
> base-commit: 922932ca02191a390f7f52fb6e21c44b50e14025
> 
> diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
> index 2171cd1ca807..0b23cc9ab9c7 100644
> --- a/net/mac80211/tx.c
> +++ b/net/mac80211/tx.c
> @@ -3776,7 +3776,7 @@ struct sk_buff *ieee80211_tx_dequeue(struct ieee80211_hw *hw,
>  	struct ieee80211_local *local = hw_to_local(hw);
>  	struct txq_info *txqi = container_of(txq, struct txq_info, txq);
>  	struct ieee80211_hdr *hdr;
> -	struct sk_buff *skb = NULL;
> +	struct sk_buff *skb;
>  	struct fq *fq = &local->fq;
>  	struct fq_tin *tin = &txqi->tin;
>  	struct ieee80211_tx_info *info;
> @@ -3790,6 +3790,8 @@ struct sk_buff *ieee80211_tx_dequeue(struct ieee80211_hw *hw,
>  		return NULL;
>  
>  begin:
> +	skb = NULL;
> +
>  	spin_lock_bh(&fq->lock);
>  
>  	if (test_bit(IEEE80211_TXQ_STOP, &txqi->flags) ||

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
