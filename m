Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452D2C433F5
	for <ath11k@archiver.kernel.org>; Mon, 21 Mar 2022 10:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H2SJnCFbXoBtjsoDOUrLttx2EeO/jootFQmGI4eFG50=; b=UqbjTEuQWCch4u
	RenenLlPthsuUpTKw3YSnnyNJIBUTCjuFulQ88/p+YhsoRhD9sOqdPkA2/s3V7Q2X52BYQiLohKww
	CaBFXZGk8UOP3NBjy+ROdWHBw0ILRHQI81synDdzFtsjDQg9AJwIeDxMjleCJBVQNVqth1jGSvCws
	PmaNJMuNd9RlQ/TrPw+j47r/kLBSY75+DUaxdBOP8gHTvnD+FzLjMpv1q7GQVCb5ecDbTCrmy36tA
	HsU09OqtFAugmipn9wP2EdJDmVKJ5nXJTou24JZHohCFRf98I5GIyiG6l3CvQFPiR6OcM+OAdULa8
	8b9Efyv+l73XRlUuYUNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWFKc-007LSu-Qx; Mon, 21 Mar 2022 10:32:10 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWFKZ-007LSD-Rr
 for ath11k@lists.infradead.org; Mon, 21 Mar 2022 10:32:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 674FAB811FF;
 Mon, 21 Mar 2022 10:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B42C340E8;
 Mon, 21 Mar 2022 10:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647858725;
 bh=7ubJutBW2/q/fizJQLmvyldAnHZkqBrN10ep4adrdIk=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=MfaPX2jRF7vLAj+ug9g0bq8gJNaG7IrjxPos6H+BNQHkeKNdDTKlmQ7kheTk546AD
 nMqy4xf9EswJEzsL94NwKOrn2HzYw/5nIMh5jvMRBBuK6Pf+ROtTQDqg/PYBzp7XGB
 36zQRzpbKIMu3Lh1pYsDnrhEGm1n2PRtx83G36wYi020Rn1CD5vH2d3ZBJ7iOWij7q
 EJiSWb8EV1qN3YdOfA/5l7t2BKEHjjwLlG8VpXT/ADV+Fll4ap9aScUNF5ik5NkecF
 4Tcg3uD2U6PcB04yjuur/KhRz2bjXHrODjwxdEwAoa5hyns+GFpavQrdgEGkfKcMCL
 SBshaECyDphQg==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v6 0/2] ath11k: add handler for board-2.bin without
 variant and read SMBIOS
References: <20220315104721.26649-1-quic_wgong@quicinc.com>
Date: Mon, 21 Mar 2022 12:31:58 +0200
In-Reply-To: <20220315104721.26649-1-quic_wgong@quicinc.com> (Wen Gong's
 message of "Tue, 15 Mar 2022 06:47:19 -0400")
Message-ID: <878rt3oau9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_033208_089632_DA0405ED 
X-CRM114-Status: GOOD (  15.81  )
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

Wen Gong <quic_wgong@quicinc.com> writes:

> v6:
>    1. rebased to ath.git ath-202203101556
>    2. add error message if could not find any board data at last.
>    3. change "ath11k: add read variant from SMBIOS for download board data" for
>       add struct ath11k_smbios_bdf, strlen(), not mix defines and function declarations.
>
> v5:
>    1. rebased to ath.git ath-202112161538
>    2. fix warning "failed to fetch board data for bus=pci,qmi-chip-id=0,qmi-board-id=255,variant=DE_1901 from ath11k/QCA6390/hw2.0/board-2.bin"
>
> v4:
>    1. add helper function ath11k_core_create_fallback_board_name()
>    2. rebased to ath.git ath-202112071521
>
> v3:
>    1. add patch "ath11k: add fallback board name without variant while searching board-2.bin"
>    2. reabsed to latest ath.git master ath-202111221436
>
> v2: rebased to latest ath.git master ath-202111170737
>
> When it does not have matched board name with variant in board-2.bin,
> ath11k will fallback to search without variant.
>
> Also read the variant from SMBIOS.

Thanks, I now tested this patchset and looks to work perfectly now.

BTW, please add the change log here, that is after the description but
before the patch list below. In other words, the cover letter needs to
have the desription as the first thing.

> Wen Gong (2):
>   ath11k: add fallback board name without variant while searching
>     board-2.bin
>   ath11k: add read variant from SMBIOS for download board data
>
>  drivers/net/wireless/ath/ath11k/core.c | 116 +++++++++++++++++++++++--
>  drivers/net/wireless/ath/ath11k/core.h |  20 ++++-
>  drivers/net/wireless/ath/ath11k/qmi.c  |   4 +
>  3 files changed, 132 insertions(+), 8 deletions(-)
>
>
> base-commit: d845cf007bdf8b2bf41522e1ecd0eb804e553d57
> -- 
> 2.31.1

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
