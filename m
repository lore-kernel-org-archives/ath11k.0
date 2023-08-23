Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AA5EE4993
	for <ath11k@archiver.kernel.org>; Wed, 23 Aug 2023 14:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FtSmabe8MPKJNLovBB4FoDgNNvsJ734o8667yGTOnL0=; b=lKvOVztXXFFIQ/
	/ESdVjgS1BwHskGzbgjUU3HxoLEqEJ/EsMeIrFa/1E/xuPxA4IkwEOux08H8ZGLnDmUpfSgpI8o5w
	22CuGekt+AufcNg4qRt6ttEctCAuFdzFbXJYVe73i4/8Tfo4Naai1qL543hxw7FiF/X5XYvK7iPFZ
	OyC5a+f0MLA61fEtEXt/MOFaOWelSOuvWgYK01D9SA7wha9ScSS1loEd0YUJTkeh+ocwSt+FOcL6n
	4SMgWAG+TbZ9nb1LU9s2BWxh9zm+GJWbYa27I+u/gh5WrV3TD19IgO5N9GCdvJqsfharbaEBF+lCQ
	CUyh2/U9OmvcvJNWSdQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYoZZ-000okJ-09;
	Wed, 23 Aug 2023 14:11:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYoZW-000ojj-0o
	for ath11k@lists.infradead.org;
	Wed, 23 Aug 2023 14:10:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B31AD60A25;
	Wed, 23 Aug 2023 14:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62629C433C8;
	Wed, 23 Aug 2023 14:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692799856;
	bh=yC9A6Pv4rtofI95eEB8W+ozuM2EAqvZJ0OdTILRRsQo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=U9JOd0pKUsLiqsAmdp2eGcxUj6EE3ltuuzRdDbHRhpyfTsmQIpMqGXf/HRCp17IcQ
	 hfghxfnEGotS+0OSIzlZgGzARFS95EgT9uYZ5MOY5qISjCYscG6JewPl9bEruG+hHg
	 kUM+cMfJEtoDNfWn2TYab1aIC3+WOWZpawqZBwAKFehpK32huuCBqKH8D4Q/ZJA3qN
	 lisqW+7kpplkiJeqgNmQa6GSZnP7LVwO8d5p5BKTUDLzvPj9CNBNc1ed92zFNNPjlU
	 riKznqgMfJw7aigu4VV+u9SwxtEyFZQAhIKx3qOMtodvCW5DbTO6Y+2dROxZCaFyU6
	 xabDA2En7vgRw==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: Remove unused declarations
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230811104413.33668-1-yuehaibing@huawei.com>
References: <20230811104413.33668-1-yuehaibing@huawei.com>
To: Yue Haibing <yuehaibing@huawei.com>
Cc: <quic_jjohnson@quicinc.com>, <quic_srirrama@quicinc.com>,
 <yuehaibing@huawei.com>, <quic_mpubbise@quicinc.com>,
 <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169279985334.1241462.18271016040930398766.kvalo@kernel.org>
Date: Wed, 23 Aug 2023 14:10:55 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_071058_331096_C6CFFBF8 
X-CRM114-Status: UNSURE (   5.45  )
X-CRM114-Notice: Please train this message.
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

Yue Haibing <yuehaibing@huawei.com> wrote:

> Commit 2c3960c2253d ("ath11k: setup ce tasklet for control path")
> declared but never implemented ath11k_ce_map_service_to_pipe().
> Commit e3396b8bddd2 ("ath11k: ce: support different CE configurations")
> declared but never implemented ath11k_ce_attr_attach().
> Commit d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> declared but never implemented ath11k_qmi_event_work()/ath11k_qmi_msg_recv_work().
> 
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

adb0b206709f wifi: ath11k: Remove unused declarations

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230811104413.33668-1-yuehaibing@huawei.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
