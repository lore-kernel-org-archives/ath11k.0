Return-Path: <SRS0=kuZe=OG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44E7C433FE
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 15:11:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 997D66112E
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 15:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 997D66112E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mtl6uQLEcQPjcTuERuTlh5YODGemqfvJHseDArPmWTw=; b=k1ld/TPRZitKbP
	1HRieycCRiY74NmEzvnR0gyT4HUqAufWNROQb0hNIjuOGzckX2ngv8sUI2IwF4nPWcvyiCla9J+Rw
	AcGwAdHUjLdtoTyBAwMp/ALAFuHt4riyktFH3Ksj7glP3FFMoA9P4Hxd5wEj73NbWG0yoiSEf0ycW
	SdlTqupBWD7tL0CVpc1BIOi2sDgEFZ4ABwuOWtAuahYeQv8vidCRtg9KLOsyeDda/6j5sAwTKhA4V
	xeHws5pISKCEfrbj3QgYtHfWAdQUvthI06/Tlg76tQ0A+ovJKajfq0UlNUOfEf0aiovLKAXr+cguk
	ttoXXNbtzHQJk3tFjRXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQt2c-00BQDI-Gx; Thu, 16 Sep 2021 15:11:10 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQt2Y-00BQCv-GQ
 for ath11k@lists.infradead.org; Thu, 16 Sep 2021 15:11:09 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631805067; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=3GmProUL1RrIuDbt9MXonap06h8IMS/lbGchXicoQ2M=;
 b=tJUMbV7yabtrmlExZZBXS6ed3G5zAqc0bNq4McJsDPL//kkj7bzfkkYutAvNXde17G3XHbmp
 u8QKynas5TPLHlr14Wb7gwkLbvxOV23XO2P8TippEi4WlPmgT4di2z+cbJlBEoAxwoFaU3Kv
 teau07Amog5eN2R+653pb8U6XXM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 61435e82507800c88010951f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 15:10:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 40A67C43460; Thu, 16 Sep 2021 15:10:57 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 85A06C4338F;
 Thu, 16 Sep 2021 15:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 85A06C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: Re: [PATCH 1/3] ieee80211: Add new A-MPDU factor macro for HE 6 GHz
 peer caps
References: <20210913175510.193005-1-jouni@codeaurora.org>
Date: Thu, 16 Sep 2021 18:10:51 +0300
In-Reply-To: <20210913175510.193005-1-jouni@codeaurora.org> (Jouni Malinen's
 message of "Mon, 13 Sep 2021 20:55:08 +0300")
Message-ID: <87wnngy2ro.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_081108_085007_F1C92299 
X-CRM114-Status: GOOD (  14.74  )
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

Jouni Malinen <jouni@codeaurora.org> writes:

> From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
>
> Add IEEE80211_HE_6GHZ_MAX_AMPDU_FACTOR as per IEEE Std 802.11ax-2021,
> 9.4.2.263 to use for peer max A-MPDU factor in 6 GHz band.
>
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> ---
>  include/linux/ieee80211.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/linux/ieee80211.h b/include/linux/ieee80211.h
> index 694264503119..a1a7eda35cb5 100644
> --- a/include/linux/ieee80211.h
> +++ b/include/linux/ieee80211.h
> @@ -2084,6 +2084,7 @@ int ieee80211_get_vht_max_nss(struct ieee80211_vht_cap *cap,
>  
>  #define IEEE80211_HE_VHT_MAX_AMPDU_FACTOR	20
>  #define IEEE80211_HE_HT_MAX_AMPDU_FACTOR	16
> +#define IEEE80211_HE_6GHZ_MAX_AMPDU_FACTOR	13

Johannes, can I take this via my ath tree? I think that's the easiest as
the ath11k patches depend on this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
