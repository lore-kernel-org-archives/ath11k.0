Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E353C4345F
	for <ath11k@archiver.kernel.org>; Mon, 15 Apr 2024 16:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QpqslMeugbpBblQX2VbvPVOpF1X/ydbPc+z94KL1r1Y=; b=F3AF9UPQ2/73wdfZIFD7UAHvWi
	i1gXDQsFg80eOcqRxAmQyqf6zor+6TsKlohpJGyuZr+v0I8B9TUdGYJ/4IBuILXvOmfBGl+lZgQsX
	xs0nB2PKkyD6B4wioydoBP7LmDJfCHqFS9Kc8eDQwUxvD2eWLhF1DlUq4nmuZezis96fQPS56JbaX
	eutkKZIZ/NfQxCI8AgBb/8N/4V+9ou9NeJjbG/hry4WC6GMXqtHc+TM5FT5KpqdDFR1kDSEs/S5fU
	EIT2haHo3LSu8aa0UNyuMyv7jHAByju1UfXdY17XkpRdFaOz1m6PCWwP9mdF08/fOKw47/P0COLeF
	ndb6lvng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwOuA-000000090kA-03BL;
	Mon, 15 Apr 2024 16:10:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwOu7-000000090iK-0Yon
	for ath11k@lists.infradead.org;
	Mon, 15 Apr 2024 16:10:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 83C6060EA5;
	Mon, 15 Apr 2024 16:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64649C113CC;
	Mon, 15 Apr 2024 16:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713197398;
	bh=m7G9vgei/v/vHrX65n+JYaPqUiA0vcXyBGm0nxXE2/g=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=YPhHb5aklQtMf8S6UplvckanWOA7BdF9dAG9i/epuoDkRWEoKmXlViHAZJMdeQ00o
	 nKepbl7/HlizFXD8XVZljsSB3PjL4Nd/u2tRXL7ZGXMXCUWW2MuKdUth6osLo+xu8+
	 vrHf9v7ZcodFLkogBuOEXeGjtYm7MClgRWRNjkYFZ8fKhVX0YJGv4oF6w4tVr5mAld
	 vJWw1O+VIXm4mZsK+oN41TlTkNJmzgceaoY+HwRYj42EfNDH/Uo3t8I5qIRFknDyQf
	 1a6SzjjcBDtV5NuGNx9p+vUESnJ9yupgHAGr8durg/6Zev32MJsq7mncf3YCittqtA
	 nsDHFuNKJBQTg==
From: Kalle Valo <kvalo@kernel.org>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath11k: modify the calculation of the average
 signal strength in station mode
References: <20240309121129.5379-1-quic_lingbok@quicinc.com>
	<171034681684.2322265.9660346495295315212.kvalo@kernel.org>
	<e40eb820-438b-415e-b91a-d448ac60d9a4@quicinc.com>
Date: Mon, 15 Apr 2024 19:09:55 +0300
In-Reply-To: <e40eb820-438b-415e-b91a-d448ac60d9a4@quicinc.com> (Lingbo Kong's
	message of "Sun, 14 Apr 2024 21:33:58 +0800")
Message-ID: <87pluqy5d8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_090959_302502_531530D5 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

Lingbo Kong <quic_lingbok@quicinc.com> writes:

> On 2024/3/14 0:20, Kalle Valo wrote:
>> Lingbo Kong <quic_lingbok@quicinc.com> wrote:
>> 
>>> Currently, the calculation of the average signal strength in station mode
>>> is incorrect.
>>>
>>> This is because before calculating the average signal strength, ath11k need
>>> to determine whether the hardware and firmware support db2dbm, if the
>>> hardware and firmware support db2dbm, do not need to add noise floor,
>>> otherwise, need to add noise floor.
>>>
>>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
>>>
>>> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
>>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>> What about AP chipsets like QCN9074, do they also work similarly?
>> 
> Hi, kalle,
>
> I observe this patch's status is deferred.
> https://patchwork.kernel.org/project/linux-wireless/patch/20240309121129.5379-1-quic_lingbok@quicinc.com/
>
> I think it belongs to bug-fix, so, could you please merge it? :)

I need to test it first which takes time.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

