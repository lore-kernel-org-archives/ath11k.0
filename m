Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB84C433F5
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 16:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S7he3eUull6nT8t4c+sXg429HA8nbC+tb5sReLoRMtE=; b=s9fdD/JU7YY1PC
	jvYtXfwTnFT+JdhyWChYGiSJ8O2Y1jI3n5PCEHvRrqswjof0U4JvpE2slPG1S9FuCZuyQFJ1b7Hou
	V3LYBhCKeIebvDOjCjp3ZTOGIOzsn2SFvSsYbMJZwQzeKYGA+n24Duyc98cCHzxQAQaLzoRuh5dz7
	jOm26kdfipOgB5McKlQR7lTI4ADlaws9xetYsvlduRQ+EjOROlCyF1pynQl71MKuZTV1ioXqxWvFm
	jrUVsTrdIS45aUhLjZ/8voItvZe+JfDkaacliN+wh0FrcWxNSJkrGplqD0mNeKoIz1nkE5H9FoJhc
	dFsvZScZEepMXVqWSWPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mudl0-009V8N-Be; Tue, 07 Dec 2021 16:55:58 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mudkw-009V7t-MQ
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 16:55:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 55786B816F8;
 Tue,  7 Dec 2021 16:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E1CC341C3;
 Tue,  7 Dec 2021 16:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638896152;
 bh=9wwvZs+yVczrOqKsz4pGQrP1UKcx4uLoOGbsJoo8H2M=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=nphsx6Rd66rCNlNGdY6Dp8ERYk2ICqU46OAl6F5yIA+xN3Cl9+fIX9AeAtqMAshAi
 lvYfYhC/qmypiJUwE2QPpRLpctqMYHq7Psygdx3PGPLt/o+lp0pUDf70QAxpJIbPzV
 y7vbiT2IXaXTrA8JYpFulTEFMPsk8q5WMAXETD9Jpi6XrtUDEZOox6luwIjyg5U1KT
 AsfR+16jrxtfexkKLPaPvQxtCnWkv9F2H7nndbopwSryDxUxDsQkaaV0ozMr3rp5ir
 Y2DIBaRb9usDvYsoqru/h+N2HbVYcsXMTJcn0uJmJcW6HL/4NlSO5w5sMfpEL4fEF1
 JQVnkA0sjjHcQ==
From: Kalle Valo <kvalo@kernel.org>
To: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCHv2 2/2] ath11k: add spectral/CFR buffer validation support
References: <1637312901-10279-1-git-send-email-quic_vnaralas@quicinc.com>
 <1637312901-10279-2-git-send-email-quic_vnaralas@quicinc.com>
Date: Tue, 07 Dec 2021 18:55:46 +0200
In-Reply-To: <1637312901-10279-2-git-send-email-quic_vnaralas@quicinc.com>
 (Venkateswara Naralasetty's message of "Fri, 19 Nov 2021 14:38:21
 +0530")
Message-ID: <87y24wmk19.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_085554_901884_66BBFD5E 
X-CRM114-Status: GOOD (  21.90  )
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

Venkateswara Naralasetty <quic_vnaralas@quicinc.com> writes:

> Currently there is no validation on the spectral/CFR report
> over the db ring buffers from the hardware. Improper/incomplete
> DMA by the target can result in invalid data received by host.
> Due to this we may populate incorrect data to user space.
>
> This buffer validation support fix this issues by filling some
> magic value in the buffer during buffer replenish and check for
> the magic value in the buffer received by the target. If host
> detect magic value in the received buffer it will drop the buffer.
>
> Tested-on: IPQ8074 WLAN.HK.2.4.0.1-01467-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
> ---
> v2:
>  * Rebased on TOT
>
>  drivers/net/wireless/ath/ath11k/dbring.c   | 32 ++++++++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath11k/dbring.h   |  1 +
>  drivers/net/wireless/ath/ath11k/spectral.c | 10 ++++++++++
>  3 files changed, 43 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath11k/dbring.c b/drivers/net/wireless/ath/ath11k/dbring.c
> index 31cf7ac..5c07442 100644
> --- a/drivers/net/wireless/ath/ath11k/dbring.c
> +++ b/drivers/net/wireless/ath/ath11k/dbring.c
> @@ -6,6 +6,37 @@
>  #include "core.h"
>  #include "debug.h"
>  
> +#define ATH11K_DB_MAGIC_VALUE 0xdeadbeaf
> +
> +int ath11k_dbring_validate_buffer(struct ath11k *ar, void *buffer, u32 size)
> +{
> +	u32 *temp;
> +	int idx;
> +
> +	size = size >> 2;
> +
> +	for (idx = 0, temp = buffer; idx < size; idx++, temp++) {
> +		if (*temp == ATH11K_DB_MAGIC_VALUE) {
> +			ath11k_warn(ar->ab, "found magic value in the buffer\n");

I moved the warning message to the callers to make it easier to identify
where the corruption is happening and also added the word "dropping" to
make the message clearer for the user.

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=6c90df4c7aca225c4c486f31ca956ae6c08abe59

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
