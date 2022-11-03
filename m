Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1A6C43219
	for <ath11k@archiver.kernel.org>; Thu,  3 Nov 2022 06:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TOL9+ukEzpvGpMYHh0CKvFSt94Ze6ayhkeixiJAYnWc=; b=slceaPTwkJjkTM
	Z52WiFhhQfalKlhJ8T88TYGEHDDJE6SrrdO8Oy7OhLXVdBcnqmDN2XaR2dsZJRHWrjHxFl8Gx3EKG
	HB5dP2D2bugQIaCF3VLEeLF4SEhS222SXJMsi4ELGTC+Gogx3QyJtU4dA+mVYmqqy/oaNAV5NUkwL
	82XPJ9Z2K8qCU0waavpjGP+gEdwW7LggkReldVmXUu6DFs04KuyxLmxBPa5wAaphPd4OCrnNVYt9q
	pq+bTwIhSQQxr4kZ011uMr77AwMAWkGecBzy425ykRBS127VGo9yi+lJiprZBeemZONIDTZticUAz
	Y5WYE1ehlAKwsyxoly0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqTaF-00GHFV-SQ; Thu, 03 Nov 2022 06:20:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqTaD-00GHEq-4U
	for ath11k@lists.infradead.org; Thu, 03 Nov 2022 06:20:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 642CE61CB0;
	Thu,  3 Nov 2022 06:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8C5C433C1;
	Thu,  3 Nov 2022 06:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667456407;
	bh=1/ZTNSeHhw7KZLpujNODYcl9QDOvXgizgyblR1U3cD8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=S4Z7ONY9cUPZGYaMJXhzIz2YJCelF5P5Pfl/zmJs0c0oMS8FTM8F1H+GqtWVSnPUi
	 NQWH2ZueGu7l+Puz3/BoOz3mMDvZWkeARnLNNbC5JCquR0KfUgEqqxh0SoieUkc+dh
	 gGcyWAzNc5PsQj8soJyY/DDmz4g/7WjMgyefKOVm1Gf9qxBmVI/tnZIZeWAIJapytx
	 bJ0leI2q9hy/eFxj4SnETfDWTaU99+uXVLW1GW7e/MwyXIjPNbLRS0A2LQGd4Cklya
	 r2sngcaEwvzhcQNVRRUbo6tOE7hEnF5KVGoSiME/r6MbPbRu4UFmXPyCq88ej2VfPQ
	 eAJpM+o1tfa1g==
From: Kalle Valo <kvalo@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,  Jeff Johnson <quic_jjohnson@quicinc.com>,  linux-kernel@vger.kernel.org,  Martin Liska <mliska@suse.cz>,  "David S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org
Subject: Re: [PATCH] ath11k (gcc13): synchronize ath11k_mac_he_gi_to_nl80211_he_gi()'s return type
References: <20221031114341.10377-1-jirislaby@kernel.org>
	<55c4d139-0f22-e7ba-398a-e3e0d8919220@quicinc.com>
	<833c7f2f-c140-5a0b-1efc-b858348206ec@kernel.org>
	<87bkprgj0b.fsf@kernel.org>
	<503a3b36-2256-a9ce-cffe-5c0ed51f6f62@infradead.org>
	<87tu3ifv8z.fsf@kernel.org>
	<1041acdb-2978-7413-5567-ae9c14471605@infradead.org>
Date: Thu, 03 Nov 2022 08:20:00 +0200
In-Reply-To: <1041acdb-2978-7413-5567-ae9c14471605@infradead.org> (Randy
	Dunlap's message of "Tue, 1 Nov 2022 10:54:11 -0700")
Message-ID: <87cza4ftkf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_232009_238161_D7C39715 
X-CRM114-Status: GOOD (  18.70  )
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

>>>> Yeah, using "wifi:" is a new prefix we started using with wireless
>>>> patches this year.
>>>>
>>>
>>> It would be nice if that was documented somewhere...
>> 
>> It is mentioned on our wiki but I doubt anyone reads it :)
>
> I think that you are correct. ;)
>
>> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#subject
>> 
>> Do let me know if there are other places which should have this info.
>
> Ideally it would be in the subsystem's profile document as described in the
> MAINTAINERS file:
>
> 	P: Subsystem Profile document for more details submitting
> 	   patches to the given subsystem. This is either an in-tree file,
> 	   or a URI. See Documentation/maintainer/maintainer-entry-profile.rst
> 	   for details.
>
> although that seems to be overkill IMHO just to add a prefix: setting.
>
> You could just clone some other maintainer's Profile document and then modify it
> to anything that you would like to have in it as far as Maintaining and patching
> are concerned.

Ah, we should add that doc for wireless. Thanks for the idea, I added
that to my todo list.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
