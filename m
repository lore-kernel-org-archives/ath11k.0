Return-Path: <SRS0=Dsd9=FU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1593C4361B
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 14:41:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 686262339F
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 14:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 686262339F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mitchellnordine.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:From:To:Date:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bjgS2VU7u4Dly80ukU1/drJvFX70xrAhQ7Wd9/f6cdw=; b=N1kqRl+3brvzyCsQ6hgTAZVa+q
	v5lVWnS5bO6HFbCE0ToFefBAv81xX/lYrQ6Y1FWPsOW/9o5SjSMO+HQANwjt+jooQgaQ7R+lyo4JX
	xBl4dffWSrm7Wd9BCt+EbkK66aXToTUTfMNbe3uARW0VgPGaggwkFdUv38dMNAwPuHQd6HsPnvvwW
	QAYP3DQ9dI9ct2JtRu94e/JzHED5BRdXVgURQ1AzXsPvIFYL3mzRqL6VnVMweUjAwuYhICAz7ioSN
	uh8Cn8RLBeC9B4EIa5ONWpcwoEwlt7mzCvHHwHJ8dm1JNW1VKa2eI8W954HczILvUagCqJYzYdhNi
	Sl+cVrVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpXzW-0000cr-7x; Wed, 16 Dec 2020 14:41:22 +0000
Received: from mail-40136.protonmail.ch ([185.70.40.136])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpXzT-0000cO-DE
 for ath11k@lists.infradead.org; Wed, 16 Dec 2020 14:41:20 +0000
Date: Wed, 16 Dec 2020 14:41:10 +0000
Authentication-Results: mail1.protonmail.ch; dkim=none
To: Kalle Valo <kvalo@codeaurora.org>,
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
From: Mitchell Nordine <mail@mitchellnordine.com>
Subject: Re: Ordering Dell XPS 13 9310 to test QCA6390
Message-ID: <tQQZLjnfaM2XZ-LdgoSYE_9yQQmGCtzT108xBh-SzpRhHN7o6_w_jdIcfp67hVNe-kkiNC72u_rhyo1AtUw-41nvcCo_K3pUhkR__6VF6ig=@mitchellnordine.com>
MIME-Version: 1.0
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_094119_586205_997FC130 
X-CRM114-Status: UNSURE (   5.35  )
X-CRM114-Notice: Please train this message.
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
Reply-To: Mitchell Nordine <mail@mitchellnordine.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

> But I have now ordered Dell XPS 13 laptop and I should get it in three weeks, keeping fingers crossed. That should make things easier as I can test patches myself.

Hi Kalle, you may already be aware of this, but I just wanted to make sure!

Not all Dell XPS 13 9310 laptops come with the AX500 connectivity chip (the one that uses the QCA6390). It seems that only the models with 32GB RAM tend to come with the AX500 wifi chip.

Most models appear to come with the AX1650 which I believe uses a totally different chip and driver that is already well supported in Linux.

It might be worth double-checking the model that you have ordered has the AX500.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
