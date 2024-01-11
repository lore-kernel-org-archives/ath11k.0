Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6F6C47077
	for <ath11k@archiver.kernel.org>; Thu, 11 Jan 2024 16:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0NkqjSmoV2Lo2tV+B4RRs0IWFSi4JIdsulYwRFGzlsc=; b=gAHEXmH5+CE+zKy/Ld3pi2oOKF
	WO6o4kioLl1+kUncq1IIFuzbYL/yQ6VeqiU8Hvk8CzI4eSA2leLCAznLX5iKOQvXvzlGECu69v6XY
	aqsn0FLzrCFH9R196tXF4R3M7n/DS5QEtS/s4ZBQkkflCfH0OQUJaroAfIFqGTfiWuigmaNDW21Uf
	DtbP4cYJlE/TXzVgZDy8XOdRaxxbVoCFGQBklkfdKwBbIwizDio2CZkYdRLug6pkJh3C7FHNAYoMB
	yvLTUKJggTY12TWi7pt8KEOPk2HdjkS10GAu1+BHe4X4G28N4HVHe5c4/PDCZf+obIeoMhUilGimj
	FsLVpLXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNxbv-000Xhz-1u;
	Thu, 11 Jan 2024 16:08:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNxbs-000Xha-30
	for ath11k@lists.infradead.org;
	Thu, 11 Jan 2024 16:08:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6369161B0F;
	Thu, 11 Jan 2024 16:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C27C433C7;
	Thu, 11 Jan 2024 16:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704989328;
	bh=0+BrsDPlPGTnVAptII451a+IY2CU9MdrCfvLNwEyBTk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=YaqEqfRzGoDNo9HYYRxY7VOdQevSp8LjtmP47v6At6KsVVMF/r1t6nUySsFQlLekj
	 z5IuA0xPdA0hKGj64mZqEVLKxIa4yZRPO204U+8ScgX08f8iJfnHRIRDTJoxUPlIXE
	 AhTqZBX+GlFlWUV33cPOc9B1bL1AYFDl+TjKDXMWF0oXrHOZAPmOgzHhPfK7UWEBT2
	 cUTEB/auC/Md4F7Yd5QxJAG1Qp17Tem0opQFMCXn65Ue5sghI75mvJakETG0kIn50e
	 82TTQ0s/pLwKmnrpdIkdkZAUuAXkew8+GMDIGpl1IoI3itBRZ0Z3xJjCY6P/tVHmMq
	 LHKjwJUSCY/jg==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v10 00/12] wifi: ath11k: add support for 6 GHz station
 for various modes : LPI, SP and VLP
References: <20231218085844.2658-1-quic_bqiang@quicinc.com>
Date: Thu, 11 Jan 2024 18:08:45 +0200
In-Reply-To: <20231218085844.2658-1-quic_bqiang@quicinc.com> (Baochen Qiang's
	message of "Mon, 18 Dec 2023 16:58:32 +0800")
Message-ID: <87mstbam42.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_080849_030265_CC67614A 
X-CRM114-Status: GOOD (  13.25  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> This introduced some new concept:
> power type of AP(STANDARD_POWER_AP, INDOOR_AP, VERY_LOW_POWER_AP)
> power type of STATION(DEFAULT_CLIENT, SUBORDINATE_CLIENT)
> power spectral density(psd)
>
> This patchset is to implement the new rules for 6 GHz band in
> ath11k.
>
> ath11k parsed the reg rules from new WMI event
> WMI_REG_CHAN_LIST_CC_EXT_EVENTID and parse the
> transmit power envelope element in beacon of AP
> and then set new WMI command WMI_VDEV_SET_TPC_POWER_CMDID
> to firmware when connect to 6G AP, also support backward
> compatibility with firmware which not support new wmi
> cmd WMI_VDEV_SET_TPC_POWER_CMDID.
>
> v10:
>  1. [PATCH 02/12] wifi: ath11k: store cur_regulatory_info for each radio
>   a. s/muti/multi/
>  2. [PATCH v9 09/12] wifi: ath11k: fill parameters for vdev set tpc power WMI command
>   a. add idle_ps check when calculating EIRP.

I don't see Jeff's ack in patches 1, 11 and 12. Jeff, are you ok with
these?

I did some changes in the pending branch, below is a some kind of list
of the changes. The changed patches are available in the pending branch
(tag ath-pending-202401111604):

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/log/?h=pending

multiple patches

o whitespace changes, especially adding empty line before after if and
  for statements (also in other pathches)

patch 1

o remove unneeded parenthesis

patch 2

o ath11k_reg_reset_info(): invert if check

o ath11k_reg_reset_info(), ath11k_reg_handle_chan_list(),
  ath11k_reg_get_ar_vdev_type(), ath11k_reg_is_world_alpha:
       move to reg.c, I did also consider renaming these to use
       ath11k_wmi_ prefix but thought that reg.c is more approriate
       place for them

patch 11

o remove comments from enum wmi_tlv_cmd_id

o other cosmetic changes in wmi.h

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

