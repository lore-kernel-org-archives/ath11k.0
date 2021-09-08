Return-Path: <SRS0=P3pu=N6=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E75C433F5
	for <ath11k@archiver.kernel.org>; Wed,  8 Sep 2021 07:02:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BADC60F13
	for <ath11k@archiver.kernel.org>; Wed,  8 Sep 2021 07:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BADC60F13
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KY34XdlgOF7SpmQ2OnPELq98zxZ+/IOjh3SF1x1ysNQ=; b=0fAadNl0PjS/WF
	BBbXTzJSTGWHFCQPGJJsaRxgDZztNTs3FHqvFqWepPt9wLkVFYLSA8xuTpuvKqOQbke5qtTKuNGwO
	Re8n+TkfxZrrHh7Xi5FWOxqC9ZyxOeH2zu/2FPFUhA1oXw8jsabvMmiNlDcq93Ba8yAdzygGUecgM
	FFkYn9Lrw7DGc16i4sOI/ycMzLMBBHDvmGt0BxrcqKOcP95ooHr+nihcv/e0A9zblGQx28Bzy+Hsf
	AdEh9SOA4yfXqoAr+osObBgj/twDh1oG8vtKwnIPBT7tudW8gL42F0gsr0JZsSUFe7z467E6MAQo7
	MN5r6+6F7JvhEivW5xHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNrbb-005iGp-MP; Wed, 08 Sep 2021 07:02:47 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNrbX-005iFF-60
 for ath11k@lists.infradead.org; Wed, 08 Sep 2021 07:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=Q0KHHmxu2WaJvT/esI5VxK/+UvFQVdEa/RWMgw4p4NM=; 
 t=1631084562; x=1632294162; b=hAJQgFA0GgnhcowQhbO2k/344oFEzb6C2re7OQNik5RCtQP
 yJtxzAzD6cc80g9k4mVWvLSs827FoyaUHojPGME3Xx8ajS0h6JKRva30oV/8+6sV/RdlV1rKavd17
 D38BuvVxZ/Sw6tcqhK1DFiivlJyd9NyPNoypHdAIhXxfoeG4/Wfmr8gNCtJpGd1nDkTcwXQG1vFS2
 xqFHj0eVyWPfTFlw6Q4y6BEePO6pJPxhYhAYYjD2w9Bt3mc+e8ZVi97Ao2K241ZIJ52eUS4NaRc6l
 +V4kG2193BToyx3VSvSM+w9fPw1gJnVQpViJ+mxO3dU4HXg/8zHX7KO+/bWmogYw==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95-RC2) (envelope-from <johannes@sipsolutions.net>)
 id 1mNrbT-004EDB-O2; Wed, 08 Sep 2021 09:02:39 +0200
Message-ID: <55cfbf94d90c678501b4144484348bd9ebd005fa.camel@sipsolutions.net>
Subject: Re: [PATCH] cfg80211: AP mode driver offload for FILS association
 crypto
From: Johannes Berg <johannes@sipsolutions.net>
To: Subrat Mishra <subratm@codeaurora.org>, linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org
Date: Wed, 08 Sep 2021 09:02:38 +0200
In-Reply-To: <1631083922-24136-1-git-send-email-subratm@codeaurora.org>
References: <1631083922-24136-1-git-send-email-subratm@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_000243_302473_26BD43FB 
X-CRM114-Status: UNSURE (   5.22  )
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


> +	TP_STRUCT__entry(WIPHY_ENTRY
> +			 NETDEV_ENTRY
> +			 __array(u8, macaddr, ETH_ALEN)
> +			 __field(u8, kek_len)
> +	),
> +	TP_fast_assign(WIPHY_ASSIGN;
> +		       NETDEV_ASSIGN;
> +		       FILS_AAD_ASSIGN(fils_aad);
> +	),

I don't think we typically do the alignment like that?
johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
