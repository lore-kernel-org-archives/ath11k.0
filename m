Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36FFC04FFF
	for <ath11k@archiver.kernel.org>; Wed, 17 Apr 2024 15:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z71MR9/FB4ZLioSpgSrKFmW/9gLRNuEnvteXucs//5s=; b=wrTYY0FTE08tb6HkwgH6VWalil
	PWiJkORsnvoMM0wBm0JpBnQZkewvVzhL52f91x2sSwIo3ShRn2IIWX0uO8D7XZCrVJ8ONi+ByavTK
	hCtbwA4hU5sWeWB4idGuOW6GkL90OqQwMUMhGjj/rU6G3/42R6k98yd5u7sYfcCz3HU3BhaKiUEaR
	gdYg7LRT7B8yRAEsfQI8gfWCsxEWIwrbDYWxXhSsGgb3Sj7pXyq7BNUsmcGBBW3Hs1iH8XuX2IaDa
	c8VbJcRDfAf+l2fUd4dIZnPFrRG828eQnysoXHEZOJL8jXv7Hw1/XD3Zbsp3yTQ/bcn4RK4Lh9/xj
	t5fZ/BlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx7EY-0000000Gad9-1KLN;
	Wed, 17 Apr 2024 15:30:02 +0000
Received: from [50.53.2.121] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx7ES-0000000GabK-0bD4;
	Wed, 17 Apr 2024 15:29:56 +0000
Message-ID: <1c1bc9c3-978c-4e41-8a4b-66da25416304@infradead.org>
Date: Wed, 17 Apr 2024 08:29:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 03/10] net: create a dummy net_device
 allocator
To: Alexander Lobakin <aleksander.lobakin@intel.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jakub Kicinski <kuba@kernel.org>,
 Breno Leitao <leitao@debian.org>
Cc: davem@davemloft.net, pabeni@redhat.com, edumazet@google.com,
 elder@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, nbd@nbd.name, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, taras.chornyi@plvision.eu,
 ath11k@lists.infradead.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, geomatsi@gmail.com, kvalo@kernel.org,
 quic_jjohnson@quicinc.com, leon@kernel.org,
 dennis.dalessandro@cornelisnetworks.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org, idosch@idosch.org,
 Ido Schimmel <idosch@nvidia.com>, Jiri Pirko <jiri@resnulli.us>,
 Simon Horman <horms@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
References: <20240411135952.1096696-1-leitao@debian.org>
 <20240411135952.1096696-4-leitao@debian.org>
 <20240412191626.2e9bfb4a@kernel.org>
 <ebe80c29-4884-488d-ab83-c020f9c3bc81@intel.com>
 <e0d5741ee053c11fe078fc8afe6cf4a92e274095.camel@sipsolutions.net>
 <d4991f11-a527-429d-b71f-d4ca3a18f501@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <d4991f11-a527-429d-b71f-d4ca3a18f501@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 4/17/24 4:19 AM, Alexander Lobakin wrote:
> From: Johannes Berg <johannes@sipsolutions.net>
> Date: Wed, 17 Apr 2024 13:11:38 +0200
> 
>> On Wed, 2024-04-17 at 12:51 +0200, Alexander Lobakin wrote:
>>> Just FYI: kdoc accepts only this pattern:
>>>
>>>  * @last_param: blah
>>>  *
>>>  * Return: blah
>>>
>>> NOT
>>>
>>>  * Returns: blah
>>
>> Actually, it does accept that, the regex is "returns?". It's just

ack (Return: is documented)

> Hmm, I was sure I had warnings on "Returns:"... Not sure now.
> 
Yes, either way is accepted.

> documented only as "Return" . IMHO it sometimes reads nicer as "Returns"
>> depending on how you phrase it, but ...

-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html

