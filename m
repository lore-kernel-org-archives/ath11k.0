Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F13C433F5
	for <ath11k@archiver.kernel.org>; Sat, 26 Mar 2022 08:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Y0JwFURnqpQKqSv+81Z7cVqeUOmzfxf1K9CkpH+BWE=; b=L3hzyxiuRvW9s8
	7V4keOXtgOPefVJm9D5HEHuPft9wN4xjt/KRYv/uxMUuyRDZWnpPlxDmbBrxrAuLAgmpqW4Auh2aZ
	Nh80u1j5MFsv7ciyBdYTr+6wV3e/9xly4jPU9I0MQk8fyAYN2DDJXtUVX+J+ii7/KT8B1q611mFug
	aIG44LWUHF8pGW8xLGv0arnfBZ+l8UncCL9hCtRWUKidxn8pb0FOlFAVgXPeOnrsEDalL70yHhqxM
	CVCLNfwjIKvUj8V4yyTgwugSTuR1qoHjgKFQuCgxd6nYKskF9faTUYoF4CdvdeVMeCCSKUKWULvRC
	QUYPEFYJX5SKRtrEwZ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nY26A-0043DP-Tp; Sat, 26 Mar 2022 08:48:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nY265-0043CT-3J
 for ath11k@lists.infradead.org; Sat, 26 Mar 2022 08:48:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5A91960E44;
 Sat, 26 Mar 2022 08:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF1CC2BBE4;
 Sat, 26 Mar 2022 08:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648284508;
 bh=CWs64S7u0xalXvKpz9zCgW770mWGSrIjJcogyJjbcLg=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=CLpm8T5gs5sWV1cTCVsyg7NwM+WUCv1k2ipHkDwfw06Ih6W7bCGNOUQaOO4/qk9GG
 EljLeUN9AsUEDu1nR/mThtH9muvX8cRGO7igJbHt1dAr+X/hE9ENhcbcBCAfFO+o1W
 xyea1DqyKEAh2ZnrLVDtIHxWluOqNLRUTFIKh5+IURC3s2gMmMErK5UgbDO0Q99bQM
 rBuWtkg8nn76Dd2WXbgbW6llegrgBPGLIJbRuQhSROKapeFDtS0Pxmu6xxmrjojC6d
 c25ys0smg+imOgRFLiTa8WucKB3NnYRdZcex3xMX0ZBvWJKpP1i0nRgN04leZBo9cU
 oGAIFrtIjq3Sw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
 <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v6 1/3] nl80211: Add support for beacon tx mode
References: <20220325055949.3035053-1-quic_mkenna@quicinc.com>
 <20220325055949.3035053-2-quic_mkenna@quicinc.com>
 <bca5ba81-7e97-9b54-be57-a40df9b0634c@quicinc.com>
Date: Sat, 26 Mar 2022 10:48:23 +0200
In-Reply-To: <bca5ba81-7e97-9b54-be57-a40df9b0634c@quicinc.com> (Jeff
 Johnson's message of "Fri, 25 Mar 2022 12:18:41 -0700")
Message-ID: <87lewxnlpk.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220326_014833_222086_C54A5D99 
X-CRM114-Status: GOOD (  12.66  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 3/24/2022 10:59 PM, Maharaja Kennadyrajan wrote:
> [...snip...]
>
>> +/**
>> + * enum nl80211_beacon_tx_mode - Beacon Tx Mode enum.
>> + * @NL80211_BEACON_STAGGERED_MODE: Used to configure beacon tx mode as
>> + *	staggered mode. This is the default beacon tx mode.
>
> Documentation doesn't match the code. There is now a default mode, and
> that is, well, the default mode

But what does the default mode mean in this case? :) Please document in
detail what the driver is supposed to do in this mode.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
