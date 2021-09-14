Return-Path: <SRS0=aNMw=OE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05013C433F5
	for <ath11k@archiver.kernel.org>; Tue, 14 Sep 2021 05:53:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7776B60F6D
	for <ath11k@archiver.kernel.org>; Tue, 14 Sep 2021 05:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7776B60F6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ut9nxqpxDDMDBPnFhvXGTMpaJ1rRD6Nez7uEbe7Wy3M=; b=MfxeDzSelWiR2U
	sdwDrZ4yR1oFxiZXPwvIJ8Cdue+p55K5i01puABs+jtlvOTzjrq7QY3NPzS/p7QU1wKfqBg6TEO1T
	EheDddESf5eek11YyxVdaMGRVmRQk65AGwQRFRbHfHvb5fseBdvq+avnm0tsrETPxufVnkEfpM4oV
	0mGXv9WUZ3+6nB5d5TQnWIQbUTFaDuOCbBOPH0IWXMhxJl04lPbjn4dwVccIGGfyjiZ/q5scPcxmQ
	v+n4+5IGrPzIFAkeAJuYDXNG5P/aw240nd99t8PpWx3Ty5rJdjACEDQwL+vRQzDSJs5f26bbqYgLb
	+/qemDRuTz6UP85Fazog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ1Nw-004EhK-MI; Tue, 14 Sep 2021 05:53:36 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ1Nu-004Eh0-8Q
 for ath11k@lists.infradead.org; Tue, 14 Sep 2021 05:53:35 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631598812; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=Y0jKmufl/3kPY1ZSvF6Mf1XG2MS8H/dyzGSW4oGt8eA=;
 b=QuUhlcChzzhLfaH24wGHi1QGxagl9zZrD7CoqHKc7Bo5Mcr8b8XK7F+XuGDrY8kOZyNZkW1h
 anK5RkgvyqBerhVx1NvfxPh03tYHZ96iG7w5DHFCL5PJSHacxjIuxKEmTpGp58rHSEV7C6ba
 y2LLIFWizVk0qvbTurPPoPJOXGA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 614038d9507800c880e33474 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 14 Sep 2021 05:53:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5F917C43617; Tue, 14 Sep 2021 05:53:28 +0000 (UTC)
Received: from tynnyri.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 701F2C4338F;
 Tue, 14 Sep 2021 05:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 701F2C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Len Baker <len.baker@gmx.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Kees Cook <keescook@chromium.org>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ath11k: Replace one-element array with flexible-array
 member
References: <20210904114937.6644-1-len.baker@gmx.com>
 <20210912193140.GC146608@embeddedor>
 <7a9ba7d3-b5e7-00ab-3bd3-7fca476aae94@embeddedor.com>
Date: Tue, 14 Sep 2021 08:53:21 +0300
In-Reply-To: <7a9ba7d3-b5e7-00ab-3bd3-7fca476aae94@embeddedor.com> (Gustavo A.
 R. Silva's message of "Sun, 12 Sep 2021 14:42:39 -0500")
Message-ID: <877dfj8zzi.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_225334_411688_80C4DCD8 
X-CRM114-Status: GOOD (  12.06  )
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

"Gustavo A. R. Silva" <gustavo@embeddedor.com> writes:

> On 9/12/21 14:31, Gustavo A. R. Silva wrote:
>> 
>> There is already a patch for this:
>> 
>> https://lore.kernel.org/lkml/20210823172159.GA25800@embeddedor/
>> 
>> which I will now add to my -next tree.
>
> Well, in this case I think it's much better if Kalle can take it. :)

Please don't take any ath11k patches. I have a ton of ath11k patches in
my queue and if you start taking some of them, it will cause conflicts
between trees.

Only take wireless-driver patches which I have acked, please.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
