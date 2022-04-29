Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2AFC433F5
	for <ath11k@archiver.kernel.org>; Fri, 29 Apr 2022 05:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pMO5YorijO92gDX2I9hRW0dypK+GvDgH6fN9e09si2w=; b=kP80DXmRP4UATz
	ISPOxk8LzSqeugmLmqYQXgd+NEO/RBe0BzVT3in5LQByOWktyVnbZNmztQXrr81mTqKmBQ4oM2KCL
	pQI1slWO7B5KTMkmjaTeBHmnCJEdRnaB0T47vYm/hXe7Eb9oZOuZloPWsm2F3VRYFiBWtEdGAay0i
	QYFjjD+C1gU77RG9La2i7k9hFdLjaENc8HT92cwRPyoACGiuArSMeUPWoUfxPxl69JiQst+E90uGg
	ikTDOZHYH2T8oLYYa6XJrLXEpo9HvXo+dMV7iR7ZnpYFwwI4/RZ4gyh7YPgq6nOET4UJ19AnNuc/l
	SMAWV8QRfCGhFKGbTvfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkJQl-009cEw-Dh; Fri, 29 Apr 2022 05:44:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkJQg-009cCv-Ff; Fri, 29 Apr 2022 05:44:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E280612D3;
 Fri, 29 Apr 2022 05:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496CFC385A7;
 Fri, 29 Apr 2022 05:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651211069;
 bh=RgOWZfYnD1p3E6QBrmMNLzNcgmp0EowJzG0gJaNZlH8=;
 h=From:To:List-Id:Cc:Subject:In-Reply-To:References:Date:From;
 b=jymF01sN7zHO8P9154EGfmnwVsjVHOwoQ1gRIu3nY1JIOu3P8EBa1rAMlZMNbXLG+
 B1cxbVId1IiRwvZ1YiKvfU+Tga5cgeXXlBGsCj6f5FrAZfq6PWJRyx0da1gh9znzvi
 XpZj+jPAmOaQnAjaaw18ibkyIg3riH+vM8SJ9FKsIO71lXJIXwH0Ck/wcrYgemNE77
 CHlpaLxuwInPuSA5WHyKVR+PFdJBmvzvZsT7CghrFl8K+eUeMWVc9akwKv+VUtmrje
 9tRVSb+cLknS/NsrG+d2ncvwqIGz3YmV3I7JNZrsQI0Elx64mgDsnvRB37snan2RGe
 MkVAGq/x/NNew==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: "linux-firmware\@kernel.org" <linux-firmware@kernel.org>,
 "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "ath10k\@lists.infradead.org" <ath10k@lists.infradead.org>,
 "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20220423
In-Reply-To: <332e62e5-b04d-3a6a-38fe-924d056bf0f8@linaro.org> (Dmitry
 Baryshkov's message of "Fri, 29 Apr 2022 02:43:38 +0300")
References: <BYAPR02MB4567E377F14F272DFF48907A92FA9@BYAPR02MB4567.namprd02.prod.outlook.com>
 <332e62e5-b04d-3a6a-38fe-924d056bf0f8@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Fri, 29 Apr 2022 08:44:24 +0300
Message-ID: <87k0b8fnpj.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_224434_601082_F67C0D79 
X-CRM114-Status: GOOD (  12.78  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> Hi Kalle,
>
> On 27/04/2022 11:32, Kalle Valo wrote:
>> Add support for QCN9074 and WCN6750 ath11k hardware families. Also
>> there are several updates to existing firmwares and board files for both ath10k
>> and ath11k.
>>
>> Please let me know if there are any problems.
>
> I noticed that this pull request doesn't include the board file for
> WCN3990. Is there any issue with it that we can solve on our side?

Oh, sorry about that. I guess this is just a bug in my scripts, I'll
include the wcn3990 board file in the next pull request.

Linux firmware maintainers, please pull this anyway. I'll submit a
follow up pull request later.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
