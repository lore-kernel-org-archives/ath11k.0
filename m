Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277A5C63705
	for <ath11k@archiver.kernel.org>; Wed,  7 Dec 2022 12:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ami4VoY+RGkpzQmd8OVznlL8hAQwZDAxrPH78pb8Y1o=; b=TC46k1DX0f6vfE
	ID0nsdHA/Cp3OIwJHkcSB1i6c34pGdCAVBMIh+EIAE4I4w8jylSyyrT4kMncQxKA6QQsm5TvWPSgi
	kjfQ/wNlKWL5i8GVf82bU3jAFH6OPXJlKSf1vBu9nga4dM8sIV65yjxvOm3CGXyAuctOypxY8z9l5
	udQPjRfvOlGuCIQ/0eN0apXp37lBeZQzFOZhsln84RQ4d7GRhtZo1sbMsXizXpcxeUQEV5sRdHwsG
	Vqjt3TvHTUPkss52P38BsO6GgZhErCEo5Qav0x0HVYCPb07IZKxlXQ5uDHNcSqvBMeN5G9etuU3yE
	7t/lCszYaoijuK/cKulA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2try-002khb-CN; Wed, 07 Dec 2022 12:49:50 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2trv-002kfE-3Q
	for ath11k@lists.infradead.org; Wed, 07 Dec 2022 12:49:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E991BB815D2;
	Wed,  7 Dec 2022 12:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F79C433B5;
	Wed,  7 Dec 2022 12:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670417383;
	bh=AXicRcbMt6Q30lfd1HklcIN6z+8S6e+8Nbh/BfqFBgk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pL0sNtJOp87husA4rUHe1JkHAF5bZpQn6WhCXER45b1lPOOWP2E8Fqy91f2H7rTGz
	 7ErSGTb+xM03Wpi7FpRBIgy9Jxgm5LZdVAfKORVVadtJCJk5Fk1MCRAOOd3LgY+YgW
	 D7G9fqQVuOYzOvu7qNj3Tr6AYd5w0iW44m4biLt6hozci1WwTu/9VmMG4IajRn8/hp
	 QsHDEsQiStayrMlq/yk8OQa4RkwhRxMgr7lptyzAWNBzTPWfaONWQoSALeGKLXbrgQ
	 XcmEKKc5B/w5bpqqkrtD0kCqG8RNi2raNKSY17DtwOeKdUFoR7uZyJraecbdHHe1wK
	 GCLPzv1eSS7DA==
From: Kalle Valo <kvalo@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: failed to insert STA entry for the AP (error -2)
In-Reply-To: <20221203155227.GA13254@lst.de> (Christoph Hellwig's message of
	"Sat, 3 Dec 2022 16:52:27 +0100")
References: <20221130122807.GA31720@lst.de> <87o7so4nr2.fsf@kernel.org>
	<20221130125236.GA865@lst.de> <87k03c4mdb.fsf@kernel.org>
	<20221130133016.GC3055@lst.de> <87sfhx3ap6.fsf@kernel.org>
	<20221203155227.GA13254@lst.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Wed, 07 Dec 2022 14:49:37 +0200
Message-ID: <87cz8v2xb2.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_044947_327071_6F90D7EE 
X-CRM114-Status: GOOD (  23.06  )
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

Hi Christoph,

Sorry for the delay, it was Finland's Independence Day so I was offline
for a long weekend.

Christoph Hellwig <hch@lst.de> writes:

> On Fri, Dec 02, 2022 at 08:46:45PM +0200, Kalle Valo wrote:
>> Haven't seen this before either. Really unfortunate that the warning
>> message message is not printing the error value (missed that during
>> review), but I suspect the error is coming from crypto_alloc_shash()
>> call:
>
>> Any chance you could check that? Also please check that
>> CONFIG_CRYPTO_MICHAEL_MIC is enabled (it should be as CONFIG_ATH11K
>> depends on it).
>
> So, this is the debian-installer case onc again.  CONFIG_CRYPTO_MICHAEL_MIC
> is enabled in the kernel config, but michael_mic.ko is not present on
> the installation media. Once I side-load it, the problem goes away.
>
> I guess I'll respind the MODULE_SOFTDEP patch to include michael_mic,

Thanks. But this makes me wonder is it sensible to randomly install a
set of .ko files and drop the rest, like Debian's installer apparently
does? The dependency for drivers is pretty well documented in Kconfig
files, thanks to build testers testing with random configurations, but
if the installer omits all that there will be problems just like you are
experiencing. So for me MODULE_SOFTDEP() feels just like a band aid and
not a robust solution.

Though I am happy to take your MODULE_SOFTDEP() patch, just wondering if
there is a better way to solve this. For example net/mac80211 (the
802.11 stack) has a lot of crypto dependencies:

	select CRYPTO
	select CRYPTO_LIB_ARC4
	select CRYPTO_AES
	select CRYPTO_CCM
	select CRYPTO_GCM
	select CRYPTO_CMAC
	select CRC32

And it's not using MODULE_SOFTDEP() at all.

> but if you have a good idea to make the error reporting more useful that
> would be appreciated as well.

I'll send a patch to improve the error messages in this case.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
