Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53FAEE49B2
	for <ath11k@archiver.kernel.org>; Tue, 22 Aug 2023 19:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pAvL+AKcPK9n/dggrgZJ7Oxh/Khurp/q5PwBVeGUilE=; b=z6kC6gxzb92Xl3
	nh5Pn8mRy2Cc83rbbob85qrDxXmK+nslFO45ZPaR1FnFg6URCHm3Eg8MyHY52qdtdmQW9v/QFvbiR
	VHl/2gjDhX+hcuQsYQS1QzucDnSc4fYt7a9Km0TLyeeoPceEhZ0WX3tvJpKo1jJzYomGQaY0A+bKd
	GNOOh4rMV+kT5JQ/YoWUmXv6WtKAGLMJ+jAkOiV04nZYIK88UDL/RE1MXLgSzLdrallCns8edVL9m
	4L6K1T4b9hfB+uOnSqimSCUUWu2m1+2Qu+LxXd8PBEujYc/znULxUoGBA9rwQKxe2eALzFsEtDjs/
	sKnrPfltcITmYJBJPAzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYWmG-00Gh03-0c;
	Tue, 22 Aug 2023 19:10:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYWmD-00GgzD-1T;
	Tue, 22 Aug 2023 19:10:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E1128625CF;
	Tue, 22 Aug 2023 19:10:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69E6C433C7;
	Tue, 22 Aug 2023 19:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692731452;
	bh=nr4GjTppWgFW9yVzV6ogm5jejxBqzeEjyQ/mmPg7ulM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Iz566OCHSbLw3VM4P7vq7Fm1TDtZBmofK6vRl/IpLuSGhx2AUYPn/lT2kKfGWGcBN
	 /hDiBfPSXCfQo+c3a8Zg5RQ6kKgF/5reMx7136YY87GnpSjVE/fEa3VaDGXTO5o35W
	 kY1YjAW0yPnxsHXKp/sA7IDwtaHodn4188umUrevKX0ZTCpowonW2fLQ5AVpyKsZW2
	 i50Xt56Q6K28J2inoQ9QA8iUAIp/wPg5GAbubfhAbEL0XwPBACLt/RCJ7ke6owZbWi
	 K02rVDiHHxjMJjJig0iGylQhyBIW40PAgJPwRZE6Uzgi7IZG0V5Any/uJnu5d28AS7
	 9k427Nh6gRpNg==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,  <ath10k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <ath11k@lists.infradead.org>,  <ath12k@lists.infradead.org>
Subject: Re: [PATCH 3/3] wifi: ath12k: Fix a few spelling errors
References: <20230822-ath_spelling-v1-0-8e2698759564@quicinc.com>
	<20230822-ath_spelling-v1-3-8e2698759564@quicinc.com>
	<768de9a1-b186-c296-e9b9-d83cee1997a6@infradead.org>
	<1a9f7b7b-6e99-4cbb-a2e1-c76ed6b90a1d@quicinc.com>
Date: Tue, 22 Aug 2023 22:10:48 +0300
In-Reply-To: <1a9f7b7b-6e99-4cbb-a2e1-c76ed6b90a1d@quicinc.com> (Jeff
	Johnson's message of "Tue, 22 Aug 2023 09:43:08 -0700")
Message-ID: <87y1i2hozr.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_121053_540982_A657F12B 
X-CRM114-Status: GOOD (  12.01  )
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

> On 8/22/2023 9:18 AM, Randy Dunlap wrote:
>
>> Hi--
>> On 8/22/23 07:50, Jeff Johnson wrote:
>>> Fix a few issues flagged by 'codespell'.
>>>
>>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>>> ---
>>>   drivers/net/wireless/ath/ath12k/dp.h      | 2 +-
>>>   drivers/net/wireless/ath/ath12k/dp_rx.c   | 2 +-
>>>   drivers/net/wireless/ath/ath12k/dp_tx.c   | 2 +-
>>>   drivers/net/wireless/ath/ath12k/mac.c     | 2 +-
>>>   drivers/net/wireless/ath/ath12k/rx_desc.h | 2 +-
>>>   5 files changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
>>> index 0f2af2f14ef7..dbaf033c2527 100644
>>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>>> @@ -6771,7 +6771,7 @@ ath12k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
>>>   			/* After trigger disconnect, then upper layer will
>>>   			 * trigger connect again, then the PN number of
>>>   			 * upper layer will be reset to keep up with AP
>>> -			 * side, hence PN number mis-match will not happened.
>>> +			 * side, hence PN number mismatch will not happened.
>> The fix is good, but preferably also s/happened/happen/.
>
> Kalle, can you apply that when it goes to -pending?

Yes, did that now:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=212796e28fe44c0a4956c797d8b685b905784cd6

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
