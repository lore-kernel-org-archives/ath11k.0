Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86164C3DA45
	for <ath11k@archiver.kernel.org>; Wed, 10 Jul 2024 11:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9djCwGIQpg1+dkmG73sAexDEk3UaYf9yHoemOZD+77E=; b=Y3hI4v8Rdp7ZCq/nhRxvsA9q8F
	mgbbyDvHchw79tgkl7hdG+NgtRDGgFSGi3cqUsHwH/AHrwKEPcnMlxRW4TqvLw/Ev95Uvvc9i+BVb
	0WFIOPdau1zY8Ci2IZ/WDJS4cLg+XR6EIMBbab1rxKEvNllSujcMEbJu/J+h+nVcXguvaw9GxJjT/
	Jy0bjxI4iB4Cdzyf/SGOTUZj6rTBvGloam0cc9wNtG0ztvwX5gDh8KZs08g51M+/JYAsf6LdFTAuU
	cysMHf92v0ExF8K+Cs/XHWGy574MXjgbAQRIJZPhjmowz3S6JW8zD+uknyoDkA7T9aWh1MBODEZDh
	X4r2FV0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRVaj-0000000ANVE-2psx;
	Wed, 10 Jul 2024 11:34:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRVag-0000000ANUB-2N8O
	for ath11k@lists.infradead.org;
	Wed, 10 Jul 2024 11:34:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 07E6C619E5;
	Wed, 10 Jul 2024 11:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E8FC32781;
	Wed, 10 Jul 2024 11:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720611269;
	bh=SFf56qesTwW8eyCgs86o/CdCfntSjMs1uzoiDKqoYB4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=sDG3hqV9mmgq3f0UF6WCbYrAIBgT7l2e54KlClHJrSh580v+9T5nOb9cR/1S7Kvn5
	 wCuyXhQHKRTnrb9qa2bQZAYzLWe+qmE3jGHOIhkUunbEKypr05ytyLoWNlJYefgUai
	 L46RkUKucT+w/QESHAEKK7SxRUEksp90PJMP7mg1g37ViPlE71ucWb4WVJrEsnMJ/3
	 sm4FLwhfhKOlRVOo737Od1QsXxAErFoJSZC+BjnmMW35SG7V8Z2Bko27WcwRYkPfIQ
	 mIamv0Z1Iby7CDbrJfNJbBSMPsByD/KOol9KaLOB0xveyPCUTtndLTpxujVGNb5Gxg
	 znauG+YF2dh5Q==
From: Kalle Valo <kvalo@kernel.org>
To: Stefan Zegenhagen <stefan.zegenhagen@azg-tech.com>
Cc: ath11k@lists.infradead.org
Subject: Re: ath11k: IPQ6018: support for 802.11s MESH
References: <3581dfd05dd3468d97b3fd06072d206732da9482.camel@azg-tech.com>
	<87frsjdhzn.fsf@kernel.org>
	<196d7fb9f411cbfad0c8cf690efcf55da01469c0.camel@azg-tech.com>
	<87cynlbk8p.fsf@kernel.org>
	<210aa4455308a531fc118a6c60d7b5b2ab300257.camel@azg-tech.com>
Date: Wed, 10 Jul 2024 14:34:27 +0300
In-Reply-To: <210aa4455308a531fc118a6c60d7b5b2ab300257.camel@azg-tech.com>
	(Stefan Zegenhagen's message of "Wed, 10 Jul 2024 13:16:39 +0200")
Message-ID: <878qy9bhvg.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_043430_664753_27D9E9A6 
X-CRM114-Status: GOOD (  18.89  )
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

Stefan Zegenhagen <stefan.zegenhagen@azg-tech.com> writes:

> Dear Kalle,
>
>> 
>> > Could you please at least answer the question whether mesh is
>> > supposed
>> > to be working on IPQ6018 with vanilla kernel, which firmware
>> > version is
>> > required and whether it is required to enable raw mode data path?
>> > Is
>> > there some knowledge around? With ath10k, there was at least a WMI
>> > services file in debugfs and a feature list in the 'bin' file. Both
>> > are
>> > no longer available and I can no longer see anything about firmware
>> > capabilities.
>> 
>> I have not tested mesh mode myself with IPQ6018 but I did saw a
>> report
>> claiming that at least this firmware has working mesh mode:
>> 
>> https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/tree/main/IPQ6018/hw1.0/2.6.0.1/WLAN.HK.2.6.0.1-01291-QCAHKSWPL_SILICONZ-1?ref_type=heads
>> 
>> Though that's not the most reliable source so I'm taking the report
>> as a
>> grain of salt.
>> 
>
> Thanks very much for the answer. I'll use that as a starting point
> (just yesterday I found the relatively new firmware version) for
> further investigations.

Please let us know what were your findings. I would like to have IPQ6018
test setup myself but I have never found the time to set it up :/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

