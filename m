Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E47FC43217
	for <ath11k@archiver.kernel.org>; Tue,  1 Nov 2022 17:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EHzuhvS/lJp63Cpx+kcsAVkVuMmV0i76//BScYajToM=; b=1SGCFLV4o3MFby
	JAIrF3G0QMU0fP+Ydh8qvhiMUWAQfZdzdY+YahHovkw5v4573DGbTV/BSwi9b3EhMOEEEUS1lPuw8
	3IRtmrgNlNmhLpGyGV7WEO3RgOjDkp9eKzxrsIpYESeoGabZxhovxsaNUCKDvmuJaL6yJgyYnfrRs
	OEz5MC4DCFNEiETCJILrmbN7CY6YWdmMSI4k1AedfAP5wSHk6dD60E4sF46KepjZLteYmIUOsd+6i
	ULyIVG4Qj8xEjjeFtfbZ3j/KFvkGnDx/hG1Von9aJrvs+kfW2J9lZUYmyvovlk++XYh8ZJJ1rwMfr
	z6WMMr9G4bAyt2lk1Q2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opuv4-006DaU-MR; Tue, 01 Nov 2022 17:19:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opuv1-006DWt-8t
	for ath11k@lists.infradead.org; Tue, 01 Nov 2022 17:19:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8F76FB81B0E;
	Tue,  1 Nov 2022 17:19:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2301C433C1;
	Tue,  1 Nov 2022 17:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667323154;
	bh=lfPoEEftUZlMenC9khV7toov5g+JQfpa6hsi3HYXnUg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ME2eDAtxCFdnCDNfuEQb9c1pt6pxplc9tNMzA+vmQsRiwmso4dmmOvfXqpUfzxoQk
	 o4+FZPj8GExOPlPooJj3rNSLcQxaxSaHUydjkJkAZNiEwrewPmfSwTWGH0iff8QMKZ
	 2w2S9XRZ/5Wac9g6GOpVUK07l6DNX/RE9dpm2f/tTEFigSsh8EQasTACRL8JXzKQ/m
	 WixTo3iyIX7x3aSLLKAX4IPMdQ526yuAbC3RDKfIScrFSub2Pf2JXrxsXuH+zUoEZP
	 xQy31M9YU5/zbrOMcMl1BJorfPef/2p+hJQoN5h6bLSCEAXs5skEt0W8ItwCj+S8nG
	 Bhj2P8ytFhtGQ==
From: Kalle Valo <kvalo@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,  Jeff Johnson <quic_jjohnson@quicinc.com>,  linux-kernel@vger.kernel.org,  Martin Liska <mliska@suse.cz>,  "David S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org
Subject: Re: [PATCH] ath11k (gcc13): synchronize ath11k_mac_he_gi_to_nl80211_he_gi()'s return type
References: <20221031114341.10377-1-jirislaby@kernel.org>
	<55c4d139-0f22-e7ba-398a-e3e0d8919220@quicinc.com>
	<833c7f2f-c140-5a0b-1efc-b858348206ec@kernel.org>
	<87bkprgj0b.fsf@kernel.org>
	<503a3b36-2256-a9ce-cffe-5c0ed51f6f62@infradead.org>
Date: Tue, 01 Nov 2022 19:19:08 +0200
In-Reply-To: <503a3b36-2256-a9ce-cffe-5c0ed51f6f62@infradead.org> (Randy
	Dunlap's message of "Tue, 1 Nov 2022 07:54:16 -0700")
Message-ID: <87tu3ifv8z.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_101919_615163_A6E2376F 
X-CRM114-Status: GOOD (  15.93  )
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

Randy Dunlap <rdunlap@infradead.org> writes:

> On 11/1/22 01:45, Kalle Valo wrote:
>> Jiri Slaby <jirislaby@kernel.org> writes:
>> 
>>> On 31. 10. 22, 22:16, Jeff Johnson wrote:
>>>
>>>> On 10/31/2022 4:43 AM, Jiri Slaby (SUSE) wrote:
>
>>>> Suggest the subject should be
>>>> wifi: ath11k: synchronize ath11k_mac_he_gi_to_nl80211_he_gi()'s return type
>>>
>>> FWIW I copied from:
>>> $ git log --format=%s  drivers/net/wireless/ath/ath11k/mac.h
>>> ath11k: Handle keepalive during WoWLAN suspend and resume
>>> ath11k: reduce the wait time of 11d scan and hw scan while add interface
>>> ath11k: Add basic WoW functionalities
>>> ath11k: add support for hardware rfkill for QCA6390
>>> ath11k: report tx bitrate for iw wlan station dump
>>> ath11k: add 11d scan offload support
>>> ath11k: fix read fail for htt_stats and htt_peer_stats for single pdev
>>> ath11k: add support for BSS color change
>>> ath11k: add support for 80P80 and 160 MHz bandwidth
>>> ath11k: Add support for STA to handle beacon miss
>>> ath11k: add support to configure spatial reuse parameter set
>>> ath11k: remove "ath11k_mac_get_ar_vdev_stop_status" references
>>> ath11k: Perform per-msdu rx processing
>>> ath11k: fix incorrect peer stats counters update
>>> ath11k: Move mac80211 hw allocation before wmi_init command
>>> ath11k: fix missed bw conversion in tx completion
>>> ath11k: driver for Qualcomm IEEE 802.11ax devices
>> 
>> Yeah, using "wifi:" is a new prefix we started using with wireless
>> patches this year.
>> 
>
> It would be nice if that was documented somewhere...

It is mentioned on our wiki but I doubt anyone reads it :)

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#subject

Do let me know if there are other places which should have this info.

I did assume it will take at least a year or two before people get used
to the new prefix, but my patchwork script has a check for this and it's
trivial to fix the subject before I commit the patch. So hopefully the
switch goes smoothly.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
