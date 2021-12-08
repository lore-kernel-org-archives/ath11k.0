Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB173C433EF
	for <ath11k@archiver.kernel.org>; Wed,  8 Dec 2021 01:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0ucrBxNuNVGM4ufd50yW2347ApPBFXG8XjvmUtezI4=; b=g0n6h/yGESqVxp79ErjlYGo+9L
	c90VccTimWa60WShkNs5JviUH2RZjH2+Twa5n6neLVZIvMegSywcFqNyXYjFRBPK+mmLVmc2h/zGc
	IEI9x0l+Og7P5Fhak9ApX+1n5iX3nyptRDmnNbxZ7i9dwzA7iBYCr9GbDnP2u2Y/1fqZYfXl1oBYz
	6aK91yopYapMLcd2skCby5GrAhv2Qfpv7Uce0NvYKQqVRclOauMaJKhz6UBifoF1bDFV56nIXiD7w
	dvZA+Q1BQjkjm4y+tciG9+CWwlQQdmoG9sj92tyiz+GqG3/2jTQRu1lLIdr/gK9etU/kHzTtzo2Ny
	yJiRqTpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1multt-00AaZo-AD; Wed, 08 Dec 2021 01:37:41 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mulqy-00AZDo-Li
 for ath11k@lists.infradead.org; Wed, 08 Dec 2021 01:34:42 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1638927280; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=E1xMeWN7axQWVodiwYidbZo5oGTp0MZISH2KuPx2d3Y=;
 b=KNJZWbJFvhFJ2icED53BHUFPzWFMcuTd/opprn7OPYtODr+uXp1uJITWSiik9XYHTygNh57x
 X2+xLc0lFfmYu3pBvuG/9VF9d/aDxMVGUzM/wBrs2cnwZ2/W9dv2j2Qm+ZKT/Doudkj0EZLF
 bt8Ph9+f+D5KYZGwhkWN8GS7CJs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 61b00baf7d878c8ded1e4609 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 08 Dec 2021 01:34:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 616FEC4361C; Wed,  8 Dec 2021 01:34:38 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: bqiang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 31C55C4360D;
 Wed,  8 Dec 2021 01:34:37 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 08 Dec 2021 09:34:37 +0800
From: Baochen Qiang <bqiang@codeaurora.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jouni Malinen <jouni@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH 2/3] ath11k: Move pdev debugfs creation ahead
In-Reply-To: <87pmq8joi1.fsf@codeaurora.org>
References: <20210913180902.193874-1-jouni@codeaurora.org>
 <20210913180902.193874-3-jouni@codeaurora.org>
 <87pmq8joi1.fsf@codeaurora.org>
Message-ID: <ea9d43d501eac8b9f7268899992e9d41@codeaurora.org>
X-Sender: bqiang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_173440_840472_208B839E 
X-CRM114-Status: GOOD (  14.10  )
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

On 2021-12-08 01:47, Kalle Valo wrote:
> Jouni Malinen <jouni@codeaurora.org> writes:
> 
>> From: Baochen Qiang <bqiang@codeaurora.org>
>> 
>> The sram dump debugfs interface has to be put under pdev directory
>> located under /sys/kernel/debug/ath11k/<pdev name>. Currently pdev 
>> directory
>> is created after firmware is ready, this is too late for sram dump.
>> Suppose that if errors happen and ath11k fails to reach firmware
>> ready, we have no way to dump sram content to debug cause the
>> interface has not been created yet. So move it ahead.
> 
> I'm not sure about this. What will happen with other debugfs files now
> that they are created before the firmware is ready, doesn't that create
> race conditions?
> 
> Also we need to do some refactoring in debugfs, for example see Anil's
> patch:
> 
> https://patchwork.kernel.org/project/linux-wireless/patch/1614160542-27882-1-git-send-email-akolli@codeaurora.org/
> 
> So I recommend dropping patch 2 for now and get the basic sram dump
> functionality ready first. After that we can discuss how to handle
> firmware crashes during driver initialisation, maybe coredump would be 
> a
> better approach?

Sure, Kalle, let's get basic functionality ready first.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
