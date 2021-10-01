Return-Path: <SRS0=G+gt=OV=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C96C433EF
	for <ath11k@archiver.kernel.org>; Fri,  1 Oct 2021 06:32:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DC8D61165
	for <ath11k@archiver.kernel.org>; Fri,  1 Oct 2021 06:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2DC8D61165
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SDui9UEo40fyuOcw/KDrCY4Vj+NP0kycave5spJLBSM=; b=BFmWe9S6EjH/lT
	N9pjzpsmhz8URL08lOJHC7HLelSFUrOkjtiazEup/1c+GPTDlwU8y+pUWVent4SoOHYWcuj6QksvN
	pKRSZdGIIL/DuULB8SSHZsrGN4ZT2EYNwTmMb9XhsRB3xHZFUamMIVp7nhJJJlEviX86AYcrPDQsU
	nYZSMMT1vAIhSeqP4UboIC3jlRIFO04hB+1I54N4a6KVyvVN1Ln0eEnMwASm0GrDduJhS2R6fp2So
	V54Ut5cq7m4JTG6MIHuLVYtPVCVNAfbwOBQXd8LGXz3YjWUUg5Rg4ZndxuFhXBlNsvvsWlEkH1YXD
	+e/CWQara0HodycoCWmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWC6K-00Go3p-4T; Fri, 01 Oct 2021 06:32:56 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWC6G-00Go2Y-W5
 for ath11k@lists.infradead.org; Fri, 01 Oct 2021 06:32:54 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633069972; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=yngI8d9kE9NDRbOqrv6sx2IfRNF26J+yF9N7nFydqCA=;
 b=blpWYsUjV6KTozgCRX19HN5KcX7gs0cXPH4MKPxs41d37jo2dou67ceVPuNYk7ecUWAYxQBX
 3Hsd6jS+ThSjlxopZ6v2Am7ioPWe9SpxkJ4uNNHS/g5o/5J2zn2grPE5kcrtF3Cxj2ikKvEQ
 v0WFdEujkIk5dK0Pi1VtXt5IDco=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6156ab9363b1f186582a5399 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 01 Oct 2021 06:32:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B946DC4360D; Fri,  1 Oct 2021 06:32:50 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E6926C4338F;
 Fri,  1 Oct 2021 06:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E6926C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Wen Gong <wgong@codeaurora.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH v3 2/2] mac80211: do intersection with he mcs and nss set
 of peer and own
References: <1609816120-9411-1-git-send-email-wgong@codeaurora.org>
 <1609816120-9411-3-git-send-email-wgong@codeaurora.org>
 <b6c96c4ecdf9ec175d7f89e8600fb53768287cc2.camel@sipsolutions.net>
 <facd18458a7ecfc0afbfd06c8a57d849@codeaurora.org>
Date: Fri, 01 Oct 2021 09:32:45 +0300
In-Reply-To: <facd18458a7ecfc0afbfd06c8a57d849@codeaurora.org> (Wen Gong's
 message of "Wed, 29 Sep 2021 11:20:01 +0800")
Message-ID: <87bl49mf02.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_233253_117881_DB64A504 
X-CRM114-Status: GOOD (  18.47  )
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

Wen Gong <wgong@codeaurora.org> writes:

> On 2021-09-28 21:02, Johannes Berg wrote:
>> Hi,
>>
>>
>> I had done a bunch of fixups to this patch, but the zero-day build
>> robot
>> correctly reports that:
>>
>>> +	ieee80211_he_mcs_intersection(&own_he_cap.he_mcs_nss_supp.rx_mcs_80,
>>> +				      &he_cap->he_mcs_nss_supp.rx_mcs_80,
>>> +				      &own_he_cap.he_mcs_nss_supp.tx_mcs_80,
>>> +				      &he_cap->he_mcs_nss_supp.tx_mcs_80);
>>
>> the &own_he_cap... parts here will take an __le16 pointer to a possibly
>> unaligned variable - any thoughts how we could fix that?
>>
> Hi Johannes,
>
> Add "__packed" before the "__le16 *" should solve this warning by my
> understand like this:
>
> diff --git a/net/mac80211/he.c b/net/mac80211/he.c
> index c05af7018f79..960fea9646b0 100644
> --- a/net/mac80211/he.c
> +++ b/net/mac80211/he.c
> @@ -52,7 +52,7 @@ ieee80211_update_from_he_6ghz_capa(const struct
> ieee80211_he_6ghz_capa *he_6ghz_
>         sta->sta.he_6ghz_capa = *he_6ghz_capa;
>  }
>
> -static void ieee80211_he_mcs_disable(__le16 *he_mcs)
> +static void ieee80211_he_mcs_disable(__packed __le16 *he_mcs)
>  {
>         u32 i;
>
> @@ -60,8 +60,8 @@ static void ieee80211_he_mcs_disable(__le16 *he_mcs)
>                 *he_mcs |= cpu_to_le16(IEEE80211_HE_MCS_NOT_SUPPORTED
> << i * 2);
>  }
>
> -static void ieee80211_he_mcs_intersection(__le16 *he_own_rx, __le16
> *he_peer_rx,
> -                                         __le16 *he_own_tx, __le16
> *he_peer_tx)
> +static void ieee80211_he_mcs_intersection(__packed __le16 *he_own_rx,
> __packed __le16 *he_peer_rx,
> +                                         __packed __le16 *he_own_tx,
> __packed __le16 *he_peer_tx)
>  {
>         u32 i;
>         u16 own_rx, own_tx, peer_rx, peer_tx;
>
>
>
> net/mac80211/he.c:158:33: warning: taking address of packed member
> 'rx_mcs_80' of class or structure 'ieee80211_he_mcs_nss_supp' may
> result in an unaligned pointer value [-Waddress-of-packed-member]

I don't know what Johannes thinks, but to me that looks like an ugly
hack. Wouldn't use get_unaligned() or similar be cleaner?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
