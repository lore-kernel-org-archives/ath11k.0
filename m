Return-Path: <SRS0=Dsd9=FU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB633C4361B
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 15:46:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B97322B40
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 15:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B97322B40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XDHLVGi0FRuSe6wQnrgOi2ikkC563cGAYW1yG6v0UkA=; b=k7Yo3qACH6ZiOezovP+2G6U3f
	Bpmv2omQCoq9ldRupveCjovPkNQci8b1aXaLRppLU7Qnqd/MtvKkpUSdn/RKLRMlu/HB6wR6W1LkO
	NEEkBXm00h9UagHsPFioX9mTIfVGaHFL2LrFucnbyJaYOcJgmRtCFeOVO30tM45kn019Q/JfOzIDs
	x8p1DfVdZ2aYFyvHLgCslEJvP4+VdrKZtKOwHkwRNcdlP1+zTS0htpLd4+4NUT20H8Mfe2j8p72gI
	VKN5zU1ZIU4oZnaEG/CtIIWqfv8b7VwSqw6TNvL7bLctaLTIS/N7X7A/iYCd9As0Doz2lxtigBKww
	3yI6vr+aQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpZ0R-00056o-OQ; Wed, 16 Dec 2020 15:46:23 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpZ0O-00056H-RQ
 for ath11k@lists.infradead.org; Wed, 16 Dec 2020 15:46:22 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608133581; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=FMEuiaMLzsThBtmoQIOEeIhb9F1PnaHsdISh+r3Xbok=;
 b=qQoVKToQ98134MiGKQoeaVBMKMS4tOAFEwgfxJt/+Xs5zx/AdE1CaSGv+KMqb0dTGTSh2G0o
 KdHkYVRaH8u/t+Ln4mxqKHcN0nyihz9GFYzvMPKB3IogMqdMHocCF7OEPossbhlSh3yFgXy9
 B+5GQs/jhDX63EXZ+GHMHIU2rwQ=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5fda2bc8f5e9af65f8ce792b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 16 Dec 2020 15:46:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E0714C43461; Wed, 16 Dec 2020 15:46:15 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 904B1C433CA;
 Wed, 16 Dec 2020 15:46:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 904B1C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Mitchell Nordine <mail@mitchellnordine.com>
Subject: Re: Ordering Dell XPS 13 9310 to test QCA6390
References: <tQQZLjnfaM2XZ-LdgoSYE_9yQQmGCtzT108xBh-SzpRhHN7o6_w_jdIcfp67hVNe-kkiNC72u_rhyo1AtUw-41nvcCo_K3pUhkR__6VF6ig=@mitchellnordine.com>
Date: Wed, 16 Dec 2020 17:46:12 +0200
In-Reply-To: <tQQZLjnfaM2XZ-LdgoSYE_9yQQmGCtzT108xBh-SzpRhHN7o6_w_jdIcfp67hVNe-kkiNC72u_rhyo1AtUw-41nvcCo_K3pUhkR__6VF6ig=@mitchellnordine.com>
 (Mitchell Nordine's message of "Wed, 16 Dec 2020 14:41:10 +0000")
Message-ID: <87mtydwy7v.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_104621_359872_471991F5 
X-CRM114-Status: GOOD (  18.12  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Mitchell Nordine <mail@mitchellnordine.com> writes:

>> But I have now ordered Dell XPS 13 laptop and I should get it in
> three weeks, keeping fingers crossed. That should make things easier
> as I can test patches myself.
>
> Hi Kalle, you may already be aware of this, but I just wanted to make sure!
>
> Not all Dell XPS 13 9310 laptops come with the AX500 connectivity chip
> (the one that uses the QCA6390). It seems that only the models with
> 32GB RAM tend to come with the AX500 wifi chip.
>
> Most models appear to come with the AX1650 which I believe uses a
> totally different chip and driver that is already well supported in
> Linux.
>
> It might be worth double-checking the model that you have ordered has the AX500.

I had heard about that so I did order the 32 GB RAM model and multiple
times specified that I only want AX500. So I'm optimistic that I should
get the right chip, but you never know how it goes :) Thanks for
checking, though!

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
