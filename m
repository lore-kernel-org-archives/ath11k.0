Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DD7C4332F
	for <ath11k@archiver.kernel.org>; Thu, 22 Dec 2022 14:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ymq2KcrsP7AJOEkxj5wxmmKegFvBw16an9ADAGnpdeQ=; b=fkIQHXCAmzDhW6
	G2oHVYQ9FueFxq1o4bdM3G/ZqLlcx0b+KoP6Ctey0D9m+X2zgTsYE7DFqzTSUQEl0GpPZSzMMFuth
	TLGx7xy9K3Cr1XzQMPWAWjuHdfG6y6XTHHX6kXr5oQA/xtKpWu1D1i6ZSBnRyV3RGcuAjdwdgWjrw
	rfvC+wlrxVg/Ezj7spQmqYTZ238I+TCm2ZvtlI4owusrQOARwoe9L9rC9QnX/BlHEQ+87/yqLcCws
	BBTSpePE2gdtr3nWNWBOZyut8Z7Q3R5X7B9uNrJOYpRQ+Vatye8cq9Gv8ZjjsFKlfh3Ur0/f5dNog
	NIvFhyi10GJzw4xjdWfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8MGZ-00CnMK-Uc; Thu, 22 Dec 2022 14:09:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8M26-00CeBH-80
	for ath11k@lists.infradead.org; Thu, 22 Dec 2022 13:54:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6560A61B45;
	Thu, 22 Dec 2022 13:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A29DC433EF;
	Thu, 22 Dec 2022 13:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671717288;
	bh=fg6kUN1XrHAlgouJlSZLADObdGRduApzW8LZn6sX6xc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=tVG7pZa2joVq2iTTjdvt47ZvZjvhJi9HG1HAv0dE2ovl+9zBGZ1eW4WZyDxXWlXoS
	 S7VheQNasu0LMGETe9BBjPdnK0G1G9RrVhcAxl/h7/gI9JXHEbRueYFC2Iudi4PVpc
	 yTDgAHbC2PjhhlRIMZGcI20xtryKJrLimgQp6z5tyzQifFFZxY90oWbOJZmybWau6K
	 IMcv5cg0bqplJOjyGvGkF2UfTPDDyohTWgJTangDsvoY+1zthlV2AIx1N/+A98wsQY
	 RuRbpL5xoKUTmYKCXMryN5M5uC52fDvDHnXt/u2rgfdwhBjpF4Rid9Gy5B19gdspPs
	 rn0cjvZz6xFMg==
From: Kalle Valo <kvalo@kernel.org>
To: Robert Marko <robimarko@gmail.com>
Cc: ath11k@lists.infradead.org
Subject: Re: regdb.bin availability
References: <CAOX2RU5ATBuuPewx4DgveKjhc+E1a=Kt2COWDhYqQtLiJ1=NoQ@mail.gmail.com>
Date: Thu, 22 Dec 2022 15:54:44 +0200
In-Reply-To: <CAOX2RU5ATBuuPewx4DgveKjhc+E1a=Kt2COWDhYqQtLiJ1=NoQ@mail.gmail.com>
	(Robert Marko's message of "Wed, 14 Dec 2022 11:51:22 +0100")
Message-ID: <87o7rvzgpn.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_055450_443298_4AEA8358 
X-CRM114-Status: GOOD (  12.14  )
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

Robert Marko <robimarko@gmail.com> writes:

> Would it be possible to make the regdb.bin publicly available?
>
> Newer FW-s support using it as the external regulatory database and it
> would really allow the community running AHB radios to avoid being
> stuck with the outdated or even non-existent regulatory data in the
> BDF.

I thought we were providing that for all hardware, I guess that was
missed. Would you mind reporting this to bugzilla? That way it's easier
for me to track.

https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
