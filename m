Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E88EECAAD2
	for <ath11k@archiver.kernel.org>; Mon, 29 Aug 2022 16:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+0ZNdI/wrIyYe+DEzeGW3CqKaTRMTp5ksYEy0C5Axs=; b=I7WONIB2hVDq8N
	NSgsJVFPErGtSKP9eqzcek4UU9GFHyr/t0SBDq2MpyDDiB/bveqKEPqEdVAJpAVGAtqBkzmp6SH+h
	3ASrlF+cxOHFakOmymT9HeHMl6vC+N02XhDyW6HZduf3Gz+476TbYpXaoef70kzRDEp27ng/mSh0V
	g+HfqbLl3/+KaQMAFfKRryMlgVdCIavUFGa5a2KOig5b4qi0M0aazkzdrpHN8/o++n86CSjOYpzjr
	4kFU5TBM14EIJ6wGxIz37gm1Gl8pDnzvEThtktkzYncvlS1k9aqLBaDOsx3mZ522OaiwLQ7eFhC2F
	akcnXj6sMGZYZ3wbzR1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oShen-00BlE9-Iz; Mon, 29 Aug 2022 16:30:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oShUq-00Bh74-8j
	for ath11k@lists.infradead.org; Mon, 29 Aug 2022 16:20:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6804A611BE;
	Mon, 29 Aug 2022 16:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31D25C433D6;
	Mon, 29 Aug 2022 16:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661790018;
	bh=rKldEn8GDoqan884Kl27KYDre5RSBwf1soWE1GqIuUI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Jo27ES0wd1AvWThEa0nNWsF4/0g4E7h6fUZmtGF6fpqKxWQaGM2/7aSaVKcq9vxdz
	 75czUSVooDbVphf884bV11kfN5fPZPvAABfAlW+VFs8USi8AKPQe/brfzmnE7VN68u
	 qhuXnZbyhTKBgKL6ycWq4C7TKJy/ow/hplrFpoxrCBfTHkLX+1JBVzA71cwM3AHn9P
	 l449PrywaV5w/dgku2ObN6ZObfjcAywk7e+8HtteRg64LoBVhLyyXyMO7g5fORlPf1
	 m3JErPnp7uWjth4CxV5kg4QvVma2BsLqYIq5WrNDf2VjFKsPYpgkE7d0f/pr+fx/MI
	 4t1WqSnGXFa2Q==
From: Kalle Valo <kvalo@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Qiang Yu <quic_qianyu@quicinc.com>,  quic_hemantk@quicinc.com,  loic.poulain@linaro.org,  quic_jhugo@quicinc.com,  mhi@lists.linux.dev,  linux-arm-msm@vger.kernel.org,  linux-kernel@vger.kernel.org,  quic_cang@quicinc.com,  ath11k@lists.infradead.org
Subject: Re: [PATCH v3 1/1] bus: mhi: host: Fix up null pointer access in mhi_irq_handler
References: <1658459838-30802-1-git-send-email-quic_qianyu@quicinc.com>
	<20220726080636.GE5522@workstation> <87czdrrc95.fsf@kernel.org>
	<20220729142221.GA9937@thinkpad>
Date: Mon, 29 Aug 2022 19:20:10 +0300
In-Reply-To: <20220729142221.GA9937@thinkpad> (Manivannan Sadhasivam's message
	of "Fri, 29 Jul 2022 19:52:21 +0530")
Message-ID: <87h71vc98l.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_092020_412182_CCFB8580 
X-CRM114-Status: GOOD (  13.85  )
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

Manivannan Sadhasivam <mani@kernel.org> writes:

> On Tue, Jul 26, 2022 at 08:53:58PM +0300, Kalle Valo wrote:
>> Manivannan Sadhasivam <mani@kernel.org> writes:
>> 
>> > +ath11k, Kalle
>> >
>> > On Fri, Jul 22, 2022 at 11:17:18AM +0800, Qiang Yu wrote:
>> >> The irq handler for a shared IRQ ought to be prepared for running
>> >> even now it's being freed. So let's check the pointer used by
>> >> mhi_irq_handler to avoid null pointer access since it is probably
>> >> released before freeing IRQ.
>> >> 
>> >> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>> >
>> > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
>> 
>> This fixes the crash and my regression tests pass now, thanks. But
>> please see my question below.
>> 
>> Tested-by: Kalle Valo <kvalo@kernel.org>
>> 
>
> Thanks Kalle!

I just tested v6.0-rc3 and it's still crashing. What's the plan to get
this fix to Linus?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
