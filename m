Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142DFC32771
	for <ath11k@archiver.kernel.org>; Wed, 28 Sep 2022 07:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HiJZ8RMaa0AZCpguGIokZFyu1OZ8DKxLbJZTvVvV3Qw=; b=PK8ao9fxNUhZ0j
	2MnY23zzm/s20R/FY6CY9WPMfmxMs3p0KDq7hSx9m+Q4ZGyakK2gKIXjqTcshv5GYhw1P07473v8M
	0sAsU/4WQj/lFWqGFHu+nrLZEhhdKDu8GFmSAdqzSzn5iB4yXbVfq/9yBoPTcdcu1kEl6F+UAGLdD
	U6bVhEUTq6pBhJeLfoen+HFmQ9R43+mBWs8xpIGOZmM1MVuJU8D2k0U+5lNjANIRQdrzZW5BW6K+2
	YJTNzp7Ii5/KcvPi2zUUcx3mRrZxFxU35qKu0CaCBNwl6UYwH/f4jXFY00jcICsVFb/NAmDX0iHCU
	SLdf81LXTvyXAL/seSPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odRkk-00Edqe-9W; Wed, 28 Sep 2022 07:45:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odRkh-00Edoa-Gy
	for ath11k@lists.infradead.org; Wed, 28 Sep 2022 07:45:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3818BB81F10;
	Wed, 28 Sep 2022 07:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E85C433C1;
	Wed, 28 Sep 2022 07:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664351103;
	bh=6SQSuRMC+R7kxqaZdTa6Rn0P4+/7LiIcZwMuBTCDzDc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=IYgh5dEN6FoWcOdJgKFGwshdH5xYxJYWLajRdzgfyhmbgAQkkiaWhUCgOhGlCWBRv
	 XjPRri4VGzN19lBWOX9svGTg2uVOJDZehHn1mx1XrroguzjNrRv15xQUBEDr549ooZ
	 y5lKqr3oW52FAiurIeT16u7pckcAw1qoK4wY2q1Nvzr6tRoXrw3ip+6yR33USqSCwU
	 u/jLOUeABAoioLCl2LgE5gJ+tMXjc9duu8ZIRJzxrwLMqCsQTvBu8IK8OsVylXMQjL
	 /TBqrVqlMLxbCwuF7BxakpwWcEPS0XbdxcuV/1tdySoduHEBnpzh/Q5z/48owNeL3h
	 plKoDqP+DsATg==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: stop tx queues immediately upon firmware
 exit
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220923170235.18873-1-quic_adisi@quicinc.com>
References: <20220923170235.18873-1-quic_adisi@quicinc.com>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Aditya Kumar Singh <quic_adisi@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166435109959.3623.15599848077820461188.kvalo@kernel.org>
Date: Wed, 28 Sep 2022 07:45:02 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_004507_772931_6843CF4B 
X-CRM114-Status: GOOD (  10.49  )
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

Aditya Kumar Singh <quic_adisi@quicinc.com> wrote:

> Currently, recovery flag is set immediately upon firmware
> exit but tx queues are stopped once firmware arrives back
> and is ready which is during ath11k_core_restart. Once
> ieee80211 hw restart is completed, tx queues are resumed.
> If during the time delta between firmware exit and firmware
> ready, mac80211 send packets, currently ath11k will drop it
> since recovery flag will be set. But warning prints will
> come -
>   "ath11k c000000.wifi: failed to transmit frame -108"
> 
> If more tx packets are there, this could lead to flooding
> of above print.
> 
> However, actually tx queues should be stopped immediately
> when firmware leaves. This will prevent packets to get
> dropped when firmware is recovering.
> 
> Add fix to stop tx queues immediately after firmware exit.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

81e60b2dfb27 wifi: ath11k: stop tx queues immediately upon firmware exit

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220923170235.18873-1-quic_adisi@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
