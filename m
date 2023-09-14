Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AA1CA553C
	for <ath11k@archiver.kernel.org>; Thu, 14 Sep 2023 13:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7JxQT5HXJ4Uq7NT37nAcVC/oOm7FSIpb71dnKd9XykQ=; b=o5EJfjYnr7Q11S
	/jqXKioDEqPdrhT0fS6QCRn4nrsYzc0KDTQGPHYX778xDO3QyVq1ksE6gtIWiTZZD5ALL9eK4Tbeu
	JaMAXwPyYSbxtMDJm5IBXS+YXFU+NGpzKPEajEEM5OROdrjab+XdunHFbNQuVCAclPTj5uM7csinv
	OLlbK2Yc+btAgLBbNeQl0P6qoHaBsXu1XIucax1OQtypyIuF2j4k9wFxL9A5h47/TA4G68rao3dWE
	3GqWxeZB3SjSJMdC6Yg0BRe1Rkrz0armPGLTVP1qzapOKh5PoxVyR1S9h7+5+6QlM6aa22LcYy1ON
	CxjyfkVkAM4RF1isGwRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmCt-008QiV-1D;
	Thu, 14 Sep 2023 13:16:31 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmCq-008Qho-2I
	for ath11k@lists.infradead.org;
	Thu, 14 Sep 2023 13:16:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 96F33CE26AF;
	Thu, 14 Sep 2023 13:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1CBBC433C8;
	Thu, 14 Sep 2023 13:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694697384;
	bh=OMOntvKwCjbvcnXTdTiuIkhUzTCTCAxQoy6WTxNf3hw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=kvdM9DfZhTCmOryBT5CbjAeQ13A5utXBwHqUz7wexBtGVMeEyKV2n9L6PeuUuenMK
	 xZOFKxkKM3OyK1i93KGS/plNy49Ozoa3zF1JzcjYNzLQ1xksbv1ph+Qp5WDHDufBoa
	 FLffKu520stgJLQlRAZUc9T6QD5Sxw8x6P5B635jvXPXdzuw9zSZUG2/4HO2N3nmm/
	 nNRxXit0VJi3ObewjHGnwLixsrzEuUEDtRMkkbbkybJbX5EJHHye5ivvb9AQmoTaUa
	 HgjQ5lxDAny/PbcFJ9ymNG/YFNxCbaaAyvIYFjvA8HDr2Qhd6N9tGhQaZnIJg/hAtY
	 Epy41yavpitcg==
From: Kalle Valo <kvalo@kernel.org>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 2/3] wifi: ath11k: fix CAC running state during virtual
 interface start
References: <20230607124647.27682-1-quic_adisi@quicinc.com>
	<20230607124647.27682-3-quic_adisi@quicinc.com>
	<a7ba84fe-4ac8-4842-8e46-093ebc4e7014@quicinc.com>
Date: Thu, 14 Sep 2023 16:16:21 +0300
In-Reply-To: <a7ba84fe-4ac8-4842-8e46-093ebc4e7014@quicinc.com> (Aditya Kumar
	Singh's message of "Wed, 13 Sep 2023 18:55:02 +0530")
Message-ID: <87fs3gdhei.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_061628_941659_EF8988BE 
X-CRM114-Status: GOOD (  14.28  )
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

> On 6/7/23 18:16, Aditya Kumar Singh wrote:
>> Currently channel definition's primary channel's DFS CAC time
>> as well as primary channel's state i.e usable are used to set
>> the CAC_RUNNING flag for the ath11k radio structure. However,
>> this is wrong since certain channel definition are possbile
>> where primary channel may not be a DFS channel but, secondary
>> channel is a DFS channel. For example - channel 36 with 160 MHz
>> bandwidth.
>> In such cases, the flag will not be set which is wrong.
>> Fix this issue by using cfg80211_chandef_dfs_usable() function
>> from cfg80211 which return trues if at least one channel is in
>> usable state.
>> While at it, modify the CAC running debug log message to print
>> the CAC time as well in milli-seconds.
>> Tested-on: QCN9074 hw1.0 PCI
>> WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> Hi Kalle,
>
> The upstream dependency got merged today. I have sent [v2] of this
> series which was just rebased on latest ToT and the [PATCH v2 1/3] got
> merged. With this, [PATCH v2 2/3] and [PATCH v2 3/3] are unblocked
> now.

Thanks, this is helpful. I still need to merge wireless-next into
ath-next but hopefully that happens next week.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
