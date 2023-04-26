Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05031C77B60
	for <ath11k@archiver.kernel.org>; Wed, 26 Apr 2023 07:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SrvibEKsaqL0zhiCgMk6XhwaGM5n1qIeyYW1mFIGbKc=; b=HFmz1H5+N10o6H
	KFEZ3RR/hJ3JgeO892NJvcMIq/dqeeVdYhjE+lLHZ1SxxXvEUbbxq/o/p9JXH+LZHAR/5i0NJIPab
	0qhSIX+FGs5oEYD9UP3HYJpTreiuR9cVVi72iIXDkQHflYl3LOCIpzNLyj9HNR4pcHxiz2+MWm0BI
	0FNpzCUKZCKX9Oyo8maLW2oEfWpQE6uA35QAwQqwfi2wzIw8EbqGk1zC5nvybaWJ2M4TZMrzSK2hF
	oOOVhd+L0hj/eZy8yaWEUkT2gZR+noU6/mAZx63H8iikdLGny5kLy/H+UlxZhn3hdC5Yhm+/oPlKx
	ThpQU/tmCQcxn3O9I3ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prZaj-0032UA-2B;
	Wed, 26 Apr 2023 07:29:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prZag-0032T5-2h
	for ath11k@lists.infradead.org;
	Wed, 26 Apr 2023 07:29:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 350C160A07;
	Wed, 26 Apr 2023 07:29:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13DCC433EF;
	Wed, 26 Apr 2023 07:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682494165;
	bh=SJB4mMz5cNPKosH2jnVI6BjgW4ZnnuZvPIlv2NOzGYs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=dLMqM58xBr5Q+YbjBW31AxPp0xk3bv6qYLChr5KrawKp0buWV4qWDiQ3tKZ+UdOYn
	 OP6IfK9hMnX5vvCvaf7eUQXHqdp1JMAa1BvtMvvEP8xrwLOH6Xy8cNpEyShtPUHOLb
	 obbSKmn3ov//zz/qwYy+QgB9Ol8c6FJoKmqh7HjlQHmu3frqUFyYjQEOjb0Wrdffiv
	 F1IlNfh9J0+GB3uhLSPB9DPjcGAe0TCcT52IVB45oVuH5mTyYAZYA3vO4vIMxPwJUU
	 mjXvxuNyE4Yt7vDC6FOsPs7S0a20lowrrTpYXLtJXmOGJH4SRE+3/tqaBeluKWKMc3
	 6OogqcuvqEoYQ==
From: Kalle Valo <kvalo@kernel.org>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
Subject: Re: [PATCH] wifi: ath11k: update proper pdev/vdev id for testmode command
References: <20230424092420.12794-1-quic_rajkbhag@quicinc.com>
Date: Wed, 26 Apr 2023 10:29:22 +0300
In-Reply-To: <20230424092420.12794-1-quic_rajkbhag@quicinc.com> (Raj Kumar
	Bhagat's message of "Mon, 24 Apr 2023 14:54:20 +0530")
Message-ID: <87a5yvt831.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_002926_914978_315AD32F 
X-CRM114-Status: GOOD (  11.23  )
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

Raj Kumar Bhagat <quic_rajkbhag@quicinc.com> writes:

> From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
>
> User can extend test mode command support to set vdev and pdev params
> for debug purpose at run time by sending vdev/pdev param set command
> through the testmode command interface.
>
> Fill the proper pdev/vdev id in driver since, pdev/vdev id details may
> not be available at user space. It will make sure that the proper
> vdev/pdev ids are sent to firmware.
>
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>
> Depends-On:
> 	[v3,3/4] wifi: ath11k: factory test mode support
>
> Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> ---

Please add 'Depends-on' after the '---' line. This is for future
patches, no need to resend because of this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
