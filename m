Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06652C67861
	for <ath11k@archiver.kernel.org>; Fri,  5 Apr 2024 13:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iitSfI2Y8LrBa++ncwel3h3WEbl4CDisdRxqGPA4c5k=; b=hTIqraweyJtAEPwNjyOKVrAbci
	ihB7/Q3b0lIdxhQON9OHuZ3gWyn3eaSEwd2OZmMzp6T7bUN0tYr8oHSiu2SjqTrF4qKznutjpHhNX
	t51gt/odXORIvxZ4EOeBzxFLnLGIXztEAFmOg94LE8mkyQ2DbPzDz4o7JbxOclXJYSthi31Ot8WDh
	FjEHCWY51zBLLPqYCQyX6YY7D8PCbAoCRebfyZtkgs9g2+vU9Dzp/vCsht1imTA29tsh+fQAVjx2J
	XFXc/z+k6aPLOAb+3VWSJ0VzI7sJhnxB451H5pSRNSsw763jmmcGlaH4I2naHM8+IExX0XAzS2d2a
	S29Y2GCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsjbc-00000007Dcy-2Sjg;
	Fri, 05 Apr 2024 13:27:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsjbZ-00000007DcA-16HD
	for ath11k@lists.infradead.org;
	Fri, 05 Apr 2024 13:27:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5EEC26168A;
	Fri,  5 Apr 2024 13:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B728C433C7;
	Fri,  5 Apr 2024 13:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712323660;
	bh=iitSfI2Y8LrBa++ncwel3h3WEbl4CDisdRxqGPA4c5k=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=lttrIDkP/Dhv4IN6Lxk++khK7XWYBENBQs6ggUCGtf4DyBhxkdh6xc5im0USff+Gm
	 CGtvdPhqBQXrMkVdiAK9fOCDiwUt4DBYoGSQMrfBcLx0RZuJBS61BL6I5sC+vn4znX
	 YIcIUcw19KqTIYxqWzBstbqn046g4X7EHfEJZpXflYZLLGDYFsnJWu4jewvExLRNCJ
	 ONIAaJAuozMJ0yVdPHQIKJmPUQHyHzlkuSggeVvYchurL5QnIVKtJn0ZNCpp/Fr0C5
	 CAWNm+FbmdZoeV9fPnY1PH5ZjXyWz/tmhUfd/lezExNCXmYevrmZebYkyySrghUINF
	 08r5k2y+i6y3w==
From: Kalle Valo <kvalo@kernel.org>
To: <davem@davemloft.net>,  <edumazet@google.com>,  <kuba@kernel.org>,
  <pabeni@redhat.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>,
  <manivannan.sadhasivam@linaro.org>,  <linux-wireless@vger.kernel.org>,
  <linux-arm-msm@vger.kernel.org>,  <mhi@lists.linux.dev>,
  <netdev@vger.kernel.org>
Subject: Re: [PATCH v7 2/3] net: qrtr: support suspend/hibernation
References: <20240305021320.3367-1-quic_bqiang@quicinc.com>
	<20240305021320.3367-3-quic_bqiang@quicinc.com>
Date: Fri, 05 Apr 2024 16:27:35 +0300
In-Reply-To: <20240305021320.3367-3-quic_bqiang@quicinc.com> (Baochen Qiang's
	message of "Tue, 5 Mar 2024 10:13:19 +0800")
Message-ID: <8734s02b3s.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_062741_383088_29C4AFE5 
X-CRM114-Status: GOOD (  12.40  )
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

Hi netdev maintainers,

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> MHI devices may not be destroyed during suspend/hibernation, so need
> to unprepare/prepare MHI channels throughout the transition, this is
> done by adding suspend/resume callbacks.
>
> The suspend callback is called in the late suspend stage, this means
> MHI channels are still alive at suspend stage, and that makes it
> possible for an MHI controller driver to communicate with others over
> those channels at suspend stage. While the resume callback is called
> in the early resume stage, for a similar reason.
>
> Also note that we won't do unprepare/prepare when MHI device is in
> suspend state because it's pointless if MHI is only meant to go through
> a suspend/resume transition, instead of a complete power cycle.
>
> Tested-on: WCN6855 hw2.0 PCI
> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Could I take this patch via ath.git tree? Full patch here (same patch
but links to both patchwork projects):

https://patchwork.kernel.org/project/linux-wireless/patch/20240305021320.3367-3-quic_bqiang@quicinc.com/

https://patchwork.kernel.org/project/netdevbpf/patch/20240305021320.3367-3-quic_bqiang@quicinc.com/

I ask because we need it to get hibernation working on ath11k (and ath12k):

https://patchwork.kernel.org/project/linux-wireless/patch/20240305021320.3367-4-quic_bqiang@quicinc.com/

Kalle

