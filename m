Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B06E77179
	for <ath11k@archiver.kernel.org>; Fri,  6 Dec 2024 20:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9PuEUd7fHK0twjnpmT4sQ2WiGKSyXN5nPrU+06sRxI=; b=HhfKiPM/2q1fjhyDsrwiMJIVy3
	otetIZ9f2GD/8q+JNwx4iA7BaAP2UhPWl8G7qn7yAohwh4gWp5HKPjyf+f3z4++f+mGp5uj9dbLhX
	SfRUAG3ZTECZklEJppB8hA4x21gqWZbTIKInEPqsU4VebXw+vgJR/D5e6xg5z8vKgUXIzNYapAWTB
	t73EMFgPKa0dKE91R82D7i2uoPB8R+QapQA6xgx6N3UcAOU2ytkKB76rFLm3sfyv56N2lAHLk1Bhp
	ah9MYxXGFCloBSjVOY27UIDMCkxRYwbhNsLFnp/wT3GRa4xxiWlfT0cdOzItiuiu9PYCnSc2hiaiO
	0nnPNYmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJfP6-00000002j3T-1Dg1;
	Fri, 06 Dec 2024 20:58:24 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJfP3-00000002j2e-1fGP;
	Fri, 06 Dec 2024 20:58:22 +0000
Received: from [100.65.128.154] (unknown [20.236.11.102])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8B63620ACD7A;
	Fri,  6 Dec 2024 12:58:18 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8B63620ACD7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1733518699;
	bh=M9PuEUd7fHK0twjnpmT4sQ2WiGKSyXN5nPrU+06sRxI=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=opdIpAACnQeStJ33oACe6p52ZM8f0Sws7Fv8oVZEtnJ34oxYkj2Ifncn0UBE7+8VM
	 /Rer5IHWNKL+Om4cBhthsawIs+kQdevr3ykVw21CBvfVnNLhAZ1lcWLQbVr0aJDoH2
	 0Lv+tHrW7mbf2ysXMzyMfTT7x/zNVB+cEVkkvmJU=
Message-ID: <dab77729-682f-4182-9fb2-cd522ac29b5f@linux.microsoft.com>
Date: Fri, 6 Dec 2024 12:58:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, cocci@inria.fr,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-mm@kvack.org,
 linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 live-patching@vger.kernel.org, linux-sound@vger.kernel.org,
 etnaviv@lists.freedesktop.org, oss-drivers@corigine.com,
 linuxppc-dev@lists.ozlabs.org, Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH v2 00/21] Converge on using secs_to_jiffies()
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <b9fcb12a-b7a4-4c33-836e-67109ce07deb@intel.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <b9fcb12a-b7a4-4c33-836e-67109ce07deb@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_125821_485849_8001F527 
X-CRM114-Status: GOOD (  15.73  )
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

On 11/29/2024 4:57 AM, Przemek Kitszel wrote:
> 
> [removed most non-list recipients, it's just too much]
> 
> On 11/15/24 10:26 PM, Easwar Hariharan wrote:
<snip>
>>
>> ---
>> Changes in v2:
>> - EDITME: describe what is new in this series revision.
>> - EDITME: use bulletpoints and terse descriptions.
>> - Link to v1: https://lore.kernel.org/r/20241115-converge-secs-to-
>> jiffies-v1-0-19aadc34941b@linux.microsoft.com
> 
> that is not a proper changelog, you were supposed to edit those
> placeholder entries; please look around for examples
> 
> There is also just too much recipients. Please split up your patches
> into smaller pieces. You will also learn the process on a smaller
> sample.
> 
> And definitively please wait for 48h before reposting such big series.

Yes, sorry, I sent out a v2 in a moment of panic on including the
already accepted patch in v1. I failed to edit the changelog in that
same panic. I'll try to not panic and do better in the future.

> 
> Regarding code - you could also convert msecs_to_jiffies(const * HZ),
> there are 10 that are greppable.
> 

Those seem to be mistakes. const*HZ is a seconds-denominated timeout,
being passed to msecs_to_jiffies() which will treat it as a
millisecond-denominated timeout resulting in an excessively long
timeout. I suppose that's better than a too-short timeout, and
apparently it's been working fine all along since hardware responds
before the too-long timeout expires. Half of them are in
drivers/scsi/arcmsr/arcmsr_hba.c and the pattern has apparently been
there since 2010.

Thanks,
Easwar

