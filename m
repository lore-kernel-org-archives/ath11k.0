Return-Path: <SRS0=lr6B=NS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D4EC432BE
	for <ath11k@archiver.kernel.org>; Fri, 27 Aug 2021 02:11:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5371A60FD8
	for <ath11k@archiver.kernel.org>; Fri, 27 Aug 2021 02:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5371A60FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+styXEpPwehfbFRTGntHMvlknCNs2NrmGgSw6uNFgY=; b=HrhEtg3JHIdoSy+CmmvgpJZz5I
	URmFB22tXP0SV0dvgoqAhmArN/hlfLSHSO1rmgXTroOZUUxXKShT4U93YESQnbJBSnTbC0lIocW1+
	2qGUi77lQqlEGaa7M1LZ+pitzYQ+AnlGeO8+btYW42Zt7ZhX3C57mBkUjCSWgcTFG12/Lwl/zQtFp
	4K7QJgBANMm+VTQqlt3UHPp8CUp7Q1UBwpq4JtT0HSuGWkvOvRZh4iZLunAGufKY1ZzJi0y7TJurf
	3lGE6kwDlfs/RHMdw6sK+9VHQmNl8vp+CSMVrDTXG28Sx4ux+R75T4T6qtpkPoI403nKCqW420heq
	fiz13Y1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJRLS-00BM7R-B4; Fri, 27 Aug 2021 02:11:50 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJRLM-00BM6q-K8
 for ath11k@lists.infradead.org; Fri, 27 Aug 2021 02:11:48 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630030304; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=fISNtX8wZGZ+2uDcr9S040FeGsG7DbFo4sejr04LNQ0=;
 b=Huxvrzz+adk84KtyCf9jUH2nIqo255urjYAmt9Z7e0Q9qkAPV3FmhZA5ED1y7N/tZSwHZJLh
 c7GwV4CGqxo6BXdA+iZuS33KyjePQOfLOeUmDl4Ba79hu329j/nTWj78AoVJVS/tGV4wxSTl
 GwoTbvuD8gorNq/wIKMLpKCiQo8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 612849ded6653df76710e86b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 27 Aug 2021 02:11:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 23268C43460; Fri, 27 Aug 2021 02:11:42 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 104A3C4338F;
 Fri, 27 Aug 2021 02:11:40 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 27 Aug 2021 10:11:40 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 8/8] mac80211: save transmit power envelope element and
 power constraint
In-Reply-To: <dfe27f657b4615369cf751d394f5cba75f5fdcc1.camel@sipsolutions.net>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-9-wgong@codeaurora.org>
 <dfe27f657b4615369cf751d394f5cba75f5fdcc1.camel@sipsolutions.net>
Message-ID: <25fcede26b99604a03d0b321b7120db4@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_191144_779588_1C7AF02F 
X-CRM114-Status: GOOD (  11.59  )
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

On 2021-08-26 16:29, Johannes Berg wrote:
...
> 
>> +		if (is_6ghz) {
>> +			struct ieee802_11_elems elems;
> 
> This is pretty big, not sure we want it on the stack (causes warnings
> for me in build). Also, if we're doing this anyway, then we can change
> the code above (perhaps as a separate patch) to not do
> cfg80211_find_ext_ie() but rather take it out of the parsed.
do you mean NOT use cfg80211_find_ext_ie()/cfg80211_find_ie() and still 
use "struct ieee802_11_elems elems" here and
move this code to a separate function/patch?
it has more than one tx_pwr_env in one beacon, if we use 
cfg80211_find_ext_ie()/cfg80211_find_ie(),
it need add more logic.
> 
...
> 
> johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
