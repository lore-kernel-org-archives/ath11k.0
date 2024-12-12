Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA893E7717F
	for <ath11k@archiver.kernel.org>; Thu, 12 Dec 2024 19:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tO2gvxoUGoZO1jpkcXEEyI2BAiP9UdBxuffy1wivgCM=; b=DwXvPwQLze85s+4LFXeXfYSmHH
	8IO4DBUlKQvICK7hdGRJdRNpl75fxuZZXTJaAqIqnYYn28dE8eInTBcGgmMgzXI/q1AXkONOOCrAS
	9gGjyWZLx6hCt/lOfOEgAuaA3d78r9plgFWV5psreZDrt1N3cVVb/UScidv/Ds78ExNsmjK+p0H9/
	Pp3770GLE31smamPC4xp/DBatH00Mg2GbGGc0DzFZTU2F5wk1Vg0bQk0YQNhG4wBa4Fp7mfFwdFdm
	Nfr9pJ/xbjZHt20tfQL6unrLahGXfMYt8k+O0QEQo0pqyFdyHMKGbXbm2Ixpel+S4qIIPdTryEp9L
	BMGuxOhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLovU-00000001elW-1azd;
	Thu, 12 Dec 2024 19:32:44 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLogR-00000001bKS-45sd
	for ath11k@lists.infradead.org;
	Thu, 12 Dec 2024 19:17:13 +0000
Received: from [100.65.128.151] (unknown [20.236.11.29])
	by linux.microsoft.com (Postfix) with ESMTPSA id B7A3E20ACD6C;
	Thu, 12 Dec 2024 11:17:09 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B7A3E20ACD6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1734031030;
	bh=tO2gvxoUGoZO1jpkcXEEyI2BAiP9UdBxuffy1wivgCM=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=a+W4c9Pv7QXVBqUn/Dy5ZEtgWRtcp5iLyLtlaTxvajdzfdUHse8gYb8ykAe8H/IxC
	 6SQWYqz8ZlN3qvmR7jfWHpg3fRjdlIPpVZohDMslKXAXMNEPHPq5HyMO+PdQqgrdXY
	 kLXLLXolY9Ni3pJJFZUKmKVRUb3VzyOmPWeYekU4=
Message-ID: <cc1d5e08-92e0-46d8-badb-2a61482200cf@linux.microsoft.com>
Date: Thu, 12 Dec 2024 11:17:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 eahariha@linux.microsoft.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org
Subject: Re: [PATCH net-next v4 2/2] wifi: ath11k: Convert timeouts to
 secs_to_jiffies()
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20241212-netdev-converge-secs-to-jiffies-v4-0-6dac97a6d6ab@linux.microsoft.com>
 <20241212-netdev-converge-secs-to-jiffies-v4-2-6dac97a6d6ab@linux.microsoft.com>
 <27cc63e7-1a63-4ba5-8c7a-12a78ad6d9fa@oss.qualcomm.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <27cc63e7-1a63-4ba5-8c7a-12a78ad6d9fa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_111712_194362_AD351214 
X-CRM114-Status: GOOD (  13.39  )
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

On 12/12/2024 9:51 AM, Jeff Johnson wrote:
> On 12/12/2024 9:33 AM, Easwar Hariharan wrote:
>> Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced
>>
>> secs_to_jiffies(). As the value here is a multiple of 1000, use
>>
>> secs_to_jiffies() instead of msecs_to_jiffies to avoid the multiplication.
>>
>>
>>
> 
> something is wrong with your patch since it introduces a blank line after each
> line.
>

This is some sort of weird interaction between b4 and git send-email. I
used git send-email to send the patches after writing them out with b4
send so as to edit "net-next" into the subject line. It's good to know
to not mix the tools in the future.

I can resend from the branch with git send-email directly to avoid this
if preferred.

> Also if you want the ath11k patch to be taken separately, it goes through the
> ath tree, not the net tree.
> 
> /jeff
> 

I don't have a preference on being taken separately, whatever approach
works best is good with me.

Thanks,
Easwar

