Return-Path: <SRS0=0MIV=NB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52598C4338F
	for <ath11k@archiver.kernel.org>; Tue, 10 Aug 2021 08:34:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 171A961075
	for <ath11k@archiver.kernel.org>; Tue, 10 Aug 2021 08:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 171A961075
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vz7Tj2uGG5A229NIVrAg3BybvuWpGXCEFNv77QflpPI=; b=kN3+cwg5K9GsjxHUZGSaTmHWcD
	LG5gsMbo8rch9AjWRiJgvmldKWfOkgKve6cUW0vC2HBNWthIJ3mAI51khDOvlxKLnCzoFBnltV9pS
	9nGKEtw8sqA7sjn6uHrPVReF7pwcuWex+yHuGqgZSjys8PfDk5klqqI2/zjmBKG1VQUMN/WvHqm8l
	XqB/nGOSPVXLcbTv1TbKUdQvU+oJdwgPtk2q4bVDaGHZXNuOQkgLSXdUgno8h+DyoPEEGVXBxPCOy
	OXtf+4GWa3Wg0fN10BeF+k0m3702TSNIWWeW7aqeCCHtSDLCcVI5r5wm2tYnLGscXUseLce87s4W8
	YRTZm8Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDNDL-0032QW-UV; Tue, 10 Aug 2021 08:34:24 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDNAy-00314U-An
 for ath11k@lists.infradead.org; Tue, 10 Aug 2021 08:32:00 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628584313; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=k8fAPXmJhs2qAvhPhJBwaZE1UtzhiWWsv7aTQpRafF8=;
 b=nWongZVKH0Gr9XXOzFJGm+FPm7wUzAmGzZkX0UoAKLPwBEAA8nDA0h4yieXU/iFRPWdw3Q6J
 KtLm2UDcVbN34ib7McxnUr6agacSh4P1zOvuEF2zY9fwORIX6mfXshVGCVaup+tMAIpFU14P
 AJ/n6KTQUtj2Re7PVxQ4neRlq98=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6112396bb14e7e2ecbb0e321 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Aug 2021 08:31:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 53886C43148; Tue, 10 Aug 2021 08:31:38 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mkenna)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C64CEC43143;
 Tue, 10 Aug 2021 08:31:37 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 10 Aug 2021 14:01:37 +0530
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v4 1/3] nl80211: Add support for beacon tx mode
In-Reply-To: <f14e6e6b81978ace4580774981a7e032b4001182.camel@sipsolutions.net>
References: <1623164855-15910-1-git-send-email-mkenna@codeaurora.org>
 <1623164855-15910-2-git-send-email-mkenna@codeaurora.org>
 (sfid-20210608_171052_201356_8AEA5406)
 <f14e6e6b81978ace4580774981a7e032b4001182.camel@sipsolutions.net>
Message-ID: <65b594ccab0a30bfb5bc2122cbf73f20@codeaurora.org>
X-Sender: mkenna@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_013156_502166_F7445700 
X-CRM114-Status: GOOD (  17.62  )
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

On 2021-06-23 16:46, Johannes Berg wrote:
> First, I'd like to see some input from other vendors - is this useful?
> 
> I have no objections to it and it comes with an in-kernel driver, so 
> I'm
> inclined to accept it, but maybe we should have other modes, etc.?
> 
> 
>> + * @NL80211_ATTR_BEACON_TX_MODE: used to configure the beacon tx mode 
>> as
>> + *      staggered mode = 1 or burst mode = 2 in %NL80211_CMD_START_AP 
>> or
>> + *      %NL80211_CMD_JOIN_MESH from user-space.
> 
[Maha]: will replace the hard-coded values with enum here.
> 
> This should refer to the enum, not the hard-coded constants.
>> 
>> +/**
>> + * enum nl80211_beacon_tx_mode - Beacon Tx Mode enum.
>> + *      Used to configure beacon staggered mode or beacon burst mode.
>> + */
>> +enum nl80211_beacon_tx_mode {
> 
> 
> That's missing kernel-doc, and you also don't specify what default
> means. Why is it even here?
> 
[Maha]: sure, I will add the same in the kernel-doc.
>> +	[NL80211_ATTR_BEACON_TX_MODE] = NLA_POLICY_RANGE(NLA_U32, 1,
> 2),
> 
> That really also needs to use the enum, not hard-coded constants...
[Maha]: will replace the hard-coded values with enum also here.
> 
> johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
