Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFE7C47DDB
	for <ath11k@archiver.kernel.org>; Fri, 26 Jan 2024 16:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKLHux/IE7sPK/mloWRl9Hoqep0/ysIxzP34g3kpR94=; b=paLATKKmktYqAIyEG31M1iQ3ms
	dE/rQk4/Ldzp0LEbDwVMa6FfXWoB7rRRKUH4e/KJD1+J8+MSGJ3B1bixW7tTjcrNUnI/4+ilGlog4
	h7p4V/FmwpT4oTZGXZwwWw4stPfMvw2IQ5y/odhpAv86+5BDvV5ZblL4/RxQ1ikzSjIgTJV+7pnHQ
	+0isMrPoLU5YmCAgN7zos9AYX7qpE4D0ibZuuFUlUkU8tlRBH8oUGoeoCv6qVP0dl7yUNvgqMSxDJ
	NonsTEzLgpkzWpHcFJcihrWHPu/uoFNtITL40qbB8Qw6Y5oH1Zatcof3nUJgTOxWmYsHBqPkMo3mT
	VuQHGE3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTPWx-00000004ltC-3gAJ;
	Fri, 26 Jan 2024 16:58:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTPWt-00000004lrZ-2cn1
	for ath11k@lists.infradead.org;
	Fri, 26 Jan 2024 16:58:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B490ACE370A;
	Fri, 26 Jan 2024 16:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B248C433F1;
	Fri, 26 Jan 2024 16:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706288284;
	bh=LKbSijtIdNMn8T6q3qa1VMH8YHHC0Jz5qhIZ/xmxj3A=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=mlPUSpF0KMNRqGwNPiq9jyj0+UKTFguItIwVOYO/wZgm9zy85NsNCfLWyCuG4XJlz
	 6JGOlrujCsunFHkq8hHXDdE2wo/yKPM2l508uz72EJSEdLqcNfZFncsrF6kjD4lcw2
	 H2RUFomJcvY40RDLIw6/CfCMpzxJge4Cfuy5I6vGPaumlPBxi63/XtEYqADPywX4+F
	 a6tv8XEI7Ts6U+GDlXUQoNT0J5p3OAscsu9wqoy2pu7hZGT7WSsnpqvdT/wY/vZG0n
	 qcqLpUazDVSeaZQAOktqQJI0tkqaVrJmhfTtL9mbBBw8NMVFFAmVnvb2Z9x9URIy1V
	 A9s471DVsIrWg==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath11k: document HAL_RX_BUF_RBM_SW4_BM
References: <20240111-document-hal_rx_buf_rbm_sw4_bm-v1-1-ad277e8ab3cc@quicinc.com>
	<874jfg7xm4.fsf@kernel.org>
	<b4f29511-e001-4964-b88d-208dabf88121@quicinc.com>
	<875xzq526o.fsf@kernel.org>
	<fc6ca019-83e9-4571-bfce-2b4e5c233aef@quicinc.com>
Date: Fri, 26 Jan 2024 18:58:01 +0200
In-Reply-To: <fc6ca019-83e9-4571-bfce-2b4e5c233aef@quicinc.com> (Jeff
	Johnson's message of "Thu, 18 Jan 2024 07:44:10 -0800")
Message-ID: <87ttn0xc9y.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_085812_059406_FFCC9FCE 
X-CRM114-Status: GOOD (  29.43  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 1/18/2024 3:08 AM, Kalle Valo wrote:
>> * To make sure there are no kernel-doc warnings we would have to add
>>   checks to ath11k-check, which would slow down it considerably and it
>>   would again slow down our workflow (I run it several times a day).
>
> I currently run the following on every upstream patch series I review:
>
> scripts/kernel-doc -Werror -none \
> 	$(find drivers/net/wireless/ath/ath1*k -name '*.[ch]')
>
> It takes a trivial amount of time.

Hehe, indeed. It takes 0.2 seconds on my workstation, that's fast enough
for me :)

Thanks for the idea, I added this to ath12-check:

https://github.com/qca/qca-swiss-army-knife/commit/ef11ea4c7a866247f23f3d0825f9b08bd29c4989

So from now on I will always run kernel-doc for ath12k.

>> * To use kernel-doc formatting alone doesn't really make sense so we
>>   would have to start creating a kernel-doc book or something. But who
>>   would read it?
>
> Due to the sparseness, nobody would read the actual rendered
> documentation; only the documentation as it exists in the code would be
> read. However note that Linux cross-reference tool also links to the
> documentation, which I often find useful when looking at core kernel
> code, and would find it useful when looking at driver code.

It's just that in my experience it's SO hard to get people reading
documentation, even something really small. I'm not really optimistic
that using kernel-doc in drivers is any different and people ignore that
as well, like any other documentation.

>> * kernel-doc moves field documentation in structures away from the
>>   actual fields which I find confusing.
>
> kernel-doc does support in-line commenting as well:
> <https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#in-line-member-documentation-comments>
>
> Although I don't see that used much.

That's good to know. But in a way I understand why that style is not
used, at least the example in the link is hard to read.

>> * The risk of having outdated kernel-doc documentation is high, it would
>>   need active maintenance etc.
>
> Agree, but that is true of any documentation.

But the existing style is to provide documentation only when it's
necessary. With kernel-doc we have to provide documentation when it's
not even needed, no? For example, if only one enum needs documentation
and all others obvious,

>>> I'm curious what others think of the ath10/11/12k level and style of
>>> documentation.
>> 
>> IIRC iwlwifi uses kernel-doc to document the firmware interface, not
>> sure how much it's used elsewhere in the driver.
>
> They have the same problem I'm trying to fix ;)
> % scripts/kernel-doc -Werror -none \
> 	$(find drivers/net/wireless/intel/iwlwifi -name '*.[ch]')
> ...
> 322 warnings as Errors
> %

Ouch. But I'm surprised why nobody has reported these before? Are the
kernel-doc warnings ignored by everyone?

> I'm not looking to change the status quo.

I have no problems changing the status quo but having extra work without
a clear benefit is my concern here.

> Let me get the last of the ath10k cleanups in place, and I'll continue
> to run kernel-doc to make sure the existing ath1*k documentation is
> kept up to date.

Thanks. If you have time, maybe you could update ath11k-check and
ath10k-check? Every developer should use those scripts so having them
notice the warnings earlier is easier for everyone.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

