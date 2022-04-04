Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1CCC433F5
	for <ath11k@archiver.kernel.org>; Mon,  4 Apr 2022 07:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HvsjvMf8s1zyl2gL5h6Q3dLTO+6vylLfNbPA9pr/dho=; b=mzhPXxUCCJA8iu
	B43PtSyeQeJw0yiCQ6VeFlEwhCHs52hz5Plv5GamlHtmtq1F817AF6DQCy+3uZhI34WmWoPbdmTL/
	+bBmvdDHwPkxzg3CDyhvWAdKwnptZvrWj6Cigb5tDlWz5uocsNRb8W/Q5N6YOevGHVVFdQ+8lV6kO
	Ckpb7OhSGRQ64vVFF5utlLCXqgrH++9B1FnYsIIWU9e5Uj8rVKjObx9tmY886X6duLYvQ/hJlKM3Y
	g8Paa1mV3Vm7++NoOrfpwVZZvzXyRhEws8qLoGDBtHOxJGr87TTDdPJgLGI9Z/pTZvKL+VDokOE0f
	zByBtsk4E4pd7x1c9u1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbGne-00DWWF-JW; Mon, 04 Apr 2022 07:06:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbGnb-00DWUY-AI
 for ath11k@lists.infradead.org; Mon, 04 Apr 2022 07:06:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 402E4B80D3F;
 Mon,  4 Apr 2022 07:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23734C340EE;
 Mon,  4 Apr 2022 07:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649056007;
 bh=kBUstR3J4ItDnVp87evnZA04BHghVTsaKKXGf6QdOCs=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=Tg/FdtHFmcrmCnSrrTX6e2TfhXvy+gFfSfrRcwTmUN+vOL+1fUZr1X+O9oNBsK77G
 j4ChIZ0Ix083n7qG+D3ZNnSEM8lrbY4Uq3iQQwrHJu+meR56KfXxfiJHs7vQ0XMaRk
 fs/xuIsVC64ZovxMTZFxb0Tw+iN2In5PF1eiIeLwqk3rpM4LanwAswPaJvK+0x2CiS
 MilTbKqH2arAIBqv8rfpBfv+e2GfoR0r67Dkn2opw6HL32p6G8fiuQHRuvMLUXjWyT
 +oqJlrBF0Hw7yZayJMq9oMj2UWYAhFUjmc4NY19QxRoDLi/oFTzx4cvE4JrEUOgsol
 lXXzkUj2VF3vA==
From: Kalle Valo <kvalo@kernel.org>
To: Robert Marko <robimarko@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ath11k: select QRTR for AHB as well
References: <20220401093554.360211-1-robimarko@gmail.com>
 <87ilrsuab4.fsf@kernel.org>
 <CAOX2RU4pCn8C-HhhuOzyikjk2Ax3VDcjMKh7N6X5HeMN4xLMEg@mail.gmail.com>
Date: Mon, 04 Apr 2022 10:06:40 +0300
In-Reply-To: <CAOX2RU4pCn8C-HhhuOzyikjk2Ax3VDcjMKh7N6X5HeMN4xLMEg@mail.gmail.com>
 (Robert Marko's message of "Sat, 2 Apr 2022 11:52:21 +0200")
Message-ID: <87zgl1s4xr.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_000651_687993_DDDFBCB1 
X-CRM114-Status: GOOD (  22.15  )
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

Robert Marko <robimarko@gmail.com> writes:

> On Fri, 1 Apr 2022 at 16:51, Kalle Valo <kvalo@kernel.org> wrote:
>>
>> Robert Marko <robimarko@gmail.com> writes:
>>
>> > Currently, ath11k only selects QRTR if ath11k PCI is selected, however
>> > AHB support requires QRTR, more precisely QRTR_SMD because it is using
>> > QMI as well which in turn uses QRTR.
>> >
>> > Without QRTR_SMD AHB does not work, so select QRTR in ATH11K and then
>> > select QRTR_SMD for ATH11K_AHB and QRTR_MHI for ATH11K_PCI.
>> >
>> > Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
>> >
>> > Signed-off-by: Robert Marko <robimarko@gmail.com>
>> > ---
>> >  drivers/net/wireless/ath/ath11k/Kconfig | 3 ++-
>> >  1 file changed, 2 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/net/wireless/ath/ath11k/Kconfig b/drivers/net/wireless/ath/ath11k/Kconfig
>> > index ad5cc6cac05b..b45baad184f6 100644
>> > --- a/drivers/net/wireless/ath/ath11k/Kconfig
>> > +++ b/drivers/net/wireless/ath/ath11k/Kconfig
>> > @@ -5,6 +5,7 @@ config ATH11K
>> >       depends on CRYPTO_MICHAEL_MIC
>> >       select ATH_COMMON
>> >       select QCOM_QMI_HELPERS
>> > +     select QRTR
>> >       help
>> >         This module adds support for Qualcomm Technologies 802.11ax family of
>> >         chipsets.
>> > @@ -15,6 +16,7 @@ config ATH11K_AHB
>> >       tristate "Atheros ath11k AHB support"
>> >       depends on ATH11K
>> >       depends on REMOTEPROC
>> > +     select QRTR_SMD
>> >       help
>> >         This module adds support for AHB bus
>> >
>> > @@ -22,7 +24,6 @@ config ATH11K_PCI
>> >       tristate "Atheros ath11k PCI support"
>> >       depends on ATH11K && PCI
>> >       select MHI_BUS
>> > -     select QRTR
>> >       select QRTR_MHI
>> >       help
>> >         This module adds support for PCIE bus
>>
>> I now see a new warning:
>>
>> WARNING: unmet direct dependencies detected for QRTR_SMD
>>   Depends on [n]: NET [=y] && QRTR [=m] && (RPMSG [=n] || COMPILE_TEST [=n] && RPMSG [=n]=n)
>>   Selected by [m]:
>>   - ATH11K_AHB [=m] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ATH [=y] && ATH11K [=m] && REMOTEPROC [=y]
>
> Ahh yeah, since it's SMD then it requires RPMGS which in turn requires
> more stuff. What do you think about making it depend on QRTR_SMD
> instead, because without it AHB literally does not work?

To be honest I don't know qrtr well enough to comment right now :)

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
