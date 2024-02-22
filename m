Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E6FC48BEB
	for <ath11k@archiver.kernel.org>; Thu, 22 Feb 2024 06:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5TlQjJXRV5XkfNYBVIgPxQiDsIf85Ix3EFIh6yPVJz4=; b=IdmBDgSDdcsG3mWDU6I837yRaS
	O41Pu2gYnczizQJERAGjGGDAXw2ys5kT9W+9luUayFyyludsVwfptTuzmwZMj1QpL0Tofraz7GdQ6
	vwok71iX2i6CCOskx0OyIEK4K0Yyq2yohTrdhnVgOK1Ht4MCzIQ4JaRdoTIftVR2ewPAaB50P29Pt
	VpwpHh7bhqS1GU1mT8aLBImEhj7G0Fns52gJwBJCdELx8R++R6rf2M0+5u/+QjTIeTWP9DW2sKZXo
	RcmYkSkbxxxMpp19/scYal9uXIAUj11J10//qFX2/U+7ZnDTSG3SujrAIi5KWzsHh9we1KXStx3pP
	m4e/PNyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd2W8-00000003gtB-1RRX;
	Thu, 22 Feb 2024 06:25:12 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd2W5-00000003gsZ-2pZ1
	for ath11k@lists.infradead.org;
	Thu, 22 Feb 2024 06:25:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0B21ACE213D;
	Thu, 22 Feb 2024 06:25:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 568C5C433F1;
	Thu, 22 Feb 2024 06:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708583107;
	bh=nXjyzMN1tP+ikBL5uHXkysnaM6WKpy+upxv9MW+lzzI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=OPHFRM6XuX2WzXP0EU13Q/3GQkjQudbcBNzXsK7fhEtTySzlxXp/TI0jDms+wBezN
	 ERRHj/CL6tXobxBudBUYg3KOb4gVNP9NSh1xgx71ivRwh3Wa2Y2PYrce8A0+TSR8X+
	 iLhTIpbl0YYHG5QlCI7Pnm9CfbyP75/rRAEEyRH4TQpBQNN3/SpyiL+A8C3bnoRAiH
	 4UQZv2Oyj+VoLRAQo3H9XulrcnbgFZqZVRAUXndkR9fOk9NgFSKbxt/8MkT92rkNrb
	 1toBHUUhURGtjn8cs04cr/UdTlKDbtxm8jpbWBLQpVeTHXiym8qthXFo9CcEJg+6pd
	 mzgLOCFygAkIA==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  <ath11k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 5/5] wifi: ath11k: thermal: don't try to register
 multiple times
References: <20240221024725.10057-1-quic_bqiang@quicinc.com>
	<20240221024725.10057-6-quic_bqiang@quicinc.com>
	<df08dfd4-189c-407b-8a2e-6fd2bbf3b22f@quicinc.com>
	<5828b835-6b4d-4245-991a-7f6b54ee8b51@quicinc.com>
Date: Thu, 22 Feb 2024 08:25:04 +0200
In-Reply-To: <5828b835-6b4d-4245-991a-7f6b54ee8b51@quicinc.com> (Baochen
	Qiang's message of "Thu, 22 Feb 2024 10:34:16 +0800")
Message-ID: <871q95audb.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_222509_911134_E29A6289 
X-CRM114-Status: GOOD (  12.23  )
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

> On 2/22/2024 1:15 AM, Jeff Johnson wrote:
>> On 2/20/2024 6:47 PM, Baochen Qiang wrote:
>>> From: Kalle Valo <quic_kvalo@quicinc.com>
>>>
>>> Every time the firmware boots we call ath11k_core_qmi_firmware_ready() which
>>> ends up calling ath11k_thermal_register(). So we try to register thermal
>>> devices multiple times. And when we power off the firmware during
>>> suspend/hibernation (implemented in the next patch) we get a warning in resume:
>>>
>>> hwmon hwmon4: PM: parent phy0 should not be sleeping
>>>
>>> Workaround this similarly like ath11k_mac_register() does by testing
>>> ATH11K_FLAG_REGISTERED.
>>>
>>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
>>>
>>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>> you need to add your own S-O-B
> Oh, sorry for missing that.
>
> Hi Kalle, I see you have put this series in pending branch. I am
> wondering if I need to send a v2 to add my S-O-B tag, or you have any
> other plan?

I can add it in the pending branch if you send it to me as a reply to
this mail. s-o-b is like a signature so I won't add it on my own.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

