Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD4FC43334
	for <ath11k@archiver.kernel.org>; Mon, 25 Jul 2022 17:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YgU1XbTGHANa0ObFgrDz6I6cr4/He5nAtPbCYjWvs7E=; b=qAedaJuDKW4/An
	MuRG80UHABl9GW2fWUaNf0INUUbtR4fn8vDs7XKElk6wbEM1Vf0Y1sZ9E0tkjubr5sMtiYIEEA5H/
	WZNj/+kWVY3FrW0lEw7A2AOxblP7cgx28ZhYAkoEaTf/8cjrcojbz9rDPmV9bKZvIxl23+jjLvKh5
	z57b6OeXzgjVuFrzOBqIi2NcR+rm2URMPAxGfLWyGcuQqprpamuPauBY0rDRVp5oPQ9dihRzoyZTo
	7D2EpIv1d0jWWlVbVyNJ+S5po9BV3HGxst60+C/pv2T2Lz70HN9v25xEojkcO+fWmZyvydf/06zIf
	Nsa9OZE5aXDKuJ4/IhKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG2KS-00GGIP-Gc; Mon, 25 Jul 2022 17:57:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG2KO-00GFzW-Vm
	for ath11k@lists.infradead.org; Mon, 25 Jul 2022 17:57:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D6D5361388;
	Mon, 25 Jul 2022 17:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F17DC341C6;
	Mon, 25 Jul 2022 17:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658771827;
	bh=cv8NQiE83GOv/DB+wSK/QtVSNmHqEKCAHuhQNzhIfxM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=RN3bNnf1qcACvLhVz3+mrnnm2wSCxhgepF5qQDBMARV1dju+rFw81BgPS0Yl/VIBX
	 fshMJU1Vh88fcTMJBbzmh1Ud1+tJhMPK/CKq9Ainvt5DdoSyC0HoNkpOuUf6BM8A+V
	 0MuHcJuWokEUpi2ho2CDm5QuE+xVLx9qHpplB8vqSdCZ04E3EpbhXQf1klsZm5bjkl
	 ZbQOvXHIbLxNo03s34bUTcVR/zNrpI7FPFsd7W07Wk1JF7b61PpD1UU8pEmuDupaR1
	 R5jmscp6n3a2gu+s6n+jHcVbFCkDhGMY5oL2rqFPqLjHIW8RiaEaQZB+p91qjtsxvN
	 4Uop5zyiUAi3Q==
From: Kalle Valo <kvalo@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Qiang Yu <quic_qianyu@quicinc.com>,  quic_hemantk@quicinc.com,  loic.poulain@linaro.org,  quic_jhugo@quicinc.com,  mhi@lists.linux.dev,  linux-arm-msm@vger.kernel.org,  linux-kernel@vger.kernel.org,  quic_cang@quicinc.com,  ath11k@lists.infradead.org
Subject: Re: [PATCH v4 1/1] bus: mhi: host: Move IRQ allocation to controller registration phase
References: <1655952183-66792-1-git-send-email-quic_qianyu@quicinc.com>
	<20220624072740.GA12171@thinkpad> <87k08an038.fsf@kernel.org>
	<20220720093909.GA5747@thinkpad>
Date: Mon, 25 Jul 2022 20:57:00 +0300
In-Reply-To: <20220720093909.GA5747@thinkpad> (Manivannan Sadhasivam's message
	of "Wed, 20 Jul 2022 15:09:09 +0530")
Message-ID: <871qu9rs7n.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_105713_084547_42754E7E 
X-CRM114-Status: GOOD (  19.01  )
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

> On Mon, Jul 18, 2022 at 02:15:23PM +0300, Kalle Valo wrote:
>
>> + ath11k list
>> 
>> Manivannan Sadhasivam <mani@kernel.org> writes:
>> 
>> > On Thu, Jun 23, 2022 at 10:43:03AM +0800, Qiang Yu wrote:
>> >> During runtime, the MHI endpoint may be powered up/down several times.
>> >> So instead of allocating and destroying the IRQs all the time, let's just
>> >> enable/disable IRQs during power up/down.
>> >> 
>> >> The IRQs will be allocated during mhi_register_controller() and freed
>> >> during mhi_unregister_controller(). This works well for things like PCI
>> >> hotplug also as once the PCI device gets removed, the controller will
>> >> get unregistered. And once it comes back, it will get registered back
>> >> and even if the IRQ configuration changes (MSI), that will get accounted.
>> >> 
>> >> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>> >
>> > Applied to mhi-next!
>> 
>> I did a bisect and this patch breaks ath11k during rmmod. I'm on
>> vacation right now so I can't investigate in detail but more info below.
>> 
>
> I just tested linux-next/master next-20220718 on my NUC with QCA6390, but I'm
> not able to reproduce the issue during rmmod! Instead I couldn't connect to AP.
>
> log: https://paste.debian.net/1247788/

I get "Entry not found" for that link. But yeah, there were several
regressions in ath11k while I was away. I except that the could not
connect to AP bug should be fixed now in wireless-next and linux-next.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
