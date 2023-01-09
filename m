Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75EEC5479D
	for <ath11k@archiver.kernel.org>; Mon,  9 Jan 2023 14:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/jnmZEmM1lS1ztHyk86m5XUr6v0rI9i8Drlb1hejKh4=; b=y0swgjxyoX/4fP
	5pTL+Kt1pWfILVVbxtPbmqdTaN6HvMAvdAmugYW2l9GxxoYFayz8zm1udhkYdPev8sNz9/BUQR6S9
	LTKL569RlpeJA6a49gFFbBx0qdQ6Ou9fHgKGmdLCwKk5TTSapCOl7Mr1XpPBiM0GQ+5CGQf19uJKr
	0jqpKfLAZqyYYdQoe5hDz84bYcB1NnOVoBYloCqRGdrlprW9beFKufTke9jjdO/wV2rCoKsQvXo7q
	6nqIsAbl+46rz1PY2cD3bs0EPjWML0vPGIvrVPN1du/niaTYbkbL6TF8SU1yWG8DNJP7LHziN2ImY
	5WbqjO7/RQo+4p5vFFJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEt4Y-001wFs-Cz; Mon, 09 Jan 2023 14:24:22 +0000
Received: from ns2.wdyn.eu ([5.252.227.236])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEt2f-001vKG-4Y
	for ath11k@lists.infradead.org; Mon, 09 Jan 2023 14:22:27 +0000
Message-ID: <3372b42f-b9bf-20e8-35f9-5370571a9e35@wetzel-home.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wetzel-home.de;
	s=wetzel-home; t=1673274143;
	bh=bwNb7nOomg5nRnP4yNloacF+RTZCjPvfmUfkMsxtiGc=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=nBglt9/JsSg8JFVO+h3aaMepjYeqbtULg9i0O7VXy9Ppj9A6cDsD5ASEgcLBbTO6x
	 DWOqi4Q09M30klD3ynIO9RzV/Bxjgi9InzzKgicQekjDnAE+4bKv02dqBGbCyfV1VI
	 gmeZ+9CMtifYC4pQWlbkAhwX9YaA/UE9G7NrXqv0=
Date: Mon, 9 Jan 2023 15:22:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] wifi: mac80211: change initialize for sk_buff in
 ieee80211_tx_dequeue()
Content-Language: en-US
From: Alexander Wetzel <alexander@wetzel-home.de>
To: Guenter Roeck <linux@roeck-us.net>, Wen Gong <quic_wgong@quicinc.com>
Cc: johannes@sipsolutions.net, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
References: <20221212083607.21536-1-quic_wgong@quicinc.com>
 <20230105052647.GA2477583@roeck-us.net>
 <d28c6340-7ad2-d7f6-939d-3a1a057cb7da@wetzel-home.de>
In-Reply-To: <d28c6340-7ad2-d7f6-939d-3a1a057cb7da@wetzel-home.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_062225_476975_BBE51495 
X-CRM114-Status: GOOD (  12.62  )
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

On 09.01.23 15:05, Alexander Wetzel wrote:
> On 05.01.23 06:26, Guenter Roeck wrote:
>> On Mon, Dec 12, 2022 at 03:36:07AM -0500, Wen Gong wrote:
>>> The sk_buff is only set to NULL when initialize, sometimes it will goto
>>> label "begin" after ieee80211_free_txskb(), then it points to a sk_buff
>>> which is already freed. If it run into the "goto out" after arrived to
>>> label "begin", then it will return a sk_buff which is freed, it is a
>>> risk for use-after-free.
>>>
>>> Fixes: ded4698b58cb ("mac80211: run late dequeue late tx handlers 
>>> without holding fq->lock")
>>> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
>>
>> I don't see any progress on this patch. Is there a problem with it ?
>> Did it get lost ?
>>
> 
> Looks ok for me. But I just noticed that my patch
> https://patchwork.kernel.org/project/linux-wireless/patch/20221230121850.218810-1-alexander@wetzel-home.de/
> 
> should also fix the issue as an unintended side effect.

Sorry that statement was incomplete: It's only fixed when
https://patchwork.kernel.org/project/linux-wireless/patch/20221230121850.218810-1-alexander@wetzel-home.de/
and
https://patchwork.kernel.org/project/linux-wireless/patch/20230106223141.98696-1-alexander@wetzel-home.de/

are applied.









-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
