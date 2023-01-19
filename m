Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED532C00A5A
	for <ath11k@archiver.kernel.org>; Thu, 19 Jan 2023 15:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tjTcFcUwweXJh5gSVgSqnMEqIWh4IUSP9pu5BPuLFh0=; b=C9DW+cFntTrV52
	p52N0FyGyZ6JuACAFZM/jqDXqaTnegHvSKFm4KsRKmTMjOSwFWs1z9abJRYqrQVamhJzsvllM1cMh
	+3p9tU1WOt5oTTdkw4ozhsTlx0Vsxik7ynEhbNFamiVfFTZZ+TiDpDdlMpoEGOYuprnjREmnVXmzi
	EZuemDdUtKeprG9+oEOItsaJz8YPGMKmZWjf75qacdS5UZRy1Jr66LT4YL6uiiYR6XOjvvi8GBSrr
	xIQO8XjLswwuam7PCCKXGUvmSFw5DIBBXI2wgk0RGgyRcZ/Zc0A+HzAREA0dzK3d/ikT/f+sIirXg
	qsCEYLyr2iIgituGo0kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIWQ3-005WIn-VI; Thu, 19 Jan 2023 15:01:35 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIWHg-005T1Q-Vj
	for ath11k@lists.infradead.org; Thu, 19 Jan 2023 14:52:58 +0000
Received: from [192.168.0.203] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MTzve-1pAEpA2DTu-00R2wF; Thu, 19 Jan 2023 15:52:46 +0100
Message-ID: <1609a645-3e23-7e37-9aa1-94f970e481e2@green-communications.fr>
Date: Thu, 19 Jan 2023 15:52:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] nl80211: add support to enable/disable bss color
 collision detection
Content-Language: fr, en-US
To: Johannes Berg <johannes@sipsolutions.net>,
 Rameshkumar Sundaram <quic_ramess@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20221226083328.29051-1-quic_ramess@quicinc.com>
 <20221226083328.29051-2-quic_ramess@quicinc.com>
 <74c57dc34af10537f98f5bb9b6ce80e5676e09b0.camel@sipsolutions.net>
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
In-Reply-To: <74c57dc34af10537f98f5bb9b6ce80e5676e09b0.camel@sipsolutions.net>
X-Provags-ID: V03:K1:HHBEj0U4WXgOh3ukuJSMwstGODz3ephBJOC5ByETGYIfJ8RUnuv
 mTnX23rMJ1dW27IT4pu4tEjNWyXqrekRq7/loOX7ZQ6ihk/SGXfhNk41d+0J95Xjp1vnROM
 8CVCrZG2i2OiL2tCYtw3EEm0bNa5av7QUsv2NWbjabDZCWu5o2iBvNmjZKr/CXGo9TXTEDf
 I2TcYvOCA5LWr41UQLPDQ==
UI-OutboundReport: notjunk:1;M01:P0:hNF5wg0rWs8=;PWEJHSR8CJQ0SFlfl0tzqoABKOC
 Tdzil59Iw1cji21fhYEOrj400GYdR7SSdFu8HzhSXxaot645iwRgm7jp+yIKiMzt6itrB8mRR
 0tJKCfqyOy+DdYTLl6P4a1uFiyXnSfnScu4pIlLcaKzDJyOQ0gGZHiIkVxfWcOLAvUg4g7CzB
 kVQ9sX5fNvfuChwyLiuQbBe26KSkAS9/X3CwSTEBeOj7yqmNf1qgT3adbnyEr5lQhRtlvFlNP
 iRYZtSgNl8Xhj3l5yII21v8RIRO//kiSSE26wNfMfS8NehmME376zTXdy8pP3X1sv/8bDWywQ
 CzAsJIprgs+s0Z1wTM8nAm7VWZftTXz+DV0E14iSkHOVdYuCXQB6DgFK8ABqKBtDy4O5O0457
 jIvPIh+ZnTt6qRQHcm5kBWiiT2D1GkNYYDIjg5pzGqfG8H6zTsQ7NlbUpOmm6ZKBqVMxs3b7W
 o9vI0oU8h5g6HxiIG+K8N7XPgOWDwfzdvRuiKpf8aDevcExhBncyfTEL/U7e20FzC6rEIcok9
 J/+no43OCZHAPaYDrvtrvI0kcRXqaNEIhsw7Ktb21CQ3b2iW0cropI+d8TW/QGhFWkkYnSleH
 VcV92YMkVglBzpsGThKsQuZzK5+sCNthB53V9DPRuFv/x53ty/ovioPdf4sdj0u/IMUd0szag
 XSQsk1p89IhGvKi5cMiF7AhVNqerGoh8iDhXL6QoZA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_065257_370053_C4F26838 
X-CRM114-Status: GOOD (  16.62  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 19/01/2023 15:02, Johannes Berg wrote:
> On Mon, 2022-12-26 at 14:03 +0530, Rameshkumar Sundaram wrote:
>> As per 802.11ax-2021, STAs shall process BSS Color Change Announcement
>> (BCCA) from AP and switch to new color, but some STAs aren't processing
>> BCCA from AP and not doing color switch, causing them to drop data
>> frames from AP post color change.
>>
>> Provide an option to disable color collision detection and therefore
>> not to do BCCA to mitigate the same from AP. If it's required in case
>> where STA supports BCCA handling, then it can enabled in AP using this
>> option.
>>
> 
> You should probably split this into cfg80211 and mac80211.
> 
> Also, this doesn't really seem to make a lot of _sense_ since nothing in
> the kernel actually acts on detection of a color collision - hostapd is
> acting on that.
> 
> So since you can easily make hostapd ignore the event, why do you even
> need this?

This may not be related, but the software color collision detection 
sends a netlink message for every colliding frame and it can hose up the 
system if the other network is very active.

Also, cfg80211_bss_color_notify() complains that the wdev lock isn't held.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
