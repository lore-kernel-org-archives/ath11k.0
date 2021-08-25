Return-Path: <SRS0=KApm=NQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1FDC4338F
	for <ath11k@archiver.kernel.org>; Wed, 25 Aug 2021 02:18:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A85A86101C
	for <ath11k@archiver.kernel.org>; Wed, 25 Aug 2021 02:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A85A86101C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfPYWvu0OsFWZw4C9NGr42HWOjcWwQjzpiiuKw1RKHs=; b=0pdd5knw+VYYqwE+f+eZ3uaYpf
	RBMTCRPDr8aWkF1gcJzLaJkJFkeQG4qHVg9oXnawS85FB5oqAOW7/MTcdN18hOqKuGLtpyMeFG7kG
	duUonqXCLAJSIDJsKm3AVMlzTfcLqqrzqj6L28lq4T1paejaN2bbD7+3bdGmRrlswFuGfWfWI40BH
	UPcSAgR4RmIVxDiBA9t/AS4e+0CJLvyjEA5QWOpFxtKFSRUUJRhSO9PCU3x/T2Ppb2gEa868WeAfn
	DVmW8wzv3/opsIDNR2sCAJ+RwYcHlzTbffnrL9SfeoDb3EfciAerdoZ5Zig8MPZOCqRuvfQEsgm1E
	59rkXwzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIiUk-005DOo-Tj; Wed, 25 Aug 2021 02:18:26 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIiUf-005DMq-BE
 for ath11k@lists.infradead.org; Wed, 25 Aug 2021 02:18:25 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629857900; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=zkMf6TvHMYWGClNY/J3MKCa7YlhEPpJW5voKdcIkmC8=;
 b=Q/wMLorw5L2mt6Sd8GPGzRKQHNgD2jw3FGO75VBeeIArcD1VWdKEOJVkBkVeoUWneNrrym1/
 QAJ6OqwVvrTm/mNRO0unljlxR232YI4cd5bprcP9b0Mx8TEOncvCLNOq6Z6DZAHWs1JyLUCr
 ZATHqlh9LJpbXHynK6fGStAKltc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6125a86ac603a0154f907c38 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 25 Aug 2021 02:18:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 86428C4360D; Wed, 25 Aug 2021 02:18:17 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 40443C4338F;
 Wed, 25 Aug 2021 02:18:17 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 25 Aug 2021 10:18:17 +0800
From: Wen Gong <wgong@codeaurora.org>
To: johannes@sipsolutions.net, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 0/8] cfg80211/mac80211: Add support for 6GHZ STA for
 various modes : LPI, SP and VLP
In-Reply-To: <20210820122041.12157-1-wgong@codeaurora.org>
References: <20210820122041.12157-1-wgong@codeaurora.org>
Message-ID: <6589258be9fd32d2ac5b364c69c4c25a@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_191821_506744_23DF2809 
X-CRM114-Status: GOOD (  15.85  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi johannes,

Could I get your comments on this v2 patches?

On 2021-08-20 20:20, Wen Gong wrote:
> v2: change per comments of johannes.
>     including code style, code logic, patch merge, commit log...
> 
> It introduced some new concept:
> power type of AP(STANDARD_POWER_AP, INDOOR_AP, VERY_LOW_POWER_AP)
> power type of STATION(DEFAULT_CLIENT, SUBORDINATE_CLIENT)
> power spectral density(psd)
> 
> This patchset for cfg80211/mac80211 is to add the definition of new
> concept of 6G and add basic parse of IE(transmit power envelope
> element) in beacon and save power spectral density(psd) reported
> by lower-driver for 6G channel, the info will be passed to lower
> driver when connecting to 6G AP.
> 
> Wen Gong (8):
>   cfg80211: add power type definition for 6 GHz
>   mac80211: add definition of regulatory info in 6 GHz operation
>     information
>   mac80211: add parse regulatory info in 6 GHz operation information
>   cfg80211: add definition for 6 GHz power spectral density(psd)
>   cfg80211: save power spectral density(psd) of regulatory rule
>   mac80211: add definition for transmit power envelope element
>   mac80211: add parse transmit power envelope element
>   mac80211: save transmit power envelope element and power constraint
> 
>  include/linux/ieee80211.h    | 43 +++++++++++++++++++++++++++++++++++-
>  include/net/cfg80211.h       |  7 ++++++
>  include/net/mac80211.h       |  6 +++++
>  include/net/regulatory.h     |  1 +
>  include/uapi/linux/nl80211.h | 36 ++++++++++++++++++++++++++++++
>  net/mac80211/chan.c          |  9 ++++++++
>  net/mac80211/ieee80211_i.h   |  3 +++
>  net/mac80211/mlme.c          | 26 ++++++++++++++++++++++
>  net/mac80211/util.c          | 19 ++++++++++++++++
>  net/wireless/reg.c           | 14 ++++++++++++
>  10 files changed, 163 insertions(+), 1 deletion(-)

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
