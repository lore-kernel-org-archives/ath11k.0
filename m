Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EADC48BF6
	for <ath11k@archiver.kernel.org>; Thu, 29 Feb 2024 19:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mNs5kC6TksS6UB+6cGJY1ZereaVWhJ+biN+qJFhJDA=; b=PDHHxGuxiCTTrwDM0+GuvsTLL7
	A+MWjgTQAuYusZAiJ4j9Crym7zaQiWS38rDMxa7nJh5qiXfaVWLsIrddmgfhgPuJ1FmjbD5V6hutE
	j2dcrfG7Ga1EYXwzrpSAK4+UQq6aSh+WlBE5cKwRytMjKMivFow91mQrvQsRbClY0GLmRBnNtcv57
	IK7qKKM8OW7rPx4F6J2A5exZjhmeNmkMe3wSAubAq8FRViQc6e8xjpkn5e9Na3TMA8bOSHXv92VCR
	VAtnTcffs0YWThAQbUnRf6qb2tLAwp5fVvj23OHq/Y9GICB5PEJqH4+olAUwPOHlhGr6PTdaX4oob
	e9nftjbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfmC0-0000000EuIG-1eRm;
	Thu, 29 Feb 2024 19:35:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfmBx-0000000EuHA-3XeH
	for ath11k@lists.infradead.org;
	Thu, 29 Feb 2024 19:35:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BD045CE1F97;
	Thu, 29 Feb 2024 19:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA240C433F1;
	Thu, 29 Feb 2024 19:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709235339;
	bh=z+ll6MviZxAO9oJ8WAt1UoEwqN5J4y0yQMH87Dp3Lgg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=jQJtxn7+AqbnVuE+PBx7GcVjn06hzaXhUwyYdOKDoNFmbPZii46rlwhjAdB24ZI4Q
	 T4kZauY7MEISI8Kzd0vzFUKUC2BUzWeSbTNchV8hsy7+KVjrd8CnICSp3Hw260uLVs
	 f/FtpHhp4apxYVCwfWB0vqs54p965NrDRxkeqHTk9W7tdGzHeJ5xcJROr/EV3Bg/kC
	 y9dEjBdhmv6fjVosVqvXRyE2E4UxEpB1aOeLBGobOLrK098vT5B/+n6zgc/u1ExYoE
	 IcZJLJXgbPx1v+5p4AKF2dgtK905OAM7NpixAjFItscUdjjzxK9Yz+0g1Oy7Vsgjgl
	 vVWK5ir8KoDWw==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,  "Kalle Valo
 (QUIC)" <quic_kvalo@quicinc.com>,  <ath11k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>,  <linux-arm-msm@vger.kernel.org>,
  <mhi@lists.linux.dev>,  <davem@davemloft.net>,  <edumazet@google.com>,
  <kuba@kernel.org>,  <pabeni@redhat.com>,  <netdev@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] bus: mhi: host: add mhi_power_down_keep_dev()
References: <20240228022243.17762-1-quic_bqiang@quicinc.com>
	<20240228022243.17762-2-quic_bqiang@quicinc.com>
	<20240229101202.GB2999@thinkpad>
	<531daaa9-cf14-4812-8908-c617bd25bc08@quicinc.com>
Date: Thu, 29 Feb 2024 21:35:34 +0200
In-Reply-To: <531daaa9-cf14-4812-8908-c617bd25bc08@quicinc.com> (Baochen
	Qiang's message of "Thu, 29 Feb 2024 18:33:43 +0800")
Message-ID: <87le7383nd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_113542_103231_4324E8B2 
X-CRM114-Status: GOOD (  14.74  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> On 2/29/2024 6:12 PM, Manivannan Sadhasivam wrote:
>> On Wed, Feb 28, 2024 at 10:22:41AM +0800, Baochen Qiang wrote:
>>> ath11k fails to resume:
>>>
>>> ath11k_pci 0000:06:00.0: timeout while waiting for restart complete
>>>
>>> This happens because when calling mhi_sync_power_up() the MHI subsystem
>>> eventually calls device_add() from mhi_create_devices() but the device
>>> creation is deferred:
>>>
>>> mhi mhi0_IPCR: Driver qcom_mhi_qrtr force probe deferral
>>>
>>> The reason for deferring device creation is explained in dpm_prepare():
>>>
>>>          /*
>>>           * It is unsafe if probing of devices will happen during suspend or
>>>           * hibernation and system behavior will be unpredictable in this case.
>>>           * So, let's prohibit device's probing here and defer their probes
>>>           * instead. The normal behavior will be restored in dpm_complete().
>>>           */
>>>
>>> Because the device probe is deferred, the qcom_mhi_qrtr_probe() is not
>>> called and thus MHI channels are not prepared:
>>>
>>> So what this means that QRTR is not delivering messages and the QMI connection
>>> is not working between ath11k and the firmware, resulting a failure in firmware
>>> initialization.
>>>
>>> To fix this add new function mhi_power_down_keep_dev() which doesn't destroy
>>> the devices for channels during power down. This way we avoid probe defer issue
>>> and finally can get ath11k hibernation working with the following patches.
>>>
>>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
>>>
>>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>>
>> Did Kalle co-author this patch? If so, his Co-developed-by tag should
>> be added.
>
> Hmm, I'm not sure...  I would like Kalle's thoughts on this.

IIRC I did only some simple cleanup before submitting the patch so I
don't think Co-developed-by is justified. I'm also fine with removing my
Signed-off-by.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

