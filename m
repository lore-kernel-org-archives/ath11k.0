Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A073C47072
	for <ath11k@archiver.kernel.org>; Fri, 29 Dec 2023 17:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gI9NJoBZmQwe61+vNCIL1sasuX048cpb+CG5u6tZBvY=; b=aeKG1lcweGw+R/jBUN+41+N6Wb
	RsYcBqHrjNvz7pCkzmH1+0Gsko1FQDjiQiLKk6I9+5IpZvyewIewTFTQO5IZOj5EiSzu2t2DPfh8Z
	1M+Lg+Ta0VG7stvCLCX80+n3TRVrntupWTrTfAPEsKwUpZSELqirlpvsMGt9cjxrAMtxQXtASp32M
	AZ6dgRBA4StFXUf6/aQ+F3MB/PlbT1A858IIqPuKFWAt6E0XmT9Mn4JMv3tEN6a/ldOT8H1i/rZH/
	3O8sUeE5PBpQNHo0aF31jHMmVODkQXZkktSMvTwgXacdFiEYR4sQFyu/4tb5ngL55DVu3HNCS0yVd
	UPwa0P/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJGW9-001EhM-30;
	Fri, 29 Dec 2023 17:19:29 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.164])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJGW6-001Egc-2P
	for ath11k@lists.infradead.org;
	Fri, 29 Dec 2023 17:19:28 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 9E9532C0061
	for <ath11k@lists.infradead.org>; Fri, 29 Dec 2023 17:19:21 +0000 (UTC)
Received: from [192.168.1.115] (unknown [98.97.35.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id A4BB113C2B0
	for <ath11k@lists.infradead.org>; Fri, 29 Dec 2023 09:19:20 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com A4BB113C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1703870360;
	bh=ShbO5U+oCpl/x9Z7lyO3Z1D9oustwBET869q6hUGsU4=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=M840fETK/AliLrd0ZG1/JnfDZhPlluTprZqXXtEtdIvdcvc9uTBZdZNwZAyv7lWUE
	 Y8hlZIrnH8EKETuIOOezpZHVbzcWYvP+6XDia7CW+MFCGqp5SytoRWefBePwlVe9qy
	 coXscfgtm7JGyxMz1k9kgFdBmFtucEQ0rfmKsvBI=
Subject: Re: wcn6855 - stuck in 20Mhz on rx, but full 80mhz on tx
To: ath11k@lists.infradead.org
References: <CADS+iDVE8GB_+H+1DAPwcwdpjddUqzsvRmnygtXv7yUxRwLTZQ@mail.gmail.com>
 <87a5qeof5m.fsf@kernel.org>
 <CADS+iDXNkGWba7cM31CNTeaAJFdr48Zi8HGtYKQutYWiKnxjdA@mail.gmail.com>
 <87o7esn7j2.fsf@kernel.org>
 <CADS+iDV5eGc6RpWpzPMyO83xmiV1GgbZfqgeLnAukVaPv3BnJw@mail.gmail.com>
 <CADS+iDX1aU9h_OuR3K+r6hTX+zUrCyN0sG4uzyKm9+tThS9LZw@mail.gmail.com>
 <CADS+iDXMTRYN86PMuGRBcHtPB-hsax_X_XUAPajXsUYTRnwk-A@mail.gmail.com>
 <CADS+iDX2c17iaoXkNDbPxYr3FMwQHZDbEfkuycR52vo0hLy1hQ@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <c5d1124b-ad4a-b5f0-db29-7050f1f04bb1@candelatech.com>
Date: Fri, 29 Dec 2023 09:19:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CADS+iDX2c17iaoXkNDbPxYr3FMwQHZDbEfkuycR52vo0hLy1hQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
X-MDID: 1703870362-lBZQ-DiDCac4
X-MDID-O: us5;at1;1703870362;lBZQ-DiDCac4;<greearb@candelatech.com>;39e8e9e9b322912be73a71cf48e227c8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_091926_877066_1D1B7B04 
X-CRM114-Status: GOOD (  13.55  )
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

On 12/29/23 9:06 AM, Yaroslav Isakov wrote:
> пт, 29 дек. 2023 г. в 17:46, Yaroslav Isakov <yaroslav.isakov@gmail.com>:
>>
>> Hello! I managed to get another router, Asus TUF-AX6000 (with openwrt,
>> too), and on this one, there is the same problem with rx
>> bitrate/channel width display, in AC mode.
> 
> Looks like the issue was with GCMP-256 cipher. I changed all ciphers
> to the AC ones (CCMP+BIP), and now upload and download speeds are
> around 1gigabit. I'll try different ones, to see if there is issue
> with only one, or with all modern ciphers.
> 

The linux kernel's software decrypt performs poorly, partially due to
the crypto folks' refusal to add in the aesni crypto accelerator logic.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

