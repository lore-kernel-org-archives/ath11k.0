Return-Path: <SRS0=bbE0=MP=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9771FC432BE
	for <ath11k@archiver.kernel.org>; Fri, 23 Jul 2021 09:22:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B6E960EE2
	for <ath11k@archiver.kernel.org>; Fri, 23 Jul 2021 09:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B6E960EE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SC8aI/+U2lzNojgwYZcwaYmzXqWf4hzy/+jDyc9l2Lo=; b=sGMFnWp/sDTpja
	CqorZGNZVVB8w57gDA1n+tKc41YRIFwbE+tao7cGcp9xWjTF+nzkrQN6rMt2tukMQXpk9KuGwQ4z1
	6EtJCcXFX0yF1ejV+1XTNEW5SaQ0W6LwatgM9cWYN16tUNotZWBAZS6waJSPCmJ+7Fb9chfW4OZlb
	/oHuS8pA/YWJs+eBLCM5mg2hke0X3OqcTw6RDjp6VYlVlhdwCmM6/Q4UxxIle+3ISksXoQFze1vx/
	Un1514hiL1cgwTF7mLEbxZqwq4J9mMqu+SrUSTnD+4eTw77tTpV/NjIt00wL9UnXSRSCMW61uPCqh
	lgeuddXbvfqr2qQk3VDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6rNm-0046H9-K3; Fri, 23 Jul 2021 09:22:14 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6rNk-0046GK-7u
 for ath11k@lists.infradead.org; Fri, 23 Jul 2021 09:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=stU9pJoPalbyezozxSsqWZmSpy/iGnZV6lWR6Vk9KtY=; 
 t=1627032131; x=1628241731; b=DrBR1s3EMIWmnR1Uk1/8XM73ESUIuKruC1kShPp0m3Hs2BE
 qypIfhpr0DWhJ4MZ+52vqMudkFw9VWnzt/a6yKV0ZTrqXdrs0TzvOiLSbjIEakFMArlsvMqdVpmTz
 NzZSgoRrv8yda0TViauekFmLe2CZo9WbmddBy1D0OpmTuZGT5L2OC35+IM6w4iqA2WylizAFIK27W
 WJw+DOUUqVIlKHm8Tp+zRgHHHuw/v6IPwaX6NXe7ZU34klZfURF+aP/jvYbql0WkOuAcfRfyq6QbN
 5giJqQll2ztWuZMdAJMxtqSICFQh3aErsWlRw+uxIkWcEKzcZynzLVyFwHhVrUrw==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1m6rL7-000TwL-LR; Fri, 23 Jul 2021 11:22:08 +0200
Message-ID: <fccc9724374281d2d95e1ef52391788892552268.camel@sipsolutions.net>
Subject: Re: [PATCH 1/9] cfg80211: add power type definition for 6G Hz
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Fri, 23 Jul 2021 11:22:07 +0200
In-Reply-To: <20210517201932.8860-2-wgong@codeaurora.org>
 (sfid-20210517_222034_404094_2413CDB0)
References: <20210517201932.8860-1-wgong@codeaurora.org>
 <20210517201932.8860-2-wgong@codeaurora.org>
 (sfid-20210517_222034_404094_2413CDB0)
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_022212_333194_2C3069C0 
X-CRM114-Status: UNSURE (   7.97  )
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

Hi,

Sorry it took me so long to look at this. I started earlier, but then
found some questions and then ... sorry.

> 
> +/**
> + * enum nl80211_ap_reg_power - regulatory power for a Access Point
> + *
> + * @NL80211_REG_UNSET_AP: Access Point has no regulatory power mode
> + * @NL80211_REG_LPI: Indoor Access Point
> + * @NL80211_REG_SP: Standard power Access Point
> + * @NL80211_REG_VLP: Very low power Access Point
> + */
> +enum nl80211_ap_reg_power {
> +	NL80211_REG_UNSET_AP,
> +	NL80211_REG_LPI_AP,
> +	NL80211_REG_SP_AP,
> +	NL80211_REG_VLP_AP,
> +	NL80211_REG_MAX_AP_TYPE = 3,

That last one is missing docs. Also, why should it be numbered
explicitly? Better add something like

	NUM_NL80211_REG_POWER_TYPE,
	NL80211_REG_MAX_TYPE = NUM_NL80211_REG_POWER_TYPE - 1

or something?


> +enum nl80211_client_reg_power {
> +	NL80211_REG_UNSET_CLIENT,
> +	NL80211_REG_DEFAULT_CLIENT,
> +	NL80211_REG_SUBORDINATE_CLIENT,
> +	NL80211_REG_MAX_CLIENT_TYPE = 2,

same here.

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
