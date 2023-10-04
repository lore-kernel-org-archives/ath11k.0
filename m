Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617A0E8FDC7
	for <ath11k@archiver.kernel.org>; Wed,  4 Oct 2023 04:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RJRFew84dTDnCPhT0KlBnGmEubsKPI15Ld9yrbApSFQ=; b=gWdUJGA8Mdrw3Y
	5iBSTsDAJGoOQ3QqzMo9EvrjQ4gwi96fYoyFEMhyM4eK8Kco2VR2HLYT06+x9PD049vba96P9ZgS9
	6pb6ZGpDs14TmnUEsLs1llIL+wv3CvXqCU4Dv5GL62882GFOXrOFjyJRqTnJiu616JJuQZrQpFBkM
	bzjqDcbMnG92SVOYty3vy3uC6efskRkhBcLB49LZmREo/UXomBJKeG7goS1diKSQMi6V3KneBLv+T
	h4Oa8u7ro/igsgutxx+xI2WSu8O3e6LNAWnM+ecNpJFUcaPhP1zlACCKm7Ysj079slMPciBSlbDGb
	xBvxflcXMg1pGQPM3QTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qntsE-00GF3p-2W;
	Wed, 04 Oct 2023 04:52:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qntsC-00GF39-0L
	for ath11k@lists.infradead.org;
	Wed, 04 Oct 2023 04:52:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F0AFD60AC0;
	Wed,  4 Oct 2023 04:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D18B3C433C7;
	Wed,  4 Oct 2023 04:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696395153;
	bh=bmz9UQhUwxneKugEZjPBwy3A+0A9FRso7QR2GGJWT34=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=u+4VIXQHAjhDgrmsxDUZAC8NpIOSySZndTIVjHZxB+n8xlxuAX6H1b/Kd9EMMhO13
	 9/W2KHBFAn3R84aARvh8lGR+UVtwwpUqwigkSeiBxT3Kp6ivtUlX0pHijSmV1VvBSq
	 sIv5YeQPkYZ4UfbK5q/govht4htnLTlehaHroTHWJH5zHqrp5D9zvu29NggwISK/Rs
	 Pa2BSe9UHHIOicinkEEtkp8qpXKDO2EUt3JnrF+9dVx4XjIj3Y1YH/lWxLnmiQ3N1E
	 Y0mrx97VDB5OCNpDsua2NgmFU9MbXLHA9/UlkknYWzEdCB+mzozflM80dDJqmjtJqi
	 alNkc4J2u6t8w==
From: Kalle Valo <kvalo@kernel.org>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] wifi: ath11k: fix Tx power value during active CAC
References: <20230912051857.2284-4-quic_adisi@quicinc.com>
	<169634351476.120947.13624704208026863471.kvalo@kernel.org>
	<735c1318-2a6d-4247-8220-868f63f08578@quicinc.com>
Date: Wed, 04 Oct 2023 07:54:49 +0300
In-Reply-To: <735c1318-2a6d-4247-8220-868f63f08578@quicinc.com> (Aditya Kumar
	Singh's message of "Wed, 4 Oct 2023 07:39:44 +0530")
Message-ID: <874jj7htra.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_215236_194156_FE85E9A6 
X-CRM114-Status: GOOD (  13.44  )
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

Aditya Kumar Singh <quic_adisi@quicinc.com> writes:

> On 10/3/23 20:01, Kalle Valo wrote:
>> Aditya Kumar Singh <quic_adisi@quicinc.com> wrote:
>> 
>>> Tx power is fetched from firmware's pdev stats. However, during active
>>> CAC, firmware does not fill the current Tx power and sends the max
>>> initialised value filled during firmware init. If host sends this power
>>> to user space, this is wrong since in certain situations, the Tx power
>>> could be greater than the max allowed by the regulatory. Hence, host
>>> should not be fetching the Tx power during an active CAC.
>>>
>>> Fix this issue by returning Tx power as 0 during active CAC since it
>>> is known that during CAC, there will be no transmission happening.
>> The returning as 0 doesn't seem to match the code. Should I change
>> the sentence to:
>> "Fix this issue by returning -EAGAIN error so that the user space
>> knows there's
>> no value available right now."
> Oops. Looks like only in commit message its still zero. Its changed to
> return -EAGAIN in code.
>
> +	if (test_bit(ATH11K_CAC_RUNNING, &ar->dev_flags)) {
> +		mutex_unlock(&ar->conf_mutex);
> +		return -EAGAIN;
> +	}
>
> So could you just rectify while applying or should I resend?

No need to resend because of this. I changed the commit message now to
this in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=6eacc3b5a70ab3f92f9410839870edbb21c9d051

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
