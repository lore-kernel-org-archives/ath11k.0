Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8444BC67861
	for <ath11k@archiver.kernel.org>; Fri,  5 Apr 2024 12:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLjyk8y4tFxBb7NEdDSwTLZNn1RYfOPvWyFzELtqXzA=; b=yGY+JYw3O2ydJnofLPwjLtARDp
	wO5yO1naaK+o5QXqTuZB6/kdF0SXham9Ynpq6CKYfAJoWam5upyhrZE7XkVkmSi21/FDDGiu1+yxj
	0YtlGf7uobgXPN99GnXT6YmftJaaic476YkvW2KT7Q0xRnb9OOFZOy3TY+aNKcE2Bgdyog9ivcn+6
	RHCk/HB5w3J9OCY0pRRUbOQSPFoJ4f8NE/hGRRQ4bJn9HZv5tX9lSFzp3K1vG1I4ySw6NegPMHWBT
	E40+2wcl9c+CuJtHX31Xo9Ynv3XpuhAhXIZzijLN16vRdUwEoLmQ47uTmTGFQdTdJoseqQkV62yd6
	1IO4q5Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsihx-00000006wIC-3ZSZ;
	Fri, 05 Apr 2024 12:30:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsihu-00000006wHA-1pGV
	for ath11k@lists.infradead.org;
	Fri, 05 Apr 2024 12:30:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7984B616DA;
	Fri,  5 Apr 2024 12:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0D6C433C7;
	Fri,  5 Apr 2024 12:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712320208;
	bh=JR8+Vwz3pz5roRhU/fTETXN5L9wi9qDehmzIoJCYsWY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=neksvo/RefNVGv94kOSJeWzddtr2dwvzlWDzqeZrWWz8+WB8jbKpwpCH9a/67DZBo
	 8ULRAuSKEi+8uStofOQEGjttycmW6+ChNAIbrJJDNQkl6Xc/9AtG5IZnb9GhV5Xedp
	 rQ1j4moHJ//fvAAUq4K6FuQFqXHt/l8R/F4fIX3YwT3xlG7rR1eJbfztfPaY/lwBun
	 vxZYGlLG2jfo9NwFtlo5oqXz9pz6GIxtJDvQv8R495F00cxg039mTKbLX6YIky3Mei
	 3Z6WOhwbDanDuSfdFp3ts+80lH30SLHf4Pzw661+EyiE+953kAMaypkhvalYw+VVs9
	 IJOg5/94oXSlQ==
From: Kalle Valo <kvalo@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,  ath11k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  linux-arm-msm@vger.kernel.org,
  mhi@lists.linux.dev,  davem@davemloft.net,  edumazet@google.com,
  kuba@kernel.org,  pabeni@redhat.com,  netdev@vger.kernel.org
Subject: Re: [PATCH v7 1/3] bus: mhi: host: add mhi_power_down_keep_dev()
References: <20240305021320.3367-1-quic_bqiang@quicinc.com>
	<20240305021320.3367-2-quic_bqiang@quicinc.com>
	<20240401104908.GA234427@thinkpad>
Date: Fri, 05 Apr 2024 15:30:03 +0300
In-Reply-To: <20240401104908.GA234427@thinkpad> (Manivannan Sadhasivam's
	message of "Mon, 1 Apr 2024 16:19:08 +0530")
Message-ID: <87wmpc2dro.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_053010_546772_07D36045 
X-CRM114-Status: GOOD (  17.22  )
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

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> On Tue, Mar 05, 2024 at 10:13:18AM +0800, Baochen Qiang wrote:
>
>> ath11k fails to resume:
>> 
>> ath11k_pci 0000:06:00.0: timeout while waiting for restart complete
>> 
>> This happens because when calling mhi_sync_power_up() the MHI subsystem
>> eventually calls device_add() from mhi_create_devices() but the device
>> creation is deferred:
>> 
>> mhi mhi0_IPCR: Driver qcom_mhi_qrtr force probe deferral
>> 
>> The reason for deferring device creation is explained in dpm_prepare():
>> 
>>         /*
>>          * It is unsafe if probing of devices will happen during suspend or
>>          * hibernation and system behavior will be unpredictable in this case.
>>          * So, let's prohibit device's probing here and defer their probes
>>          * instead. The normal behavior will be restored in dpm_complete().
>>          */
>> 
>> Because the device probe is deferred, the qcom_mhi_qrtr_probe() is not
>> called and thus MHI channels are not prepared:
>> 
>> So what this means that QRTR is not delivering messages and the QMI connection
>> is not working between ath11k and the firmware, resulting a failure in firmware
>> initialization.
>> 
>> To fix this add new function mhi_power_down_keep_dev() which doesn't destroy
>> the devices for channels during power down. This way we avoid probe defer issue
>> and finally can get ath11k hibernation working with the following patches.
>> 
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
>> 
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>
> Applied to mhi-next! Note that this patch is also available in mhi-immutable
> branch for ath11k maintainers to pull into their tree.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git/log/?h=mhi-immutable

Thanks, I pulled this branch to ath-next:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath-next&id=231a4c893c9bb2984a8c6b7450199f59eb816ed9

This is just preparation for patches 2 and 3, those patches are not
commited yet.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

