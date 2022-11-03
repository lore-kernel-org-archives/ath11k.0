Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1A0C433FE
	for <ath11k@archiver.kernel.org>; Thu,  3 Nov 2022 06:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wA5AuN0nQ8z1hpsNlZHY6DmTEDGKjTYrph74zsVFGEk=; b=wjK2XGaQ4yimP1
	A0VAvNjcnAz6Tv929G4rMwU7MpzD1xFeVdHd6qZR5opoVY4ptKl4/Hxngkcqz4EJ+CESPSgdn7Kkm
	OLDByqvN433xksuPMsxNnuGN1W14O7WxvSOlwDeANJLAkrD1sGMoCnVPCqbhxpJWjmRtVaVIq/PER
	T6IoD44bmdLRpse6oxhoq7qVBN9rDRnmNTBhWPfsawdiu46eysjteKNyjIFneKHbVWOCr+m8Bv8J1
	fqYhPQtDrf23WR36uoaqVxNrRMsQw7cB3yG/m43kTKeFK8IwHINy9iU6+88ZPhMlpzDfQb6Zm99rJ
	GF7EHJVcalDIVEJoYZug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqTb8-00GHLZ-Lb; Thu, 03 Nov 2022 06:21:06 +0000
Received: from [2601:1c2:d80:3110:e65e:37ff:febd:ee53]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqTb6-00GHKc-C8; Thu, 03 Nov 2022 06:21:04 +0000
Message-ID: <3efd119a-6814-7f39-3c7c-c17490adc876@infradead.org>
Date: Wed, 2 Nov 2022 23:21:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] ath11k (gcc13): synchronize
 ath11k_mac_he_gi_to_nl80211_he_gi()'s return type
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, linux-kernel@vger.kernel.org,
 Martin Liska <mliska@suse.cz>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
References: <20221031114341.10377-1-jirislaby@kernel.org>
 <55c4d139-0f22-e7ba-398a-e3e0d8919220@quicinc.com>
 <833c7f2f-c140-5a0b-1efc-b858348206ec@kernel.org> <87bkprgj0b.fsf@kernel.org>
 <503a3b36-2256-a9ce-cffe-5c0ed51f6f62@infradead.org>
 <87tu3ifv8z.fsf@kernel.org>
 <1041acdb-2978-7413-5567-ae9c14471605@infradead.org>
 <87cza4ftkf.fsf@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87cza4ftkf.fsf@kernel.org>
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



On 11/2/22 23:20, Kalle Valo wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
> 
>>>>> Yeah, using "wifi:" is a new prefix we started using with wireless
>>>>> patches this year.
>>>>>
>>>>
>>>> It would be nice if that was documented somewhere...
>>>
>>> It is mentioned on our wiki but I doubt anyone reads it :)
>>
>> I think that you are correct. ;)
>>
>>> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#subject
>>>
>>> Do let me know if there are other places which should have this info.
>>
>> Ideally it would be in the subsystem's profile document as described in the
>> MAINTAINERS file:
>>
>> 	P: Subsystem Profile document for more details submitting
>> 	   patches to the given subsystem. This is either an in-tree file,
>> 	   or a URI. See Documentation/maintainer/maintainer-entry-profile.rst
>> 	   for details.
>>
>> although that seems to be overkill IMHO just to add a prefix: setting.
>>
>> You could just clone some other maintainer's Profile document and then modify it
>> to anything that you would like to have in it as far as Maintaining and patching
>> are concerned.
> 
> Ah, we should add that doc for wireless. Thanks for the idea, I added
> that to my todo list.
> 

Thank you. :)

-- 
~Randy

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
