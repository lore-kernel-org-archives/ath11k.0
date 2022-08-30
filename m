Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BFBC0502A
	for <ath11k@archiver.kernel.org>; Tue, 30 Aug 2022 05:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wl92QvxOxDBOwEB0Bo5lzy3xXoxQdNWf3r327xD7A9Q=; b=RvvwQZrHaPmwLF
	WAc/YbOSsu8h6haDYlpxuf4hEXQ+QMHLaHKysRW3gKFmNlkmrUOi7pc8eHHmTKFAMkPAWs112PFqh
	zVwcv9xE69mJWSE7RY3ZPDPYEPZWQNwpk/wGNpY1vGolJfowztJ5uNGSd4EXzu4eNbtN04Kjrb5Iq
	1EeygFeN8cQjzjh/8EZF2O+yx8sUs7Q16saJDKMpsmPolZNPe40GegbSOcw1Pdn7P882PS5To2v7Z
	7iiASgU7xvsEfHDy0jRva7zc9S7bCBfA105OEzGn2UKAT+5tzaFdhMl7nAXBy9rbhSnLttCBvtWqn
	WMWsFfqSxXMJ59ke2JYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oStlB-00EB3H-VW; Tue, 30 Aug 2022 05:26:01 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oStl8-00EB2i-Fa
	for ath11k@lists.infradead.org; Tue, 30 Aug 2022 05:26:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2CAA6B8162D;
	Tue, 30 Aug 2022 05:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05121C433C1;
	Tue, 30 Aug 2022 05:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661837155;
	bh=3yqxcS7dQZQOpbb7/uOnTFNQ1/YCaRMFuuWwnpC4s6Y=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=EfL3T9hUGjzQsjWuSMwj4srw26KD/aeh57IhRzyo4hoK1+DfflrNKKzJy3luZd2VV
	 ldakR/75yO16W0+H7wG4jmeI8AZXNJQpJFPMjRrVZF5AJyqgFM2MO+z8iY29wosN44
	 dmW3213K3flJu2/YsIIF58MlCGFQaWIeR9jOhWLEGlGD368vllOykdZUOXDMYQeNS4
	 FJ0+qWvO6xlngNCeQ8UCq7L0UDlb5ONVjaZl3zyrRpgbHzuZZsyP0a85JwkenKrXTu
	 9aT4jR2qp7IBzuJ29cn1vCEYmD4p82anZtF97dE3pSKxVq/q4fFtZ05UJwvpRtsD2j
	 Xwobdb5rQfxkQ==
From: Kalle Valo <kvalo@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Qiang Yu <quic_qianyu@quicinc.com>,  quic_hemantk@quicinc.com,  loic.poulain@linaro.org,  quic_jhugo@quicinc.com,  mhi@lists.linux.dev,  linux-arm-msm@vger.kernel.org,  linux-kernel@vger.kernel.org,  quic_cang@quicinc.com,  ath11k@lists.infradead.org
Subject: Re: [PATCH v3 1/1] bus: mhi: host: Fix up null pointer access in mhi_irq_handler
References: <1658459838-30802-1-git-send-email-quic_qianyu@quicinc.com>
	<20220726080636.GE5522@workstation> <87czdrrc95.fsf@kernel.org>
	<20220729142221.GA9937@thinkpad> <87h71vc98l.fsf@kernel.org>
	<20220829172654.GA84762@thinkpad>
Date: Tue, 30 Aug 2022 08:25:48 +0300
In-Reply-To: <20220829172654.GA84762@thinkpad> (Manivannan Sadhasivam's
	message of "Mon, 29 Aug 2022 22:56:54 +0530")
Message-ID: <87fshefgkj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_222558_687357_8BE87CA8 
X-CRM114-Status: GOOD (  17.91  )
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

> On Mon, Aug 29, 2022 at 07:20:10PM +0300, Kalle Valo wrote:
>> Manivannan Sadhasivam <mani@kernel.org> writes:
>> 
>> > On Tue, Jul 26, 2022 at 08:53:58PM +0300, Kalle Valo wrote:
>> >> Manivannan Sadhasivam <mani@kernel.org> writes:
>> >> 
>> >> > +ath11k, Kalle
>> >> >
>> >> > On Fri, Jul 22, 2022 at 11:17:18AM +0800, Qiang Yu wrote:
>> >> >> The irq handler for a shared IRQ ought to be prepared for running
>> >> >> even now it's being freed. So let's check the pointer used by
>> >> >> mhi_irq_handler to avoid null pointer access since it is probably
>> >> >> released before freeing IRQ.
>> >> >> 
>> >> >> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>> >> >
>> >> > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
>> >> 
>> >> This fixes the crash and my regression tests pass now, thanks. But
>> >> please see my question below.
>> >> 
>> >> Tested-by: Kalle Valo <kvalo@kernel.org>
>> >> 
>> >
>> > Thanks Kalle!
>> 
>> I just tested v6.0-rc3 and it's still crashing. What's the plan to get
>> this fix to Linus?
>
> Sorry for the delay. Just sent the PR to Greg for including it as a fix for
> v6.0.

Excellent, thank you.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
