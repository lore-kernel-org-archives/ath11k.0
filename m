Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA56C433F5
	for <ath11k@archiver.kernel.org>; Tue, 11 Oct 2022 08:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=irnK8LND0SkvrFnrPu7sz40tlsCdJcq22/1yS2RFE1o=; b=YE+0kIwz55gu4G
	MMFarmN4qFvx80MyjxJuWpn8nOgymOj5ma2wPGopLB11/BX3neJYjj6EDmg1ILhvztUGOCWPFAEgM
	av5kVcXNy+k38Pcoze64O/rwu18ojLh/toKks+qvMAoNrk0gxLp5+nHe9HaIjNzFM4ZTEy3sY6iw8
	5kiExXXh37smyVt8Z6ne2z0aLcTFMHEgbUy7eI3PZ4KoOw3I5rRjBfji/MiRjQRbvm3WTKmwYQ+eP
	CaN8roQQZTzxH8Q6emtKE533jjZB2pP0DoYwHE7lLftz3erRmDkRTGKOx8fOgZ6D3o/aX4xqmWvRE
	xwCPXyGmRj4vpXrwaNBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiANu-003fsJ-NF; Tue, 11 Oct 2022 08:13:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiANs-003frb-4S
	for ath11k@lists.infradead.org; Tue, 11 Oct 2022 08:13:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6920961143;
	Tue, 11 Oct 2022 08:13:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46790C433C1;
	Tue, 11 Oct 2022 08:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665475982;
	bh=hdV/HagkJ26SOAJFvJzmaF51kGu9RxKTWkSj9OFXJ9o=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=BipUaM7W4M0iTTaKjf/MvpWknYY7hihA0mTYx0uxRN29Mp/M0UejN70x+4LkrhLXJ
	 WQUxO/lGsuQo/76gHn00sLWGFuLu/rtVqVdR/7q0w2YaxYfswVpqDcGaDn35fapdCc
	 qI821XfCJXBwFnBC/ITOR9oWR6J3enqSOEZ4Oh+M2SdRxte0MXHeQXXyH89XVXnb5J
	 WQtykTZ9/dMOg/MQNmq/wefEGYBki3JTAorcRujJGa5p+FBO8oVSFUO2aPidwQ0cr1
	 HLz53LFGilK3SEzRKmNIeSP0mFQvy+BqPSaimShSBPYpL2PPOQMUjKR40F3dX+4VoO
	 7sQdaiWbLjD3A==
From: Kalle Valo <kvalo@kernel.org>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Naresh Kamboju" <naresh.kamboju@linaro.org>,  Netdev <netdev@vger.kernel.org>,  "open list" <linux-kernel@vger.kernel.org>,  linux-wireless@vger.kernel.org,  "David S . Miller" <davem@davemloft.net>,  "Eric Dumazet" <edumazet@google.com>,  "Jakub Kicinski" <kuba@kernel.org>,  "Paolo Abeni" <pabeni@redhat.com>,  ath11k@lists.infradead.org,  regressions@lists.linux.dev,  lkft-triage@lists.linaro.org
Subject: Re: drivers/net/wireless/ath/ath11k/mac.c:2238:29: warning: 'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size 0
References: <CA+G9fYsZ_qypa=jHY_dJ=tqX4515+qrV9n2SWXVDHve826nF7Q@mail.gmail.com>
	<87ilkrpqka.fsf@kernel.org>
	<158e9f4f-9929-4244-b040-78f2e54bc028@app.fastmail.com>
Date: Tue, 11 Oct 2022 11:12:56 +0300
In-Reply-To: <158e9f4f-9929-4244-b040-78f2e54bc028@app.fastmail.com> (Arnd
	Bergmann's message of "Mon, 10 Oct 2022 19:52:09 +0200")
Message-ID: <87tu4aok1j.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_011304_231037_8E69ECEC 
X-CRM114-Status: GOOD (  15.83  )
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

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Mon, Oct 10, 2022, at 6:54 PM, Kalle Valo wrote:
>> Naresh Kamboju <naresh.kamboju@linaro.org> writes:
>
>>>
>>> Build log: https://builds.tuxbuild.com/2F4W7nZHNx3T88RB0gaCZ9hBX6c/
>>
>> Thanks, I was able to reproduce it now and submitted a patch:
>>
>> https://patchwork.kernel.org/project/linux-wireless/patch/20221010160638.20152-1-kvalo@kernel.org/
>>
>> But it's strange that nobody else (myself included) didn't see this
>> earlier. Nor later for that matter, this is the only report I got about
>> this. Arnd, any ideas what could cause this only to happen on GCC 11?
>>
>> -- 
>> https://patchwork.kernel.org/project/linux-wireless/list/
>>
>> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
>
> No idea here, though I have not tried to reproduce it. This looks
> like a false positive to me, which might be the result of some
> missed optimization in the compiler when building with certain
> options. I see in the .config that KASAN is enabled, and this sometimes
> causes odd behavior like this. If it does not happen without KASAN,
> maybe report it as a bug against the compiler.

You guessed correctly, disabling KASAN makes the warning go away. So no
point of reporting this to GCC, thanks for the help!

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
