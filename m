Return-Path: <SRS0=d2dB=OO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BACAC433F5
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 11:42:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6C3F610F7
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 11:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6C3F610F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ZOCnTbQ+PhAnP8PiN8PkeIUX8hc9v0B9aHYrLILFSk=; b=XUJwW/kzoHwGNk
	/6cHYZjlhxjcEqX2ovv4mdfyqTyEpizY+WN9Te8VAEsfC0oTid3lpQ13fTekC9BN413JdATzV8iKN
	ilXMNkC2zfXO2LTAvjsZDbSMFZQoqSZjUPwDAOTC2pDBos51unFo2Dv2TVd+sA/LSKO/hPuvIaym0
	xwp/H8Sh7zeS+RTMfG5x5e6vOkngAiLwlVpRcRuMwlyePLIDiS0/iz2KUZISEiY2OK7DyxrFTg84B
	15YUCr6MgvOWUn3zzBPNV7EQciqdHWXTDfIMQB7KlMOU3PRnK/OeaTqG3uhQs5QA+zzinJYtJJ+Dt
	enRuH57LIyglh9WepLmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTjbM-00ECot-Qt; Fri, 24 Sep 2021 11:42:48 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTjbG-00ECoA-TE
 for ath11k@lists.infradead.org; Fri, 24 Sep 2021 11:42:47 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632483766; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=TgPPiU8FzCiwkjppsnivhrcsijXGBLVcDNb+SLVumXg=;
 b=RIAIpoGkgIILItA13guuIIHIUtHI1qlLQ+BPhj9XIHyuysVCxkzlLNbI5KIhYAencHqfR5p2
 rrdl9yTQOeRLfKVk/lXbEp90e9G5/U3dl1c2vmCVLLQVbDRFmNtBDBOSFskBdmd0a2ruvGVc
 G66kYcViYjRd+f+tyvLBplftl7E=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 614db9ad6c4c0e0dc3dc2126 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Sep 2021 11:42:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9903AC4338F; Fri, 24 Sep 2021 11:42:36 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E09E5C43460;
 Fri, 24 Sep 2021 11:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E09E5C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Anilkumar Kolli <akolli@codeaurora.org>
Subject: Re: [PATCH 1/3] ath11k: add htt cmd to enable full monitor mode
References: <20210721171905.61838-1-jouni@codeaurora.org>
 <20210721171905.61838-2-jouni@codeaurora.org>
Date: Fri, 24 Sep 2021 14:42:31 +0300
In-Reply-To: <20210721171905.61838-2-jouni@codeaurora.org> (Jouni Malinen's
 message of "Wed, 21 Jul 2021 20:19:03 +0300")
Message-ID: <87tuiaryhk.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_044246_675480_582FFCA5 
X-CRM114-Status: GOOD (  10.54  )
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

> From: Anilkumar Kolli <akolli@codeaurora.org>
>
> Add a new hw_param full_monitor_mode to enable full monitor support for
> QCN9074. HTT_H2T_MSG_TYPE_RX_FULL_MONITOR_MODE cmd is sent to the
> firmware to enable the full monitor mode.

Nowhere it's explained what "full monitor mode" means from an user's
point of view. Can someone give a high level summary what advantages
this feature has? For example, more frames delivered to user space or
what?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
