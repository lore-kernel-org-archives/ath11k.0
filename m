Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7FDC433FE
	for <ath11k@archiver.kernel.org>; Tue,  1 Nov 2022 14:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uYnLsTiquXhnMqa6r7OTc+vFaTVrOMfTVZXuAAqPtMU=; b=z+nx7dTy5btbwI
	gtgWCFpQjALHgNkyYfhkbBnrOJdDoRzQg/rV7TotJbCLcPx1lHaPOZhF9zip+iRQAhou2nJphyVmP
	Dx12zYxMjwcByzh9qZCRQraxQuSdIqUCQZ49z/W1q+CsSKDnlVr/pmQT3xID3ASNKIgclaQREq9x3
	vTZEBPdRafRgfOFLVsuKTHEb8C5PEwpZKqMyvx0aHTPGCtA6tcTloMicJnaI5hTuvtszbBR6gQ/bE
	MjVjRiKi3Lw3YHyKPrwL9AhLBdjkVY+2hsmhoouM2dn6pdMnH2RC5t24tJAWXGBaJUASH6ZhII0dB
	dUME6XJTOoNroIJ0U/RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opsei-005eM6-Az; Tue, 01 Nov 2022 14:54:20 +0000
Received: from c-67-160-137-253.hsd1.or.comcast.net ([67.160.137.253] helo=[10.0.0.152])
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opseg-005eKf-UY; Tue, 01 Nov 2022 14:54:19 +0000
Message-ID: <503a3b36-2256-a9ce-cffe-5c0ed51f6f62@infradead.org>
Date: Tue, 1 Nov 2022 07:54:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] ath11k (gcc13): synchronize
 ath11k_mac_he_gi_to_nl80211_he_gi()'s return type
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Jiri Slaby <jirislaby@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, linux-kernel@vger.kernel.org,
 Martin Liska <mliska@suse.cz>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
References: <20221031114341.10377-1-jirislaby@kernel.org>
 <55c4d139-0f22-e7ba-398a-e3e0d8919220@quicinc.com>
 <833c7f2f-c140-5a0b-1efc-b858348206ec@kernel.org> <87bkprgj0b.fsf@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87bkprgj0b.fsf@kernel.org>
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



On 11/1/22 01:45, Kalle Valo wrote:
> Jiri Slaby <jirislaby@kernel.org> writes:
> 
>> On 31. 10. 22, 22:16, Jeff Johnson wrote:
>>
>>> On 10/31/2022 4:43 AM, Jiri Slaby (SUSE) wrote:

>>> Suggest the subject should be
>>> wifi: ath11k: synchronize ath11k_mac_he_gi_to_nl80211_he_gi()'s return type
>>
>> FWIW I copied from:
>> $ git log --format=%s  drivers/net/wireless/ath/ath11k/mac.h
>> ath11k: Handle keepalive during WoWLAN suspend and resume
>> ath11k: reduce the wait time of 11d scan and hw scan while add interface
>> ath11k: Add basic WoW functionalities
>> ath11k: add support for hardware rfkill for QCA6390
>> ath11k: report tx bitrate for iw wlan station dump
>> ath11k: add 11d scan offload support
>> ath11k: fix read fail for htt_stats and htt_peer_stats for single pdev
>> ath11k: add support for BSS color change
>> ath11k: add support for 80P80 and 160 MHz bandwidth
>> ath11k: Add support for STA to handle beacon miss
>> ath11k: add support to configure spatial reuse parameter set
>> ath11k: remove "ath11k_mac_get_ar_vdev_stop_status" references
>> ath11k: Perform per-msdu rx processing
>> ath11k: fix incorrect peer stats counters update
>> ath11k: Move mac80211 hw allocation before wmi_init command
>> ath11k: fix missed bw conversion in tx completion
>> ath11k: driver for Qualcomm IEEE 802.11ax devices
> 
> Yeah, using "wifi:" is a new prefix we started using with wireless
> patches this year.
> 

It would be nice if that was documented somewhere...

-- 
~Randy

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
