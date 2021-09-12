Return-Path: <SRS0=7g+G=OC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9D3C43217
	for <ath11k@archiver.kernel.org>; Sun, 12 Sep 2021 19:28:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7EC960FE3
	for <ath11k@archiver.kernel.org>; Sun, 12 Sep 2021 19:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C7EC960FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kSicIIKx6C/TRb8Eg7jP0vK9L+v1v477MpUekN1/Ojw=; b=0kSmg2IqlNy9uG
	0ESPuV+Zs7iJ/GkImhgYUv9OCMD5qO9Q7mUOqkOH47FBxy9rTuBX+g7a5umKlE80PEbc4XIfREzU2
	eSVhzPqbFO7BVpYSEcLu5TNWEhkImIlyXqF777fS52ZfMfKdpcG8hH9nJVZ8GQGSdZsj0BzDoewND
	9N6ADsrwAi6HfWEaKqNSOCq0LmjBht/Vs7jGxDYSB2wZ2LT4ld6Q9SmY07KM0bE5NN2vh5KocLZXO
	vpJehrT3EWpSI5LMu0e1aGa14F7qUi/twq0dHbpbScn3n+tp6juf7mjjFtB/dmFisUU+S3phtpo6E
	NBL8ACD3YFs5Z1yiUj0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPV91-00H2ro-KP; Sun, 12 Sep 2021 19:28:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPV8y-00H2rL-G9
 for ath11k@lists.infradead.org; Sun, 12 Sep 2021 19:28:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D5FC60F6C;
 Sun, 12 Sep 2021 19:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631474879;
 bh=vmtoFuG0plpPFF+EQhhTtgHGfdTsRfks9YatKXBlEeQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j+Fckx/eoaFlsEVTEDbx5ul9vBoH7/iYrdmWBpOKDmeptkrcvSfHQpJa27yVzWT84
 SNsC9UzDPYBzovTcZ9Oyt/mEltGokJ8RQ2mV1ayDiAiA6wCw95WUSr3cpcbyg+5vDu
 Yjb8mytvs3rNrrQuLTAo7PDBmZaa+uToQ4k4jFFxJwBZc2366cRl5bkaddRGdyROp9
 yeSr9Kjb1escQT8pibROK3y9sPWOqbHX+Kx9z7ugl7Z1EQuNIZKR7zckLz+mPiVOpC
 N325kZBrI2Rx6d9jopqvmogWBSKJlaFsjQdrr4oCNi9WqKVGD8u+1GJ5EiDnOwN7oT
 NWcOIomD5Dyzw==
Date: Sun, 12 Sep 2021 14:31:40 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Len Baker <len.baker@gmx.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Kees Cook <keescook@chromium.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ath11k: Replace one-element array with flexible-array
 member
Message-ID: <20210912193140.GC146608@embeddedor>
References: <20210904114937.6644-1-len.baker@gmx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210904114937.6644-1-len.baker@gmx.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210912_122800_599147_F9E34D26 
X-CRM114-Status: GOOD (  18.49  )
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


There is already a patch for this:

https://lore.kernel.org/lkml/20210823172159.GA25800@embeddedor/

which I will now add to my -next tree.

Thanks
--
Gustavo

On Sat, Sep 04, 2021 at 01:49:37PM +0200, Len Baker wrote:
> There is a regular need in the kernel to provide a way to declare having
> a dynamically sized set of trailing elements in a structure. Kernel code
> should always use "flexible array members"[1] for these cases. The older
> style of one-element or zero-length arrays should no longer be used[2].
> 
> Also, refactor the code a bit to make use of the struct_size() helper in
> kzalloc().
> 
> [1] https://en.wikipedia.org/wiki/Flexible_array_member
> [2] https://www.kernel.org/doc/html/v5.14/process/deprecated.html#zero-length-and-one-element-arrays
> 
> Signed-off-by: Len Baker <len.baker@gmx.com>
> ---
>  drivers/net/wireless/ath/ath11k/reg.c | 7 ++-----
>  drivers/net/wireless/ath/ath11k/wmi.h | 2 +-
>  2 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
> index e1a1df169034..c83d265185f1 100644
> --- a/drivers/net/wireless/ath/ath11k/reg.c
> +++ b/drivers/net/wireless/ath/ath11k/reg.c
> @@ -97,7 +97,6 @@ int ath11k_reg_update_chan_list(struct ath11k *ar)
>  	struct channel_param *ch;
>  	enum nl80211_band band;
>  	int num_channels = 0;
> -	int params_len;
>  	int i, ret;
> 
>  	bands = hw->wiphy->bands;
> @@ -117,10 +116,8 @@ int ath11k_reg_update_chan_list(struct ath11k *ar)
>  	if (WARN_ON(!num_channels))
>  		return -EINVAL;
> 
> -	params_len = sizeof(struct scan_chan_list_params) +
> -			num_channels * sizeof(struct channel_param);
> -	params = kzalloc(params_len, GFP_KERNEL);
> -
> +	params = kzalloc(struct_size(params, ch_param, num_channels),
> +			 GFP_KERNEL);
>  	if (!params)
>  		return -ENOMEM;
> 
> diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
> index d35c47e0b19d..d9c83726f65d 100644
> --- a/drivers/net/wireless/ath/ath11k/wmi.h
> +++ b/drivers/net/wireless/ath/ath11k/wmi.h
> @@ -3608,7 +3608,7 @@ struct wmi_stop_scan_cmd {
>  struct scan_chan_list_params {
>  	u32 pdev_id;
>  	u16 nallchans;
> -	struct channel_param ch_param[1];
> +	struct channel_param ch_param[];
>  };
> 
>  struct wmi_scan_chan_list_cmd {
> --
> 2.25.1
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
