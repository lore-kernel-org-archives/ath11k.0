Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A5DECAAA1
	for <ath11k@archiver.kernel.org>; Fri, 28 Oct 2022 10:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pqdvViBheW5TM7SLDbzMfNrv4UxLXj3WbSP3OSKZR0A=; b=ivySuOfuY6Btgx
	K+Q28k5XygR2jK+dOOI4xh5KYVkKXA5QTVTAwjwUabaMLzlavH7tm5jiq/uwqPj4k4dgC9bqpwd2b
	2Z/pKQzmEoEJyk9/rnO1tn/bWQtmOKdNLiXo9cd4rizds+k0d8ZiBwtj5wrgVme/r5pV5Qm1kWdHT
	sN5+sJ0EEPZ1MY45W1d3EtQgAEWjTwhBch7UrhGXRg1fUz66cpm3PuP7RvNeAldsqeHzHpdKBYdbP
	bRfMfl7sG1qXNzWBhFUbfrOL/7e+0erDJwhrMXAwn3nnPz609FJzXTg8dumRULwUS9fgBXV7X2yfw
	PehUy1i56kXIwPc1OSKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooMqY-00GkKm-IF; Fri, 28 Oct 2022 10:44:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooMqV-00GkJu-Ka
	for ath11k@lists.infradead.org; Fri, 28 Oct 2022 10:44:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 697216278F;
	Fri, 28 Oct 2022 10:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5B6AC433C1;
	Fri, 28 Oct 2022 10:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666953853;
	bh=LJCkbzRzJmPUdZS/GDD0YyCyaxK7rKIIYQdaVBpaOqc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=T9gyet1NUd1GrRtG7/msbRq0LdOanY+tMp/ds9BTOvICFHP9YgjjcfJP1sO1GWg1G
	 QD9Yk28kct+sUJCw0ihrUALK3W3JBdY33IZb/BUlMZn0+fdCYIGKDHDomRELb6Sfbk
	 Lyo8r2FVZR+TsDExZ147gKmV5zU4AFmlpLLTDoIdI/3Ess7mmOaxz41cRMi2OG7lL3
	 QQSPFZjeZ0SF+LiX5ZPmlejjUFi0c+cnoDY5jz2WzUJz9BfG/NzelotAH/16ZytuhI
	 zxFlpyagGs4t/Crh1gdKMJ4Q4rGCTMa8hvBrvNOoLmQ6zq3U9EBGw1LHrnu5a4qX9X
	 zcMncQxVGKQFw==
From: Kalle Valo <kvalo@kernel.org>
To: "Joseph S. Barrera III" <joebar@chromium.org>
Cc: Rahul Bhattacharjee <quic_rbhattac@quicinc.com>,  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH] wifi: ath11k: Fix qmi_msg_handler data structure initialization
References: <20221021090126.28626-1-quic_rbhattac@quicinc.com>
	<11e005c2-2363-d63f-9f3f-3ca811737231@chromium.org>
Date: Fri, 28 Oct 2022 13:44:09 +0300
In-Reply-To: <11e005c2-2363-d63f-9f3f-3ca811737231@chromium.org> (Joseph S.
	Barrera, III's message of "Wed, 26 Oct 2022 12:46:56 -0700")
Message-ID: <87pmecgrd2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_034415_752435_E3EB2C7F 
X-CRM114-Status: GOOD (  13.00  )
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

"Joseph S. Barrera III" <joebar@chromium.org> writes:

> On 10/21/22 2:01 AM, Rahul Bhattacharjee wrote:
>
>>   	},
>> +	{/* end of list */}
>>   };
>
> Do you want to add a comma after that last list element?

I can add that in the pending branch.

>
> Actually, I normally see the last list element simply being
>
>> +	{},
>
> ... with no comment necessary.

I would prefer to have a comment to make it more visible that an empty
element is needed at the end, but I would add that outside of braces?

/* end of list */
{},

Thoughts? I can change this in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
