Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFA8C4345F
	for <ath11k@archiver.kernel.org>; Tue, 30 Apr 2024 08:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJqOHWVQZQjxqgJGV/ryAQYZu6sq2jfKf4yvWDfR+IQ=; b=fONtSlB1ySY+Ic6qyziooJ/Xez
	JNNLGjIWtQArGVTjJGumA8BszXTsSsoQzdRTNmmpm1bCbrsFf+LR7JPB5OxbIfz96mSfez4HUMDVi
	2pklYz3XmELbl44aYf1vO4sgeHPJ+um7PwQShMtxMP2GzmKfaZ7RmYeMQGXoizbxYt1i54kc6kTPc
	/4okrtz+cCZjEsXc3vdFCO/zvucyj6N3QmxRN2efS2xKkVZhJmNi1DDh0UvXt+b3gXO20bHXrGYEn
	/x4t27AoFFXJ0O54hhhm6Di1a/zvsdgc5IrZtGUrvqC2MKx7EtkCmwrm1lj/Dm82awR9TX4vn/SAB
	TG6sYQHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1j9l-00000005gI4-0dVh;
	Tue, 30 Apr 2024 08:48:09 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1j9f-00000005gGq-3AC7
	for ath11k@lists.infradead.org;
	Tue, 30 Apr 2024 08:48:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AE923CE0F88;
	Tue, 30 Apr 2024 08:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B25AC2BBFC;
	Tue, 30 Apr 2024 08:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714466880;
	bh=v180vtFCLAFqzjRYixQycX32gNWfqrOmJm+5mj4KQ90=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=VBS5o2Nl1e3//Bs4osHJ4o3XwfJtYeHgJx0N4l0RTxumoRn+5NFEzJ+c2lG/A30cQ
	 7Yfae+4RZZJzpbc5NCXW6ro10MVWb2pnl1UjLJJpbIqCeimhF6rd6MAOJjuiT9vShq
	 390fFscYlI3CQXlVSo1B5uV+xyFkwvFQsHwBOcyvseipDfGwYWlnpZe9vCdjjxQyOo
	 FO6Rq+TY388komKZg0wazr3KCD6PHlJw+guVOQIoa1LwKlKJuQ/C+qDRAlicBTzSZI
	 gaQXtLQDgYMiUiHgOjI15svi7/jhrITspq4LzBE7oH5zIpZMU1YQ32HjZk4Uwf8Y+4
	 5BMcBw+15N2ng==
From: Kalle Valo <kvalo@kernel.org>
To: Robert Marko <robimarko@gmail.com>
Cc: Sven Eckelmann <sven@narfation.org>,  Tanjeff Moos
 <Tanjeff.Moos@westermo.com>,  openwrt-devel@lists.openwrt.org,  Felix
 Fietkau <nbd@nbd.name>,  ath11k@lists.infradead.org,  Jeff Johnson
 <quic_jjohnson@quicinc.com>
Subject: Re: Question to recent Qualcomm CVEs
References: <48174971-4b30-4046-9710-2acb16990e07@westermo.com>
	<87ttlvjk6l.fsf@kernel.org> <87il00qpjp.fsf@kernel.org>
	<4889305.GXAFRqVoOG@bentobox>
	<CAOX2RU4+j0GG+RxKDOF2qFWFBOZEo1+nLZt8FwNqJ30Qo1jjLg@mail.gmail.com>
Date: Tue, 30 Apr 2024 11:47:57 +0300
In-Reply-To: <CAOX2RU4+j0GG+RxKDOF2qFWFBOZEo1+nLZt8FwNqJ30Qo1jjLg@mail.gmail.com>
	(Robert Marko's message of "Mon, 29 Apr 2024 16:50:07 +0200")
Message-ID: <87plu7p77m.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_014804_011657_27AAF246 
X-CRM114-Status: GOOD (  16.75  )
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

Robert Marko <robimarko@gmail.com> writes:

> On Mon, 29 Apr 2024 at 15:37, Sven Eckelmann <sven@narfation.org> wrote:
>>
>> On Monday, 29 April 2024 15:14:18 CEST Kalle Valo wrote:
>> > It's quite strange that they updated 2.5.0.1 branch first but my
>> > understanding that there should be updates for the newer 2.7.0.1 branch
>> > as well (2.7.0.1 branch is also in linux-firmware).
>>
>> Yes, I also told them in the support ticket that this is from an older branch
>> than what is currently shipped in linux-firmware.git. But they told me
>> that they are working on newer versions (whatever that means) - but they
>> wanted to  handle first the update to ATH.11.4 (2.5.0.x) and then
>> step-by-step release it for newer firmware branches. It seem like that would be
>> up to 2.9.0.x - no idea why there is no (public) 2.10.x/2.11.x for the AP
>> SoCs.
>
> I would like to point out that IPQ6018 doesn't even have anything
> newer than 2.5.0.1 available publicly.

But I do see WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1 for IPQ6018:

https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/tree/main/IPQ6018/hw1.0/2.7.0.1/WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1?ref_type=heads

And that release seems to be also in linux-firmware:

File: ath11k/IPQ6018/hw1.0/q6_fw.mdt
Version: WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Am I missing something? Or did you mean IPQ5018 which only has a release
from 2.6.0.1 branch?

https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/tree/main/IPQ5018/hw1.0?ref_type=heads

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

