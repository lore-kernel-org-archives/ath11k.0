Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB945EE49A4
	for <ath11k@archiver.kernel.org>; Tue, 22 Aug 2023 13:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7+UfdEJriueUliweOIk6rpYHnZms/++cQYL51qHL3fo=; b=VPe+bpamZ6vjzl
	seM7E6sL3Kmx4qdTXSPkvVGzTu0jy7C1utMe5LBF+/XukGhjbenSZmeOJ8ROwLMTTD8rjAdyTIapC
	MZ7tiapx9XjxVf3k6FtzZlahoO6mmlebTvwl+6xAQJUSYTNK742+6iBQNTo0q0uVnVZi/d8B3bCST
	b0n+E8KQgUpjzDBVlaqgOD4xMVg15Di0kf3Jy9IGrP9W9bejhQ/8bOlBmFpJFhtwz2PBdAWEjMfHf
	gPgAlHsRSx/LDYcb+hQdcap9uv5mJNYBVgmROeTPpSLGi7rvwKoWt7D4lOh+gpUaobEzr7b4K1SGR
	L32sfQT16HlkTVoTTzqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYR1K-00FwuN-0T;
	Tue, 22 Aug 2023 13:02:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYR1H-00Fwtx-03
	for ath11k@lists.infradead.org;
	Tue, 22 Aug 2023 13:02:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6376663972;
	Tue, 22 Aug 2023 13:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F5FC433BA;
	Tue, 22 Aug 2023 13:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692709321;
	bh=5wNvmmVUGipwdFV4DA5Qq+spVPdhC20+U8ualyHiEww=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=If6P8PLS1eHkLD5z6uQv3eMQ0eflflKqG0zQ/E7ehqhE9Ccgbgpuibkpy7IulplHp
	 iGsGdyaSo36LwFFEYMc3u15d35wD0ajPs9MQOvgogLcHhYnNLRwnQC1dOF1OsLsq/a
	 HacXXIROiENeIzBPt/QU12GeEi98/wOm53q+NinEQhu4n16dzIbeBYuBQz5gjvoOhv
	 BRYYDrYSrCfOW8j2idMQKHbre+FQ+uwC/kVQvqBemCZVebvENM9bu86E9MOQ23HzFq
	 j9eb1Ha5RWNbOYusxmQvzOs0FuWoAlhOI9N3oECwXjlOWNXwD1iIzw5qRxz8Oz7yhW
	 mcIfc8FsMY70A==
From: Kalle Valo <kvalo@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  =?utf-8?Q?Fran=C3=A7ois?=
 Armand
 <fanf42@gmail.com>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,  Linux ath11k
 <ath11k@lists.infradead.org>,  Linux Bluetooth
 <linux-bluetooth@vger.kernel.org>,  Marcel Holtmann <marcel@holtmann.org>,
  Johan Hedberg <johan.hedberg@gmail.com>,  Luiz Augusto von Dentz
 <luiz.dentz@gmail.com>
Subject: Re: Fwd: Qualcomm NFA725A on T14s AMD Gen3: Bluetooth: hci0: Failed
 to send headers (or body or access otp area)
References: <a669d2d5-fee8-5841-eb5f-b7d047d3cdb2@gmail.com>
	<87il99j8dh.fsf@kernel.org>
	<89c53213-cb9b-7a8c-bc9c-92cabfdbba4d@gmail.com>
Date: Tue, 22 Aug 2023 16:01:57 +0300
In-Reply-To: <89c53213-cb9b-7a8c-bc9c-92cabfdbba4d@gmail.com> (Bagas Sanjaya's
	message of "Tue, 22 Aug 2023 15:21:13 +0700")
Message-ID: <87fs4bi62i.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_060203_097042_89E9644A 
X-CRM114-Status: GOOD (  14.93  )
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

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> On 21/08/2023 12:02, Kalle Valo wrote:
>> Bagas Sanjaya <bagasdotme@gmail.com> writes:
>> 
>>> Hi,
>>>
>>> I notice a bug report on Bugzilla [1]. Quoting from it:
>>>
>>>> Hello,
>>>>
>>>> (Sorry by advance if it's not the correct place to discuss that, but
>>>> I tried other place like my distro kernel forum
>>>> (https://bbs.archlinux.org/viewtopic.php?id=286929), interactive
>>>> chat, etc and nobody was able to help).
>>>>
>>>> [1] == Short summary ==
>>>>
>>>> I have a lenovo T14S AMD Gen 3 with a *Qualcomm NFA725A* Wi-Fi card
>>>> (which is actually reported by lspci as QCNFA765) and bluetooth
>>>> never worked on it, failing to load the rampatch with "failed to
>>>> send header" or "failed to send body" or "Failed to access otp area
>>>> (-71)".
>>>>
>>>> Other people reports bluetooth as working
>>>> (https://wiki.archlinux.org/title/Lenovo_ThinkPad_T14s_(AMD)_Gen_3)
>>>> and a work friend has a T16 AMD gen1 which seems to have exactly the
>>>> same chipset and work flowlessly. So perhaps it's an hardware issue,
>>>> but I don't know how to qualify it if so.
>>>>
>>>> => How can this be further qualified/debuged/workarounded?
>>>>
>>>> Any help, even RTFM pointing to corresponding manuals would be very
>>>> much appreciated.
>> 
>> This looks like a bluetooth bug so not related to ath11k (which is a
>> Wi-Fi driver).
>> 
>
> Oops, I really can't guess which driver is the culprit in this case unless
> the reporter also attaches lsmod output.

No worries, it's understandable that it's not always clear where the
problem is. And most likely the reporter also has ath11k driver loaded
as the same chip has both Wi-Fi and Bluetooth functionality.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
